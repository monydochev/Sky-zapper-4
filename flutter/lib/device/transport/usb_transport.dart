import 'dart:async';
import 'dart:typed_data';

import 'transport_interface.dart';

/// Placeholder USB serial transport for Sky Zapper devices.
///
/// USB serial communication requires the `flutter_libserialport` package
/// (or equivalent) which provides native serial port access. This is only
/// supported on desktop platforms (Windows, macOS, Linux).
///
/// To implement:
///   1. Add `flutter_libserialport: ^0.4.0` to pubspec.yaml.
///   2. Open the serial port at 9600 baud, 8N1.
///   3. Write 255-byte packets and read responses on the same port.
///
/// Until then, all methods throw [UnsupportedError] to signal that USB
/// transport is not yet available.
class UsbTransport implements DeviceTransport {
  bool _connected = false;
  final StreamController<Uint8List> _dataController =
      StreamController<Uint8List>.broadcast();

  @override
  String get connectionType => 'usb';

  @override
  bool get isConnected => _connected;

  @override
  Stream<Uint8List> get onData => _dataController.stream;

  @override
  Future<void> connect(String address) async {
    // `address` would be the serial port path, e.g. "COM3" or "/dev/ttyUSB0".
    //
    // Implementation outline:
    //   final port = SerialPort(address);
    //   port.openReadWrite();
    //   port.config = SerialPortConfig()
    //     ..baudRate = 9600
    //     ..bits = 8
    //     ..stopBits = 1
    //     ..parity = SerialPortParity.none;
    //   _reader = SerialPortReader(port);
    //   _reader.stream.listen((data) => _dataController.add(Uint8List.fromList(data)));
    //   _connected = true;

    throw UnsupportedError(
      'USB serial transport is not yet implemented. '
      'Add flutter_libserialport to pubspec.yaml and implement '
      'UsbTransport.connect() for desktop platforms.',
    );
  }

  @override
  Future<void> disconnect() async {
    _connected = false;
    // port?.close();
  }

  @override
  Future<void> send(Uint8List data) async {
    if (!_connected) {
      throw StateError('UsbTransport is not connected');
    }

    // Implementation outline:
    //   port.write(data);

    throw UnsupportedError(
      'USB serial transport is not yet implemented.',
    );
  }

  /// Release resources.
  void dispose() {
    _connected = false;
    _dataController.close();
  }
}
