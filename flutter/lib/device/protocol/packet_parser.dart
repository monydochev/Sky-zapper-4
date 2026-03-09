import 'dart:typed_data';

import '../../data/models/device_state.dart';
import 'byte_offsets.dart';
import 'commands.dart';
import 'win1251.dart';

/// Parsed result returned by [PacketParser.parse].
class ParsedPacket {
  /// The response type that was identified.
  final PacketType type;

  /// Populated for [PacketType.status] responses (CMD 9 reply).
  final DeviceInfo? deviceInfo;

  /// Sub-command code for advanced responses.
  final int? subCommand;

  /// Payload bytes (interpretation depends on [type] and [subCommand]).
  final Uint8List? payload;

  /// Human-readable description (e.g. error text).
  final String? message;

  const ParsedPacket({
    required this.type,
    this.deviceInfo,
    this.subCommand,
    this.payload,
    this.message,
  });
}

/// High-level packet type.
enum PacketType {
  status,
  success,
  error,
  advanced,
  advancedError,
  unknown,
}

/// Parses incoming device response packets.
class PacketParser {
  PacketParser._();

  // ---------------------------------------------------------------------------
  // Main entry point
  // ---------------------------------------------------------------------------

  /// Parse a raw 255-byte response [data] from the device.
  static ParsedPacket parse(Uint8List data) {
    if (data.length < 4) {
      return const ParsedPacket(
        type: PacketType.unknown,
        message: 'Packet too short',
      );
    }

    final cmd = data[2];

    switch (cmd) {
      case Commands.respStatus:
        return _parseStatus(data);
      case Commands.respSuccess:
        return const ParsedPacket(type: PacketType.success);
      case Commands.respError:
        return const ParsedPacket(
          type: PacketType.error,
          message: 'Device returned error',
        );
      case Commands.respAdvanced:
        return _parseAdvanced(data);
      case Commands.respAdvancedError:
        return ParsedPacket(
          type: PacketType.advancedError,
          subCommand: data[3],
          message: 'Advanced command error (sub=${data[3]})',
        );
      default:
        return ParsedPacket(
          type: PacketType.unknown,
          message: 'Unknown response code: $cmd',
        );
    }
  }

  // ---------------------------------------------------------------------------
  // Status packet (response to CMD 9)
  // ---------------------------------------------------------------------------

