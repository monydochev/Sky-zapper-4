import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants.dart';
import '../data/models/device_state.dart';
import '../data/repositories/options_repository.dart';
import '../device/protocol/commands.dart';

enum ConnectionType { none, usb, lan }

class DeviceConnectionState {
  final bool isConnected;
  final ConnectionType connectionType;
  final String? connectedIp;
  final DeviceInfo? deviceInfo;
  final bool isScanning;
  final List<String> discoveredDevices;
  final String? error;

  const DeviceConnectionState({
    this.isConnected = false,
    this.connectionType = ConnectionType.none,
    this.connectedIp,
    this.deviceInfo,
    this.isScanning = false,
    this.discoveredDevices = const [],
    this.error,
  });

  DeviceConnectionState copyWith({
    bool? isConnected,
    ConnectionType? connectionType,
    String? connectedIp,
    DeviceInfo? deviceInfo,
    bool? isScanning,
    List<String>? discoveredDevices,
    String? error,
    bool clearDevice = false,
    bool clearError = false,
    bool clearIp = false,
  }) {
    return DeviceConnectionState(
      isConnected: isConnected ?? this.isConnected,
      connectionType: connectionType ?? this.connectionType,
      connectedIp: clearIp ? null : (connectedIp ?? this.connectedIp),
      deviceInfo: clearDevice ? null : (deviceInfo ?? this.deviceInfo),
      isScanning: isScanning ?? this.isScanning,
      discoveredDevices: discoveredDevices ?? this.discoveredDevices,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class DeviceConnectionNotifier extends Notifier<DeviceConnectionState> {
  /// Persistent UDP socket on port 7800 — like Delphi IdUDPServer1
  RawDatagramSocket? _udpSocket;
  Timer? _heartbeatTimer;
  DateTime? _lastResponse;

  final OptionsRepository _optionsRepo = OptionsRepository();

  /// Discovery packet: [0x00, 0x02, 0x09, 0x00, 0xFF, 0x00, 0x00]
  /// Identical to Delphi sendReadAll_Network
  static final Uint8List _discoveryPacket =
      Uint8List.fromList([0, 2, 9, 0, 255, 0, 0]);

  @override
  DeviceConnectionState build() {
    ref.onDispose(() {
      _cleanup();
    });
    return const DeviceConnectionState();
  }

  void _cleanup() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
    _udpSocket?.close();
    _udpSocket = null;
    _lastResponse = null;
  }

  // ---------------------------------------------------------------------------
  // UDP socket — like Delphi IdUDPServer1
  // ---------------------------------------------------------------------------

  /// Ensure the UDP socket is open on port 7800
  Future<RawDatagramSocket> _ensureUdpSocket() async {
    if (_udpSocket != null) return _udpSocket!;

    _udpSocket = await RawDatagramSocket.bind(
      InternetAddress.anyIPv4,
      AppConstants.udpPort,
      reuseAddress: true,
      reusePort: true,
    );
    _udpSocket!.broadcastEnabled = true;
    debugPrint('[UDP] Server started on port ${_udpSocket!.port}');

    _udpSocket!.listen(
      (event) {
        if (event == RawSocketEvent.read) {
          final datagram = _udpSocket?.receive();
          if (datagram != null) {
            _onUdpData(datagram);
          }
        }
      },
      onError: (e) {
        debugPrint('[UDP] Socket error: $e');
      },
      onDone: () {
        debugPrint('[UDP] Socket closed');
        _udpSocket = null;
      },
    );

    return _udpSocket!;
  }

  /// Close and recreate the UDP socket (for fresh scan)
  Future<RawDatagramSocket> _freshUdpSocket() async {
    _udpSocket?.close();
    _udpSocket = null;
    return _ensureUdpSocket();
  }

  // ---------------------------------------------------------------------------
  // UDP receive handler — like Delphi IdUDPServer1UDPRead
  // ---------------------------------------------------------------------------

  /// Devices found during current scan
  List<String> _scanResults = [];
  bool _scanning = false;

  void _onUdpData(Datagram datagram) {
    final data = Uint8List.fromList(datagram.data);
    final ip = datagram.address.address;

    debugPrint('[UDP] Recv from $ip (${data.length}B) '
        '[${data.take(8).map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}]');

    _lastResponse = DateTime.now();

    // Check for device status response: [0x02, 0x00, 137, 0x00, MAC...]
    if (data.length >= 8 &&
        data[0] == 2 &&
        data[1] == 0 &&
        data[2] == Commands.respStatus &&
        data[3] == 0) {
      final mac = data
          .sublist(4, 8)
          .map((b) => b.toRadixString(16).padLeft(2, '0'))
          .join();
      debugPrint('[UDP] ✓ Device: $ip (MAC: $mac)');

      // During scan — add to scan results
      if (_scanning && !_scanResults.contains(ip)) {
        _scanResults.add(ip);
        state = state.copyWith(discoveredDevices: List.from(_scanResults));
      }
    }
  }

  // ---------------------------------------------------------------------------
  // Send UDP command — like Delphi IdUDPServer1.SendBuffer
  // ---------------------------------------------------------------------------

  Future<void> sendCommand(Uint8List data) async {
    final ip = state.connectedIp;
    if (ip == null) return;

    try {
      final socket = await _ensureUdpSocket();
      socket.send(data, InternetAddress(ip), AppConstants.udpPort);
    } catch (e) {
      debugPrint('[UDP] Send error: $e');
    }
  }

  // ---------------------------------------------------------------------------
  // Scan — broadcast
  // ---------------------------------------------------------------------------

  Future<void> scanBroadcast() async {
    state = state.copyWith(
      isScanning: true,
      discoveredDevices: [],
      clearError: true,
    );
    _scanResults = [];
    _scanning = true;

    try {
      final socket = await _freshUdpSocket();

      debugPrint('[Broadcast] Sending ReadAll to 255.255.255.255:${AppConstants.udpPort}');
      socket.send(
        _discoveryPacket,
        InternetAddress('255.255.255.255'),
        AppConstants.udpPort,
      );

      await Future.delayed(const Duration(seconds: 3));

      debugPrint('[Broadcast] Done. Found ${_scanResults.length} device(s)');
      _scanning = false;
      state = state.copyWith(
        isScanning: false,
        discoveredDevices: List.from(_scanResults),
      );
    } catch (e) {
      debugPrint('[Broadcast] Error: $e');
      _scanning = false;
      state = state.copyWith(isScanning: false, error: e.toString());
    }
  }

  // ---------------------------------------------------------------------------
  // Scan — subnet (like Delphi ButtonSearchZappersNetworkClick)
  // ---------------------------------------------------------------------------

  Future<void> scanSubnet() async {
    state = state.copyWith(
      isScanning: true,
      discoveredDevices: [],
      clearError: true,
    );
    _scanResults = [];
    _scanning = true;

    try {
      final localIp = await _getLocalIp();
      if (localIp == null) {
        _scanning = false;
        state = state.copyWith(
          isScanning: false,
          error: 'Could not detect local IP address',
        );
        return;
      }

      final parts = localIp.split('.');
      if (parts.length != 4) {
        _scanning = false;
        state = state.copyWith(
          isScanning: false,
          error: 'Invalid local IP: $localIp',
        );
        return;
      }

      final subnet = '${parts[0]}.${parts[1]}.${parts[2]}';
      debugPrint('[Subnet] Local IP: $localIp, scanning $subnet.2-254');

      final socket = await _freshUdpSocket();

      for (int i = 2; i <= 254; i++) {
        // Stop early if device found (like Delphi: if Connection_Type <> -1 then Break)
        if (_scanResults.isNotEmpty) {
          debugPrint('[Subnet] Device found, stopping early');
          break;
        }

        final targetIp = '$subnet.$i';
        try {
          socket.send(
            _discoveryPacket,
            InternetAddress(targetIp),
            AppConstants.udpPort,
          );
        } catch (_) {}

        // 10ms delay (Delphi: Sleep(10))
        await Future.delayed(const Duration(milliseconds: 10));
      }

      // Wait extra 2 seconds for late responses
      await Future.delayed(const Duration(seconds: 2));

      debugPrint('[Subnet] Done. Found ${_scanResults.length} device(s)');
      _scanning = false;
      state = state.copyWith(
        isScanning: false,
        discoveredDevices: List.from(_scanResults),
      );
    } catch (e) {
      debugPrint('[Subnet] Error: $e');
      _scanning = false;
      state = state.copyWith(isScanning: false, error: e.toString());
    }
  }

  // ---------------------------------------------------------------------------
  // Select device — like Delphi ButtonUSE_NetworkClick
  // ---------------------------------------------------------------------------

  /// Select a discovered device: save IP to DB, send ReadAll, start heartbeat
  Future<void> selectDevice(String ip) async {
    debugPrint('[Connect] Selecting device at $ip');

    // Save to options DB (like Delphi ADOQueryOptions network_ip)
    try {
      await _optionsRepo.updateNetworkIp(ip);
      await _optionsRepo.updateComPort('');
    } catch (e) {
      debugPrint('[Connect] Failed to save options: $e');
    }

    state = state.copyWith(
      isConnected: true,
      connectionType: ConnectionType.lan,
      connectedIp: ip,
      clearError: true,
    );

    // Send ReadAll to get device status
    final socket = await _ensureUdpSocket();
    socket.send(_discoveryPacket, InternetAddress(ip), AppConstants.udpPort);

    _lastResponse = DateTime.now();
    _startHeartbeat();
  }

  // ---------------------------------------------------------------------------
  // Heartbeat — like Delphi TimerCheck_Connections
  // ---------------------------------------------------------------------------

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (_lastResponse != null) {
        final diff = DateTime.now().difference(_lastResponse!);
        if (diff.inSeconds > 20) {
          debugPrint('[Heartbeat] No response for 20s, disconnecting');
          disconnect();
          return;
        }
      }

      // Send ReadAll as keepalive
      final ip = state.connectedIp;
      if (ip != null && _udpSocket != null) {
        _udpSocket!.send(
            _discoveryPacket, InternetAddress(ip), AppConstants.udpPort);
      }
    });
  }

  // ---------------------------------------------------------------------------
  // Disconnect
  // ---------------------------------------------------------------------------

  void disconnect() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
    _lastResponse = null;
    state = DeviceConnectionState(
      discoveredDevices: state.discoveredDevices,
    );
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  Future<String?> _getLocalIp() async {
    try {
      final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
        includeLoopback: false,
      );
      for (final iface in interfaces) {
        for (final addr in iface.addresses) {
          if (!addr.address.startsWith('169.254') &&
              !addr.address.startsWith('127.')) {
            return addr.address;
          }
        }
      }
    } catch (_) {}
    return null;
  }

  void updateDeviceInfo(DeviceInfo info) {
    state = state.copyWith(deviceInfo: info);
  }
}

final deviceConnectionProvider =
    NotifierProvider<DeviceConnectionNotifier, DeviceConnectionState>(
  DeviceConnectionNotifier.new,
);
