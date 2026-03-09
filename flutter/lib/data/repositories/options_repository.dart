import '../database/database_helper.dart';
import '../models/app_options.dart';

class OptionsRepository {
  Future<AppOptions> get() async {
    final db = await DatabaseHelper.database;
    final results = await db.query('options', limit: 1);
    if (results.isEmpty) return AppOptions();
    return AppOptions.fromMap(results.first);
  }

  Future<void> updateMac(String mac) async {
    final db = await DatabaseHelper.database;
    await db.rawUpdate('UPDATE options SET MAC = ?', [mac]);
  }

  Future<void> updateNetworkIp(String ip) async {
    final db = await DatabaseHelper.database;
    await db.rawUpdate('UPDATE options SET network_ip = ?', [ip]);
  }

  Future<void> updateComPort(String port) async {
    final db = await DatabaseHelper.database;
    await db.rawUpdate('UPDATE options SET com_port = ?', [port]);
  }

  Future<void> updateSearch(int mode) async {
    final db = await DatabaseHelper.database;
    await db.rawUpdate('UPDATE options SET search = ?', [mode]);
  }
}
