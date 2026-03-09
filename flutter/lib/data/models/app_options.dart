class AppOptions {
  final int programSec;
  final int power;
  final String? comPort;
  final int search;
  final String? mac;
  final double dbVer;
  final String? networkIp;

  AppOptions({
    this.programSec = 30,
    this.power = 50,
    this.comPort,
    this.search = 0,
    this.mac,
    this.dbVer = 2.01,
    this.networkIp,
  });

  factory AppOptions.fromMap(Map<String, dynamic> map) => AppOptions(
        programSec: (map['program_sec'] as int?) ?? 30,
        power: (map['power'] as int?) ?? 50,
        comPort: map['com_port'] as String?,
        search: (map['search'] as int?) ?? 0,
        mac: map['MAC'] as String?,
        dbVer: (map['db_ver'] as num?)?.toDouble() ?? 2.01,
        networkIp: map['network_ip'] as String?,
      );
}
