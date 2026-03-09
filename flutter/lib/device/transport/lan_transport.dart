import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'transport_interface.dart';

/// UDP-based LAN transport for communicating with WiFi-enabled Sky Zapper devices.
///
/// Sends and receives 255-byte packets over UDP port 7800.
class LanTransport implements DeviceTransport {
  static const int _devicePort = 7800;

  RawDatagramSocket? _socket;
  InternetAddress? _deviceAddress;
  bool _connected = false;
  final StreamController<Uint8List> _dataController =
      StreamController<Uint8List>.broadcast();

  @override
  String get connectionType => 'lan';

  @override
  bool get isConnected => _connected;

  @override
  Stream<Uint8List> get onData => _dataController.stream;

  @override
  Future<void> connect(String address) async {
    if (_connected) {
      await disconnect();
    }

    _deviceAddress = InternetAddress(address);

    // Bind to any available port on all interfaces.
    _socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);

    _socket!.listen(
      (RawSocketEvent event) {
        if (event == RawSocketEvent.read) {
          final datagram = _socket?.receive();
          if (datagram != null) {
            _dataController.add(Uint8List.fromList(datagram.data));
          }
        }
      },
      onError: (Object error) {
        _dataController.addError(error);
      },
      onDone: () {
        _connected = false;
      },
    );

    _connected = true;
  }

  @override
  Future<void> disconnect() async {
    _connected = false;
    _socket?.close();
    _socket = null;
    _deviceAddress = null;
  }

  @override
  Future<void> send(Uint8List data) async {
    if (!_connected || _socket == null || _deviceAddress == null) {
      throw StateError('LanTransport is not connected');
    }
    _socket!.send(data, _deviceAddress!, _devicePort);
  }

  /// Release resources. Call when the transport is no longer needed.
  void dispose() {
    _connected = false;
    _socket?.close();
    _socket = null;
    _dataController.close();
  }
}
