import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants.dart';
import '../data/models/device_state.dart';
import '../device/protocol/commands.dart';

enum ConnectionType { none, usb, lan }

class DeviceConnectionState {
  final bool isConnected;
  final ConnectionType connectionType;
  final DeviceInfo? deviceInfo;
  final bool isScanning;
  final List<String> discoveredDevices;
  final String? error;

  const DeviceConnectionState({
    this.isConnected = false,
    this.connectionType = ConnectionType.none,
    this.deviceInfo,
    this.isScanning = false,
    this.discoveredDevices = const [],
    this.error,
  });

  DeviceConnectionState copyWith({
    bool? isConnected,
    ConnectionType? connectionType,
    DeviceInfo? deviceInfo,
    bool? isScanning,
    List<String>? discoveredDevices,
    String? error,
    bool clearDevice = false,
    bool clearError = false,
  }) {
    return DeviceConnectionState(
      isConnected: isConnected ?? this.isConnected,
      connectionType: connectionType ?? this.connectionType,
      deviceInfo: clearDevice ? null : (deviceInfo ?? this.deviceInfo),
      isScanning: isScanning ?? this.isScanning,
      discoveredDevices: discoveredDevices ?? this.discoveredDevices,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class DeviceConnectionNotifier extends Notifier<DeviceConnectionState> {
  Socket? _tcpSocket;
  Timer? _heartbeatTimer;
  DateTime? _lastPingResponse;
  StreamSubscription<Uint8List>? _tcpSubscription;

  void Function(Uint8List data)? onDataReceived;

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
    _tcpSubscription?.cancel();
    _tcpSubscription = null;
    _tcpSocket?.destroy();
    _tcpSocket = null;
    _lastPingResponse = null;
  }

  /// Check if UDP response is a device status: [0x02, 0x00, 137, 0x00, MAC...]
  bool _isDeviceResponse(Uint8List data) {
    return data.length >= 8 &&
        data[0] == 2 &&
        data[1] == 0 &&
        data[2] == Commands.respStatus &&
        data[3] == 0;
  }

  String _extractMac(Uint8List data) {
    return data
        .sublist(4, 8)
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join();
  }

  /// Helper: open a UDP socket on port 7800, listen for device responses,
  /// execute [sendPackets] callback to send discovery packets,
  /// wait [timeout] for responses, close socket, return found devices.
  Future<List<String>> _udpScan({
    required Future<void> Function(RawDatagramSocket socket) sendPackets,
    Duration timeout = const Duration(seconds: 3),
  }) async {
    final devices = <String>[];

    final socket = await RawDatagramSocket.bind(
      InternetAddress.anyIPv4,
      AppConstants.udpPort,
      reuseAddress: true,
      reusePort: true,
    );
    socket.broadcastEnabled = true;
    debugPrint('[UDP] Bound to port ${socket.port}');

    final completer = Completer<void>();

    socket.listen((event) {
      if (event == RawSocketEvent.read) {
        final datagram = socket.receive();
        if (datagram != null) {
          final data = Uint8List.fromList(datagram.data);
          final ip = datagram.address.address;
          debugPrint('[UDP] Recv from $ip (${data.length}B) '
              '[${data.take(8).map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}]');
          if (_isDeviceResponse(data)) {
            final mac = _extractMac(data);
            debugPrint('[UDP] ✓ Device: $ip (MAC: $mac)');
            if (!devices.contains(ip)) {
              devices.add(ip);
            }
          }
        }
      }
    });

    // Send packets
    await sendPackets(socket);

    // Wait for responses
    Timer(timeout, () {
      if (!completer.isCompleted) completer.complete();
    });
    await completer.future;

    socket.close();
    debugPrint('[UDP] Scan done. Found ${devices.length} device(s)');
    return devices;
  }

  // ---------------------------------------------------------------------------
  // Broadcast scan
  // ---------------------------------------------------------------------------

  Future<void> scanBroadcast() async {
    state = state.copyWith(
      isScanning: true,
      discoveredDevices: [],
      clearError: true,
    );

    try {
      debugPrint('[Broadcast] Sending ReadAll to 255.255.255.255:${AppConstants.udpPort}');
      final devices = await _udpScan(
        sendPackets: (socket) async {
          socket.send(
            _discoveryPacket,
            InternetAddress('255.255.255.255'),
            AppConstants.udpPort,
          );
        },
        timeout: const Duration(seconds: 3),
      );

      state = state.copyWith(
        isScanning: false,
        discoveredDevices: devices,
      );
    } catch (e) {
      debugPrint('[Broadcast] Error: $e');
      state = state.copyWith(isScanning: false, error: e.toString());
    }
  }

  // ---------------------------------------------------------------------------
  // Subnet scan — like Delphi ButtonSearchZappersNetworkClick
  // ---------------------------------------------------------------------------

  Future<void> scanSubnet() async {
    state = state.copyWith(
      isScanning: true,
      discoveredDevices: [],
      clearError: true,
    );

    try {
      final localIp = await _getLocalIp();
      if (localIp == null) {
        state = state.copyWith(
          isScanning: false,
          error: 'Could not detect local IP address',
        );
        return;
      }

      final parts = localIp.split('.');
      if (parts.length != 4) {
        state = state.copyWith(
          isScanning: false,
          error: 'Invalid local IP: $localIp',
        );
        return;
      }

      final subnet = '${parts[0]}.${parts[1]}.${parts[2]}';
      debugPrint('[Subnet] Local IP: $localIp, scanning $subnet.2-254');

      final devices = await _udpScan(
        sendPackets: (socket) async {
          for (int i = 2; i <= 254; i++) {
            final targetIp = '$subnet.$i';
            try {
              socket.send(
                _discoveryPacket,
                InternetAddress(targetIp),
                AppConstants.udpPort,
              );
            } catch (_) {
              // No route to host, etc — skip
            }
            // 10ms delay between sends (Delphi: Sleep(10))
            await Future.delayed(const Duration(milliseconds: 10));
          }
        },
        timeout: const Duration(seconds: 2),
      );

      state = state.copyWith(
        isScanning: false,
        discoveredDevices: devices,
      );
    } catch (e) {
      debugPrint('[Subnet] Error: $e');
      state = state.copyWith(isScanning: false, error: e.toString());
    }
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

  // ---------------------------------------------------------------------------
  // Connect / Disconnect
  // ---------------------------------------------------------------------------

  Future<void> connectLan(String ip) async {
    state = state.copyWith(clearError: true);

    try {
      _tcpSocket = await Socket.connect(ip, AppConstants.udpPort,
          timeout: const Duration(seconds: 5));

      _tcpSubscription = _tcpSocket!.listen(
        (data) {
          _lastPingResponse = DateTime.now();
          onDataReceived?.call(Uint8List.fromList(data));
        },
        onError: (error) {
          disconnect();
        },
        onDone: () {
          disconnect();
        },
      );

      _lastPingResponse = DateTime.now();
      _startHeartbeat();

      state = state.copyWith(
        isConnected: true,
        connectionType: ConnectionType.lan,
      );

      await sendCommand(Uint8List.fromList([0, 0, Commands.cmdReadAll, 0]));
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void updateDeviceInfo(DeviceInfo info) {
    state = state.copyWith(deviceInfo: info);
  }

  Future<void> sendCommand(Uint8List data) async {
    if (_tcpSocket != null) {
      try {
        _tcpSocket!.add(data);
        await _tcpSocket!.flush();
      } catch (e) {
        disconnect();
      }
    }
  }

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (_lastPingResponse != null) {
        final diff = DateTime.now().difference(_lastPingResponse!);
        if (diff.inSeconds > 20) {
          disconnect();
          return;
        }
      }
      sendCommand(Uint8List.fromList([0, 0, Commands.cmdAdvanced, Commands.subPing]));
    });
  }

  void disconnect() {
    _cleanup();
    state = const DeviceConnectionState();
  }
}

final deviceConnectionProvider =
    NotifierProvider<DeviceConnectionNotifier, DeviceConnectionState>(
  DeviceConnectionNotifier.new,
);
