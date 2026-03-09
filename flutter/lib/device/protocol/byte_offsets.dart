/// Model-specific byte offsets within the device status packet.
///
/// Different hardware revisions place settings at different positions
/// in the 255-byte status packet returned by CMD 9.
class ByteOffsets {
  /// Power level byte.
  final int power;

  /// Duration / frequency time (2 bytes LE starting here).
  final int durationFrequenceTime;

  /// Current frequency (read-only from status).
  final int freq;

  /// Buzzer setting.
  final int zumer;

  /// Sweep setting.
  final int sweep;

  /// WiFi enabled flag (WiFi models only).
  final int? wifi;

  /// WiFi AP timeout (WiFi models only).
  final int? wifiAP;

  /// WiFi AP no-activity timeout (WiFi models only).
  final int? wifiAPNoAct;

  /// Start byte for silver water settings block.
  final int silverWaterStartByte;

  /// Current set-point for silver water.
  final int currentSetPoint;

  /// Water quantity (2 bytes LE).
  final int waterQuantity;

  /// Silver concentration target.
  final int silverConcentration;

  /// Silver water on/off flag.
  final int silverWaterOn;

  /// Current sense (actual measured current).
  final int currentSence;

  /// Silver water elapsed time (4 bytes LE).
  final int silverWatterTime;

  /// Silver water remaining time (4 bytes LE).
  final int silverWaterRemain;

  const ByteOffsets({
    required this.power,
    required this.durationFrequenceTime,
    required this.freq,
    required this.zumer,
    required this.sweep,
    this.wifi,
    this.wifiAP,
    this.wifiAPNoAct,
    required this.silverWaterStartByte,
    required this.currentSetPoint,
    required this.waterQuantity,
    required this.silverConcentration,
    required this.silverWaterOn,
    required this.currentSence,
    required this.silverWatterTime,
    required this.silverWaterRemain,
  });

  /// Offsets for basic (non-WiFi) models: 8011, 8012, 8040.
  static const basic = ByteOffsets(
    power: 10,
    durationFrequenceTime: 11,
    freq: 13,
    zumer: 14,
    sweep: 15,
    silverWaterStartByte: 29,
    currentSetPoint: 29,
    waterQuantity: 30,
    silverConcentration: 32,
    silverWaterOn: 34,
    currentSence: 35,
    silverWatterTime: 37,
    silverWaterRemain: 41,
  );

  /// Offsets for WiFi models: 8030, 8031, 8041, 8042.
  static const wifiModel = ByteOffsets(
    power: 54,
    durationFrequenceTime: 55,
    freq: 57,
    zumer: 58,
    sweep: 59,
    wifi: 122,
    wifiAP: 123,
    wifiAPNoAct: 124,
    silverWaterStartByte: 126,
    currentSetPoint: 126,
    waterQuantity: 127,
    silverConcentration: 129,
    silverWaterOn: 132,
    currentSence: 133,
    silverWatterTime: 135,
    silverWaterRemain: 139,
  );

  /// Return the correct offsets for a device identified by [shortMac].
  static ByteOffsets forModel(String shortMac) {
    switch (shortMac) {
      case '8011':
      case '8012':
      case '8040':
        return basic;
      case '8030':
      case '8031':
      case '8041':
      case '8042':
        return wifiModel;
      default:
        return wifiModel;
    }
  }
}
