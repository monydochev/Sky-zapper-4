class DeviceInfo {
  final String shortMac; // 4 hex chars, e.g. "8031"
  final String fullMac; // 8 hex chars
  final List<int> macBytes; // 4 bytes for cloud
  final int serialNumber;
  final String factoryPin;
  final String additionalPin;
  final String cloudService;
  final int cloudPort;

  // Settings
  final int power;
  final int duration;
  final int freq;
  final int zumer;
  final int sweep;

  // WiFi
  final int wifiEnabled;
  final int wifiApTimeout;
  final int wifiApNoActTimeout;

  // Silver Water
  final int currentSetPoint;
  final int waterQuantity;
  final int silverConcentration;
  final int silverWaterOn;
  final int currentSence;
  final int silverWaterTime;
  final int silverWaterRemain;

  // Quick slots (WiFi models)
  final List<QuickSlot> quickSlots;

  DeviceInfo({
    required this.shortMac,
    required this.fullMac,
    required this.macBytes,
    this.serialNumber = 0,
    this.factoryPin = '',
    this.additionalPin = '',
    this.cloudService = 'cloud.sky.bg',
    this.cloudPort = 7433,
    this.power = 0,
    this.duration = 30,
    this.freq = 0,
    this.zumer = 0,
    this.sweep = 0,
    this.wifiEnabled = 0,
    this.wifiApTimeout = 0,
    this.wifiApNoActTimeout = 0,
    this.currentSetPoint = 0,
    this.waterQuantity = 200,
    this.silverConcentration = 2,
    this.silverWaterOn = 0,
    this.currentSence = 0,
    this.silverWaterTime = 0,
    this.silverWaterRemain = 0,
    this.quickSlots = const [],
  });

  // Device model identification by MAC prefix
  bool get isBasic =>
      shortMac == '8011' || shortMac == '8012' || shortMac == '8040';
  bool get isWifi =>
      shortMac == '8030' ||
      shortMac == '8031' ||
      shortMac == '8041' ||
      shortMac == '8042';
  bool get hasSilverWater =>
      shortMac == '8012' ||
      shortMac == '8031' ||
      shortMac == '8041' ||
      shortMac == '8042';

  String get modelName {
    switch (shortMac) {
      case '8011':
        return 'Basic';
      case '8012':
        return 'Basic + Silver Water';
      case '8030':
        return 'WiFi';
      case '8031':
        return 'WiFi + Silver Water';
      case '8040':
        return 'Rev1';
      case '8041':
        return 'Rev1 + Silver Water';
      case '8042':
        return 'Rev2 + Silver Water';
      default:
        return 'Unknown ($shortMac)';
    }
  }
}

class QuickSlot {
  final int slotIndex; // 1-12
  final int categoryId;
  final int programId;
  final String? programName;

  QuickSlot({
    required this.slotIndex,
    this.categoryId = 0,
    this.programId = 0,
    this.programName,
  });

  bool get isEmpty => programId == 0;

  String get colorGroup {
    if (slotIndex <= 4) return 'RED';
    if (slotIndex <= 8) return 'GREEN';
    return 'BLUE';
  }

  int get slotInGroup => ((slotIndex - 1) % 4) + 1;
}
