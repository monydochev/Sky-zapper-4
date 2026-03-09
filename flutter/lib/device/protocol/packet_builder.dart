import 'dart:typed_data';

/// Builds outgoing command packets for Sky Zapper devices.
///
/// Every packet is a 255-byte [Uint8List]. Byte layout:
///   [0] = 0 (report ID)
///   [1] = transport flag (0 = USB, 2 = LAN)
///   [2] = command code
///   [3] = sub-command / offset
///   [4..] = payload
class PacketBuilder {
  PacketBuilder._();

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Create an empty 255-byte buffer (all zeros).
  static Uint8List createBuffer() => Uint8List(255);

  // ---------------------------------------------------------------------------
  // Read All (CMD 9)
  // ---------------------------------------------------------------------------

  /// Request full device status.
  static Uint8List buildReadAll({bool isLan = false}) {
    final buf = createBuffer();
    buf[0] = 0;
    buf[1] = isLan ? 2 : 0;
    buf[2] = 9; // CMD
    buf[3] = 0;
    buf[4] = 255; // force re-read
    return buf;
  }

  // ---------------------------------------------------------------------------
  // Ping (CMD 26 / sub 60)
  // ---------------------------------------------------------------------------

  /// Send a keep-alive ping.
  static Uint8List buildPing({bool isLan = false}) {
    final buf = createBuffer();
    buf[0] = 0;
    buf[1] = isLan ? 2 : 0;
    buf[2] = 26;
    buf[3] = 60;
    return buf;
  }

  // ---------------------------------------------------------------------------
  // Write Settings (CMD 16)
  // ---------------------------------------------------------------------------

  /// Generic settings write at a given [offset].
  static Uint8List buildWriteSettings(
    int offset,
    List<int> data, {
    bool isLan = false,
  }) {
    final buf = createBuffer();
    buf[0] = 0;
    buf[1] = isLan ? 2 : 0;
    buf[2] = 16;
    buf[3] = offset;
    for (int i = 0; i < data.length; i++) {
      buf[4 + i] = data[i] & 0xFF;
    }
    return buf;
  }

  // ---------------------------------------------------------------------------
  // Set Power / Frequency (CMD 26 / sub 10)
  // ---------------------------------------------------------------------------

  /// Set power, sweep, and frequency.
  ///
  /// [frequence] is in Hz * 100 and written as 4-byte little-endian.
  /// Matches Delphi set_power_freq() — sends exactly 12 bytes.
  ///
  /// Byte layout (matching Delphi USB_Buffer[1..12]):
  ///   [0] = 0 (report ID)
  ///   [1] = transport (0=USB, 2=LAN)
  ///   [2] = 26 (cmdAdvanced)
  ///   [3] = 10 (subSetPowerFreq)
  ///   [4] = ManSweep
  ///   [5] = ManPower (0=normal, 1=STOP)
  ///   [6..9] = Frequency as 4-byte little-endian (Hz * 100)
  ///   [10] = Sweep
  ///   [11] = Power
  static Uint8List buildSetPowerFreq(
    int manSweep,
    int sweep,
    int manPower,
    int power,
    int frequence, {
    bool isLan = false,
  }) {
    final buf = Uint8List(12);
    buf[0] = 0;
    buf[1] = isLan ? 2 : 0;
    buf[2] = 26;
    buf[3] = 10;
    buf[4] = manSweep;
    buf[5] = manPower;
    buf[6] = frequence & 0xFF;
    buf[7] = (frequence >> 8) & 0xFF;
    buf[8] = (frequence >> 16) & 0xFF;
    buf[9] = (frequence >> 24) & 0xFF;
    buf[10] = sweep;
    buf[11] = power;
    return buf;
  }

  // ---------------------------------------------------------------------------
  // Silver Water
  // ---------------------------------------------------------------------------

  /// Write silver water configuration at [startByte].
  static Uint8List buildSilverWaterSettings(
    int startByte,
    int currentSetPoint,
    int waterQuantityLow,
    int waterQuantityHigh,
    int concentration, {
    bool isLan = false,
  }) {
    return buildWriteSettings(
      startByte,
      [currentSetPoint, waterQuantityLow, waterQuantityHigh, concentration],
      isLan: isLan,
    );
  }

  /// Turn silver water generation on or off.
  static Uint8List buildSilverWaterOnOff(
    int silverWaterOnOffset,
    bool on, {
    bool isLan = false,
  }) {
    return buildWriteSettings(
      silverWaterOnOffset,
      [on ? 1 : 0],
      isLan: isLan,
    );
  }

  // ---------------------------------------------------------------------------
  // WiFi
  // ---------------------------------------------------------------------------

  /// Connect to a WiFi network. Payload: SSID + CR + password.
  static Uint8List buildWifiConnect(
    String ssid,
    String password, {
    bool isLan = false,
  }) {
    final buf = createBuffer();
    buf[0] = 0;
    buf[1] = isLan ? 2 : 0;
    buf[2] = 26;
    buf[3] = 18;
    final payload = '$ssid\r$password';
    for (int i = 0; i < payload.length && i < 250; i++) {
      buf[4 + i] = payload.codeUnitAt(i);
    }
    return buf;
  }

  /// Request a scan of available WiFi networks.
  static Uint8List buildScanNetworks({bool isLan = false}) {
    final buf = createBuffer();
    buf[0] = 0;
    buf[1] = isLan ? 2 : 0;
    buf[2] = 26;
    buf[3] = 17;
    return buf;
  }