  static ParsedPacket _parseStatus(Uint8List data) {
    // MAC bytes are at positions 4, 5, 6, 7
    final macBytes = <int>[data[4], data[5], data[6], data[7]];
    final shortMac = macBytes
        .sublist(0, 2)
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join();
    final fullMac = macBytes
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join();

    // Serial number: bytes 8-9 (16-bit LE)
    final serialNumber = data[8] | (data[9] << 8);

    // Factory PIN: bytes 10-13 for basic models interpreted as text,
    // but for consistency we read 4 bytes as ASCII digits from offset 50-53
    // on WiFi models. We'll use a simplified extraction based on model.
    final offsets = ByteOffsets.forModel(shortMac);

    // Cloud service URL: bytes 18..47 (30 bytes, null-terminated ASCII)
    final cloudUrlBytes = data.sublist(18, 48);
    final cloudService = _readNullTerminatedAscii(cloudUrlBytes);

    // Cloud port: bytes 48-49 (16-bit LE)
    final cloudPort = data[48] | (data[49] << 8);

    // Factory PIN: bytes 50-53 (4 ASCII digits)
    final factoryPin = String.fromCharCodes(
      data.sublist(50, 54).where((b) => b >= 0x20 && b <= 0x7E),
    );

    // Additional PIN: bytes 67-70 (4 ASCII digits)
    final additionalPin = String.fromCharCodes(
      data.sublist(67, 71).where((b) => b >= 0x20 && b <= 0x7E),
    );

    // Settings from model-specific offsets
    final power = data[offsets.power];
    final duration =
        data[offsets.durationFrequenceTime] |
        (data[offsets.durationFrequenceTime + 1] << 8);
    final freq = data[offsets.freq];
    final zumer = data[offsets.zumer];
    final sweep = data[offsets.sweep];

    // WiFi settings (WiFi models only)
    int wifiEnabled = 0;
    int wifiApTimeout = 0;
    int wifiApNoActTimeout = 0;
    if (offsets.wifi != null) {
      wifiEnabled = data[offsets.wifi!];
      wifiApTimeout = data[offsets.wifiAP!];
      wifiApNoActTimeout = data[offsets.wifiAPNoAct!];
    }

    // Silver water
    final currentSetPoint = data[offsets.currentSetPoint];
    final waterQuantity =
        data[offsets.waterQuantity] | (data[offsets.waterQuantity + 1] << 8);
    final silverConcentration = data[offsets.silverConcentration];
    final silverWaterOn = data[offsets.silverWaterOn];
    final currentSence =
        data[offsets.currentSence] | (data[offsets.currentSence + 1] << 8);
    final silverWaterTime =
        data[offsets.silverWatterTime] |
        (data[offsets.silverWatterTime + 1] << 8) |
        (data[offsets.silverWatterTime + 2] << 16) |
        (data[offsets.silverWatterTime + 3] << 24);
    final silverWaterRemain =
        data[offsets.silverWaterRemain] |
        (data[offsets.silverWaterRemain + 1] << 8) |
        (data[offsets.silverWaterRemain + 2] << 16) |
        (data[offsets.silverWaterRemain + 3] << 24);

    // Quick slots (WiFi models: bytes 73-120, 4 bytes each)
    final quickSlots = <QuickSlot>[];
    final isWifi =
        shortMac == '8030' ||
        shortMac == '8031' ||
        shortMac == '8041' ||
        shortMac == '8042';
    if (isWifi) {
      for (int slot = 0; slot < 12; slot++) {
        final base = 73 + slot * 4;
        if (base + 3 < data.length) {
          final catId = data[base] | (data[base + 1] << 8);
          final progId = data[base + 2] | (data[base + 3] << 8);
          quickSlots.add(QuickSlot(
            slotIndex: slot + 1,
            categoryId: catId,
            programId: progId,
          ));
        }
      }
    }

    final info = DeviceInfo(
      shortMac: shortMac,
      fullMac: fullMac,
      macBytes: macBytes,
      serialNumber: serialNumber,
      factoryPin: factoryPin,
      additionalPin: additionalPin,
      cloudService: cloudService.isNotEmpty ? cloudService : 'cloud.sky.bg',
      cloudPort: cloudPort > 0 ? cloudPort : 7433,
      power: power,
      duration: duration,
      freq: freq,
      zumer: zumer,
      sweep: sweep,
      wifiEnabled: wifiEnabled,
      wifiApTimeout: wifiApTimeout,
      wifiApNoActTimeout: wifiApNoActTimeout,
      currentSetPoint: currentSetPoint,
      waterQuantity: waterQuantity,
      silverConcentration: silverConcentration,
      silverWaterOn: silverWaterOn,
      currentSence: currentSence,
      silverWaterTime: silverWaterTime,
      silverWaterRemain: silverWaterRemain,
      quickSlots: quickSlots,
    );

    return ParsedPacket(type: PacketType.status, deviceInfo: info);
  }

  // ---------------------------------------------------------------------------
  // Advanced response (CMD 154)
  // ---------------------------------------------------------------------------

  static ParsedPacket _parseAdvanced(Uint8List data) {
    final sub = data[3];

    switch (sub) {
      case Commands.subBlockStart: // 50 - block start ack
        return ParsedPacket(
          type: PacketType.advanced,
          subCommand: sub,
          message: 'Block start acknowledged',
        );

      case Commands.subBlockSend: // 51 - block send ack
        return ParsedPacket(
          type: PacketType.advanced,
          subCommand: sub,
          message: 'Block data acknowledged',
        );

      case Commands.subBlockEnd: // 52 - block end ack
        return ParsedPacket(
          type: PacketType.advanced,
          subCommand: sub,
          message: 'Block transfer complete',
        );

      case 6: // Firmware / version info
        return ParsedPacket(
          type: PacketType.advanced,
          subCommand: sub,
          payload: Uint8List.fromList(data.sublist(4)),
          message: 'Version info',
        );

      case Commands.subScanNetworks: // 17 - WiFi scan results
        return _parseWifiScanResults(data);

      case Commands.subReadWifiStatus: // 16 - WiFi status
        return _parseWifiStatus(data);

      case Commands.subReadHotspot: // 20 - Hotspot status
        return _parseHotspotStatus(data);

      case Commands.subPing: // 60 - ping echo
        return ParsedPacket(
          type: PacketType.advanced,
          subCommand: sub,
          payload: Uint8List.fromList(data.sublist(4, 8)),
          message: 'Ping response',
        );

      default:
        return ParsedPacket(
          type: PacketType.advanced,
          subCommand: sub,
          payload: Uint8List.fromList(data.sublist(4)),
        );
    }
  }

