/// Command codes for communication with Sky Zapper devices.
///
/// All commands follow the packet format: [0, transport, cmd, sub/offset, data...]
class Commands {
  Commands._();

  // ---------------------------------------------------------------------------
  // Outgoing commands (PC / App -> Device)
  // ---------------------------------------------------------------------------

  /// Read all device settings and status (CMD 9).
  static const int cmdReadAll = 9;

  /// Write settings to a specific byte offset (CMD 16).
  static const int cmdWriteSettings = 16;

  /// Advanced command with sub-command byte (CMD 26).
  static const int cmdAdvanced = 26;

  // ---------------------------------------------------------------------------
  // Advanced sub-commands (CMD 26, byte[3])
  // ---------------------------------------------------------------------------

  /// Set power and frequency parameters.
  static const int subSetPowerFreq = 10;

  /// Read saved WiFi networks list.
  static const int subReadSavedNetworks = 15;

  /// Read current WiFi connection status.
  static const int subReadWifiStatus = 16;

  /// Scan for available WiFi networks.
  static const int subScanNetworks = 17;

  /// Connect to a WiFi network (SSID + password).
  static const int subConnectNetwork = 18;

  /// Read hotspot (AP) status.
  static const int subReadHotspot = 20;

  /// Enable / disable hotspot (AP) mode.
  static const int subSetHotspot = 21;

  /// Get available program IDs from device buffer.
  static const int subGetProgramIds = 25;

  /// Get available category IDs from device buffer.
  static const int subGetCategoryIds = 26;

  /// Block transfer: start (send total size).
  static const int subBlockStart = 50;

  /// Block transfer: send a 128-byte data block.
  static const int subBlockSend = 51;

  /// Block transfer: end / finalise.
  static const int subBlockEnd = 52;

  /// Ping / keep-alive.
  static const int subPing = 60;

  /// Factory reset (requires magic bytes 15, 170, 200).
  static const int subFactoryReset = 240;

  // ---------------------------------------------------------------------------
  // Cloud event codes (sent via UDP telemetry)
  // ---------------------------------------------------------------------------

  /// Frequency playback started.
  static const int cloudFreqStarted = 90;

  /// Playback paused.
  static const int cloudPaused = 91;

  /// Playback stopped.
  static const int cloudStopped = 92;

  /// Playback resumed.
  static const int cloudResumed = 94;

  /// Silver water generation started.
  static const int cloudSilverWaterStarted = 95;

  /// Favorite category / program changed.
  static const int cloudFavoriteChanged = 101;

  /// Search performed in the program list.
  static const int cloudSearchPerformed = 120;

  /// Application started.
  static const int cloudAppStart = 150;

  /// Machine / device info reported.
  static const int cloudMachineInfo = 161;

  // ---------------------------------------------------------------------------
  // Response codes (Device -> PC / App)
  // ---------------------------------------------------------------------------

  /// Full status packet (response to CMD 9).
  static const int respStatus = 137;

  /// Error response.
  static const int respError = 208;

  /// Generic success response.
  static const int respSuccess = 144;

  /// Advanced command response (CMD 26 echo).
  static const int respAdvanced = 154;

  /// Advanced command error response.
  static const int respAdvancedError = 218;
}
