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
  final List<String> discoveredDevices; // IP addresses
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
  Socket? _socket;
  Timer? _heartbeatTimer;
  DateTime? _lastPingResponse;
  StreamSubscription<Uint8List>? _socketSubscription;

  /// Callback for incoming data from device
  void Function(Uint8List data)? onDataReceived;

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
    _socketSubscription?.cancel();
    _socketSubscription = null;
    _socket?.destroy();
    _socket = null;
    _lastPingResponse = null;
  }

  /// Legacy discovery packet: [0x00, 0x02, 0x09, 0x00, 0xFF, 0x00, 0x00]
  /// Same as Delphi sendReadAll_Network — CMD 9 (ReadAll), 7 bytes, LAN flag=2
  static final Uint8List _discoveryPacket = Uint8List.fromList([0, 2, 9, 0, 255, 0, 0]);

  /// Check if a UDP response is a valid device status (respStatus=137)
  bool _isDeviceResponse(Uint8List data) {
    // Delphi check: _read[0]==2 AND _read[1]==0 AND _read[2]==137 AND _read[3]==0
    return data.length >= 8 &&
        data[0] == 2 &&
        data[1] == 0 &&
        data[2] == Commands.respStatus &&
        data[3] == 0;
  }

  /// Extract MAC info from a device response
  String _extractMac(Uint8List data) {
    return data.sublist(4, 8)
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join();
  }

  /// Broadcast scan — изпраща ReadAll на 255.255.255.255:7800
  /// Бърз, но може да не работи в някои мрежови конфигурации.
  Future<void> scanBroadcast() async {
    state = state.copyWith(
      isScanning: true,
      discoveredDevices: [],
      clearError: true,
    );

    try {
      final devices = <String>[];
      final socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        AppConstants.udpPort,
        reuseAddress: true,
        reusePort: true,
      );
      debugPrint('[Broadcast] Bound to port ${socket.port}');
      socket.broadcastEnabled = true;

      debugPrint('[Broadcast] Sending ReadAll to 255.255.255.255:${AppConstants.udpPort}');
      socket.send(
        _discoveryPacket,
        InternetAddress('255.255.255.255'),
        AppConstants.udpPort,
      );

      final completer = Completer<void>();
      Timer(const Duration(seconds: 3), () {
        if (!completer.isCompleted) completer.complete();
      });

      socket.listen((event) {
        if (event == RawSocketEvent.read) {
          final datagram = socket.receive();
          if (datagram != null) {
            final data = Uint8List.fromList(datagram.data);
            debugPrint('[Broadcast] Response from ${datagram.address.address} (${data.length} bytes) [${data.take(8).map((b) => '0x${b.toRadixString(16).padLeft(2, '0')}').join(', ')}]');
            if (_isDeviceResponse(data)) {
              final ip = datagram.address.address;
              final mac = _extractMac(data);
              if (!devices.contains(ip)) {
                debugPrint('[Broadcast] ✓ Device found: $ip (MAC: $mac)');
                devices.add(ip);
                state = state.copyWith(discoveredDevices: List.from(devices));
              }
            }
          }
        }
      });

      await completer.future;
      socket.close();

      debugPrint('[Broadcast] Scan complete. Found ${devices.length} device(s)');
      state = state.copyWith(
        isScanning: false,
        discoveredDevices: devices,
      );
    } catch (e) {
      debugPrint('[Broadcast] Error: $e');
      state = state.copyWith(
        isScanning: false,
        error: e.toString(),
      );
    }
  }

  /// Subnet scan — изпраща ReadAll до всеки IP в /24 подмрежата (2..254)
  /// с 10ms пауза между пакетите (legacy метод от Delphi версията).
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
      debugPrint('[Subnet] Local IP: $localIp, scanning $subnet.2-254 on port ${AppConstants.udpPort}');

      final devices = <String>[];
      final socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        AppConstants.udpPort,
        reuseAddress: true,
        reusePort: true,
      );
      debugPrint('[Subnet] Bound to port ${socket.port}');

      socket.listen((event) {
        debugPrint('[Subnet] Socket event: $event');
        if (event == RawSocketEvent.read) {
          final datagram = socket.receive();
          if (datagram != null) {
            final data = Uint8List.fromList(datagram.data);
            debugPrint('[Subnet] Response from ${datagram.address.address}:${datagram.port} (${data.length} bytes) [${data.take(8).map((b) => '0x${b.toRadixString(16).padLeft(2, '0')}').join(', ')}]');
            if (_isDeviceResponse(data)) {
              final ip = datagram.address.address;
              final mac = _extractMac(data);
              if (!devices.contains(ip)) {
                debugPrint('[Subnet] ✓ Device found: $ip (MAC: $mac)');
                devices.add(ip);
                state = state.copyWith(discoveredDevices: List.from(devices));
              }
            } else {
              debugPrint('[Subnet] Ignored response (not device status)');
            }
          }
        }
      });

      // Send ReadAll to each IP with 10ms delay (like Delphi legacy)
      for (int i = 2; i <= 254; i++) {
        final targetIp = '$subnet.$i';
        debugPrint('[Subnet] ReadAll -> $targetIp');
        try {
          socket.send(
            _discoveryPacket,
            InternetAddress(targetIp),
            AppConstants.udpPort,
          );
        } on SocketException catch (e) {
          debugPrint('[Subnet] Failed $targetIp: $e');
        } catch (e) {
          debugPrint('[Subnet] Failed $targetIp: $e');
        }
        // 10ms delay between sends (matches Delphi Sleep(10))
        await Future.delayed(const Duration(milliseconds: 10));
      }

      // Wait extra 2 seconds for late responses
      await Future.delayed(const Duration(seconds: 2));
      socket.close();

      debugPrint('[Subnet] Scan complete. Found ${devices.length} device(s)');
      state = state.copyWith(
        isScanning: false,
        discoveredDevices: devices,
      );
    } catch (e) {
      debugPrint('[Subnet] Error: $e');
      state = state.copyWith(
        isScanning: false,
        error: e.toString(),
      );
    }
  }

  /// Detect the local IPv4 address.
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

  Future<void> connectLan(String ip) async {
    state = state.copyWith(clearError: true);

    try {
      _socket = await Socket.connect(ip, AppConstants.udpPort,
          timeout: const Duration(seconds: 5));

      _socketSubscription = _socket!.listen(
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

      // Request device info
      await sendCommand(Uint8List.fromList([
        0,
        0,
        Commands.cmdReadAll,
        0,
      ]));
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void updateDeviceInfo(DeviceInfo info) {
    state = state.copyWith(deviceInfo: info);
  }

  Future<void> sendCommand(Uint8List data) async {
    if (_socket != null) {
      try {
        _socket!.add(data);
        await _socket!.flush();
      } catch (e) {
        disconnect();
      }
    }
  }

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      // Check if we've received a response within 20 seconds
      if (_lastPingResponse != null) {
        final diff = DateTime.now().difference(_lastPingResponse!);
        if (diff.inSeconds > 20) {
          disconnect();
          return;
        }
      }

      // Send ping
      sendCommand(Uint8List.fromList([
        0,
        0,
        Commands.cmdAdvanced,
        Commands.subPing,
      ]));
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