  // ---------------------------------------------------------------------------
  // WiFi scan results (154 / 17)
  // ---------------------------------------------------------------------------

  static ParsedPacket _parseWifiScanResults(Uint8List data) {
    // Scan results start at byte 4.
    // Each entry is a null-terminated SSID string followed by RSSI byte.
    // The list ends when we hit a double-null or run out of data.
    final payload = Uint8List.fromList(data.sublist(4));
    return ParsedPacket(
      type: PacketType.advanced,
      subCommand: Commands.subScanNetworks,
      payload: payload,
      message: 'WiFi scan results',
    );
  }

  // ---------------------------------------------------------------------------
  // WiFi status (154 / 16)
  // ---------------------------------------------------------------------------

  static ParsedPacket _parseWifiStatus(Uint8List data) {
    // byte[4] = connection status (0=disconnected, 1=connected)
    // byte[5..] = IP address as null-terminated string (when connected)
    final payload = Uint8List.fromList(data.sublist(4));
    return ParsedPacket(
      type: PacketType.advanced,
      subCommand: Commands.subReadWifiStatus,
      payload: payload,
      message: data[4] == 1 ? 'WiFi connected' : 'WiFi disconnected',
    );
  }

  // ---------------------------------------------------------------------------
  // Hotspot status (154 / 20)
  // ---------------------------------------------------------------------------

  static ParsedPacket _parseHotspotStatus(Uint8List data) {
    // byte[4] = hotspot active (0/1)
    final payload = Uint8List.fromList(data.sublist(4));
    return ParsedPacket(
      type: PacketType.advanced,
      subCommand: Commands.subReadHotspot,
      payload: payload,
      message: data[4] == 1 ? 'Hotspot active' : 'Hotspot inactive',
    );
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Parse WiFi scan result payload into a list of (ssid, rssi) pairs.
  ///
  /// The format from the device is a sequence of:
  ///   null-terminated SSID string, then 1 byte RSSI (as signed int8).
  /// The sequence ends at a double-null or end of data.
  static List<WifiScanEntry> parseWifiScanPayload(Uint8List payload) {
    final results = <WifiScanEntry>[];
    int i = 0;
    while (i < payload.length) {
      // Find the null terminator for the SSID.
      final start = i;
      while (i < payload.length && payload[i] != 0) {
        i++;
      }
      if (i == start) break; // empty SSID = end of list
      final ssid = String.fromCharCodes(payload.sublist(start, i));
      i++; // skip null terminator
      if (i >= payload.length) break;
      final rssi = payload[i].toSigned(8);
      i++;
      results.add(WifiScanEntry(ssid: ssid, rssi: rssi));
    }
    return results;
  }

  static String _readNullTerminatedAscii(Uint8List bytes) {
    final sb = StringBuffer();
    for (final b in bytes) {
      if (b == 0) break;
      sb.writeCharCode(b);
    }
    return sb.toString();
  }

  /// Decode a Win1251 null-terminated string from [bytes].
  static String readNullTerminatedWin1251(Uint8List bytes) {
    return Win1251.decode(bytes, stopAtNull: true);
  }
}

/// A WiFi network discovered during scanning.
class WifiScanEntry {
  final String ssid;
  final int rssi;

  const WifiScanEntry({required this.ssid, required this.rssi});

  @override
  String toString() => 'WifiScanEntry(ssid: $ssid, rssi: $rssi)';
}
