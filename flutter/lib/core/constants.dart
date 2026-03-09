class AppConstants {
  static const double programVersion = 2.0;
  static const int maxMem = 524288; // 512KB buffer
  static const int defaultCloudPort = 7433;
  static const int udpPort = 7800;
  static const int serialBaudRate = 9600;

  // Buffer record sizes (ESP format)
  static const int lenCategoryESP = 38;
  static const int lenDiseaseESP = 92;
  static const int lenFrequenceESP = 5;

  // Standard format
  static const int lenCategory = 8;
  static const int lenDisease = 12;
  static const int lenFrequence = 5;
  static const int lenSettings = 10;

  // Cloud
  static const String cloudHost = 'cloud.sky.bg';
  static const String cloudIP = '83.97.27.107';
  static const int cloudPort = 7433;

  // Update URLs
  static const String updateXmlUrl =
      'https://zapper.sky.bg/software/new_versions.xml';
  static const String updateExeUrl =
      'https://zapper.sky.bg/software/SKY_Zapper.exe';
  static const String updateDbUrl =
      'https://zapper.sky.bg/software/SKY_Zapper.mdb';

  // Playback
  static const int maxPlaybackEntries = 500;
  static const int maxQuickSlots = 12;

  // Silver Water current options (mA)
  static const List<int> silverWaterCurrentOptions = [2, 5, 8, 11, 14, 17, 20];
  static const List<int> silverWaterVolumeOptions = [200, 500, 1000, 2000];
  static const List<int> silverWaterConcentrationOptions = [2, 5, 15, 100];
}
