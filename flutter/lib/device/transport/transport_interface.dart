import 'dart:typed_data';

/// Abstract interface for device communication transports.
///
/// Concrete implementations exist for LAN (UDP) and USB (serial).
/// The rest of the application interacts with devices through this interface
/// so transport details are hidden.
abstract class DeviceTransport {
  /// Connect to a device at [address].
  ///
  /// For LAN transport, [address] is an IP (e.g. "192.168.1.100").
  /// For USB transport, [address] is a serial port path (e.g. "/dev/ttyUSB0").
  Future<void> connect(String address);

  /// Disconnect from the currently connected device.
  Future<void> disconnect();

  /// Send a raw packet [data] to the device.
  Future<void> send(Uint8List data);

  /// Stream of incoming packets from the device.
  Stream<Uint8List> get onData;

  /// Whether the transport is currently connected to a device.
  bool get isConnected;

  /// Transport type identifier: `'usb'` or `'lan'`.
  String get connectionType;
}
