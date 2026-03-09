import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../protocol/commands.dart';
import '../protocol/packet_builder.dart';

/// A device discovered on the local network.
class DiscoveredDevice {
  /// IP address of the device.
  final String ip;

  /// 4 MAC bytes extracted from the ping response.
  final List<int> macBytes;

  /// Full MAC as an 8-character hex string.
  final String fullMac;

  /// Short MAC (first 4 hex chars) identifying the device model.
  final String shortMac;

  const DiscoveredDevice({
    required this.ip,
    required this.macBytes,
    required this.fullMac,
    required this.shortMac,
  });

  @override
  String toString() => 'DiscoveredDevice(ip: $ip, mac: $fullMac)';
}

/// Scans the local /24 subnet for Sky Zapper devices via UDP ping.
///
/// Sends a ping packet (CMD 26 / sub 60) to every address from x.x.x.2
/// through x.x.x.255 on port 7800 and collects responses that echo the
/// ping pattern (response code 154, sub 60).
class LanScanner {
  static const int _devicePort = 7800;
  static const Duration _scanTimeout = Duration(seconds: 5);

  /// Scan the local network and return all discovered devices.
  ///
  /// [localIp] can be provided explicitly; otherwise it is detected
  /// automatically from the device's network interfaces.
  Future<List<DiscoveredDevice>> scan({String? localIp}) async {
    final ip = localIp ?? await _getLocalIp();
    if (ip == null) {
      return [];
    }

    final subnet = _getSubnet(ip);
    if (subnet == null) {
      return [];
    }

    final discovered = <DiscoveredDevice>[];
    final completer = Completer<List<DiscoveredDevice>>();

    RawDatagramSocket? socket;
    try {
      socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);

      // Listen for ping responses.
      socket.listen((RawSocketEvent event) {
        if (event == RawSocketEvent.read) {
          final datagram = socket?.receive();
          if (datagram != null && datagram.data.length >= 8) {
            final data = Uint8List.fromList(datagram.data);
            // Check for advanced response (154) with ping sub-command (60).
            if (data[2] == Commands.respAdvanced &&
                data[3] == Commands.subPing) {
              final macBytes = <int>[data[4], data[5], data[6], data[7]];
              final fullMac = macBytes
                  .map((b) => b.toRadixString(16).padLeft(2, '0'))
                  .join();
              final shortMac = fullMac.substring(0, 4);
              discovered.add(DiscoveredDevice(
                ip: datagram.address.address,
                macBytes: macBytes,
                fullMac: fullMac,
                shortMac: shortMac,
              ));
            }
          }
        }
      });

      // Build the ping packet.
      final pingPacket = PacketBuilder.buildPing(isLan: true);

      // Send ping to every host on the subnet.
      for (int i = 2; i <= 255; i++) {
        final targetIp = '$subnet.$i';
        try {
          socket.send(
            pingPacket,
            InternetAddress(targetIp),
            _devicePort,
          );
        } catch (_) {
          // Ignore send failures for individual IPs.
        }
      }

      // Wait for responses.
      Timer(_scanTimeout, () {
        if (!completer.isCompleted) {
          completer.complete(discovered);
        }
      });

      return await completer.future;
    } finally {
      socket?.close();
    }
  }

  /// Get the subnet prefix (first 3 octets) from an IP address.
  String? _getSubnet(String ip) {
    final parts = ip.split('.');
    if (parts.length != 4) return null;
    return '${parts[0]}.${parts[1]}.${parts[2]}';
  }

  /// Detect the local IPv4 address from the device's network interfaces.
  Future<String?> _getLocalIp() async {
    try {
      final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
        includeLoopback: false,
      );
      for (final interface_ in interfaces) {
        for (final addr in interface_.addresses) {
          // Skip link-local addresses.
          if (!addr.address.startsWith('169.254') &&
              !addr.address.startsWith('127.')) {
            return addr.address;
          }
        }
      }
    } catch (_) {
      // Network interface enumeration not available on all platforms.
    }
    return null;
  }
}