  /// Enable or disable the device hotspot (AP mode).
  static Uint8List buildHotspot(bool on, {bool isLan = false}) {
    final buf = createBuffer();
    buf[0] = 0;
    buf[1] = isLan ? 2 : 0;
    buf[2] = 26;
    buf[3] = 21;
    buf[4] = on ? 1 : 0;
    return buf;
  }

  /// Write WiFi byte, AP timeout, and AP no-activity timeout at offset 122.
  static Uint8List buildWriteWifiSettings(
    int wifiByte,
    int apTimeout,
    int apNoActTimeout, {
    bool isLan = false,
  }) {
    return buildWriteSettings(
      122,
      [wifiByte, apTimeout, apNoActTimeout],
      isLan: isLan,
    );
  }

  // ---------------------------------------------------------------------------
  // Factory Reset (CMD 26 / sub 240)
  // ---------------------------------------------------------------------------

  /// Factory reset with magic bytes (15, 170, 200).
  static Uint8List buildFactoryReset({bool isLan = false}) {
    final buf = createBuffer();
    buf[0] = 0;
    buf[1] = isLan ? 2 : 0;
    buf[2] = 26;
    buf[3] = 240;
    buf[4] = 15;
    buf[5] = 170;
    buf[6] = 200;
    return buf;
  }

  // ---------------------------------------------------------------------------
  // Quick Programs (WiFi models)
  // ---------------------------------------------------------------------------

  /// Write a quick-program slot (1-based [slotIndex]) for WiFi models.
  ///
  /// Offset = 73 + (slotIndex - 1) * 4.  Each slot is 4 bytes:
  /// categoryId (2 LE) + programId (2 LE).
  static Uint8List buildQuickProgramWifi(
    int slotIndex,
    int categoryId,
    int programId, {
    bool isLan = false,
  }) {
    final offset = 73 + (slotIndex - 1) * 4;
    return buildWriteSettings(
      offset,
      [
        categoryId & 0xFF,
        (categoryId >> 8) & 0xFF,
        programId & 0xFF,
        (programId >> 8) & 0xFF,
      ],
      isLan: isLan,
    );
  }

  /// Clear all 12 quick-program slots (52 zero bytes at offset 73).
  static Uint8List buildClearAllQuickPrograms({bool isLan = false}) {
    return buildWriteSettings(73, List<int>.filled(52, 0), isLan: isLan);
  }

  // ---------------------------------------------------------------------------
  // Duration / Zumer
  // ---------------------------------------------------------------------------

  /// Write duration (2-byte LE) at the model-specific [offset].
  static Uint8List buildWriteDuration(
    int offset,
    int durationSec, {
    bool isLan = false,
  }) {
    return buildWriteSettings(
      offset,
      [durationSec & 0xFF, (durationSec >> 8) & 0xFF],
      isLan: isLan,
    );
  }

  /// Write buzzer and sweep settings at the model-specific [offset].
  static Uint8List buildWriteZumer(
    int offset,
    int zumer,
    int sweep, {
    bool isLan = false,
  }) {
    return buildWriteSettings(offset, [zumer, sweep], isLan: isLan);
  }

  // ---------------------------------------------------------------------------
  // Cloud configuration
  // ---------------------------------------------------------------------------

  /// Write the cloud service URL (max 29 chars, null-padded to 30) at offset 18.
  static Uint8List buildWriteCloudUrl(String url, {bool isLan = false}) {
    final data = List<int>.filled(30, 0);
    for (int i = 0; i < url.length && i < 29; i++) {
      data[i] = url.codeUnitAt(i);
    }
    return buildWriteSettings(18, data, isLan: isLan);
  }

  /// Write the cloud port (2-byte LE) at offset 48.
  static Uint8List buildWriteCloudPort(int port, {bool isLan = false}) {
    return buildWriteSettings(
      48,
      [port & 0xFF, (port >> 8) & 0xFF],
      isLan: isLan,
    );
  }

  // ---------------------------------------------------------------------------
  // Block Transfer (firmware upload)
  // ---------------------------------------------------------------------------

  /// Start a block transfer, sending the total byte count (4-byte LE).
  static Uint8List buildBlockStart(int totalSize, {bool isLan = false}) {
    final buf = createBuffer();
    buf[0] = 0;
    buf[1] = isLan ? 2 : 0;
    buf[2] = 26;
    buf[3] = 50;
    buf[4] = totalSize & 0xFF;
    buf[5] = (totalSize >> 8) & 0xFF;
    buf[6] = (totalSize >> 16) & 0xFF;
    buf[7] = (totalSize >> 24) & 0xFF;
    return buf;
  }

  /// Send a 128-byte data block during block transfer.
  static Uint8List buildBlockSend(Uint8List blockData, {bool isLan = false}) {
    final buf = createBuffer();
    buf[0] = 0;
    buf[1] = isLan ? 2 : 0;
    buf[2] = 26;
    buf[3] = 51;
    for (int i = 0; i < blockData.length && i < 128; i++) {
      buf[4 + i] = blockData[i];
    }
    return buf;
  }

  /// Finalise / end the block transfer.
  static Uint8List buildBlockEnd({bool isLan = false}) {
    final buf = createBuffer();
    buf[0] = 0;
    buf[1] = isLan ? 2 : 0;
    buf[2] = 26;
    buf[3] = 52;
    return buf;
  }
}
