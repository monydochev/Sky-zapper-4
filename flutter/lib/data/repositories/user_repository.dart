import '../database/database_helper.dart';
import '../models/user.dart';

class UserRepository {
  Future<List<AppUser>> getAll() async {
    final db = await DatabaseHelper.database;
    final results = await db.query('Users', orderBy: 'name');
    return results.map((map) => AppUser.fromMap(map)).toList();
  }

  Future<AppUser?> getById(int id) async {
    final db = await DatabaseHelper.database;
    final results = await db.query(
      'Users',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (results.isEmpty) return null;
    return AppUser.fromMap(results.first);
  }

  Future<bool> validatePassword(int userId, String password) async {
    final db = await DatabaseHelper.database;
    final results = await db.query(
      'Users',
      where: 'id = ?',
      whereArgs: [userId],
    );
    if (results.isEmpty) return false;
    final user = AppUser.fromMap(results.first);
    return user.pass == password;
  }

  Future<void> changePassword(int userId, String newPassword) async {
    final db = await DatabaseHelper.database;
    await db.update(
      'Users',
      {'pass': newPassword},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

  Future<int> insert(String name) async {
    final db = await DatabaseHelper.database;
    return await db.insert('Users', {
      'name': name,
      'power_options': '100% сила',
    });
  }

  Future<void> delete(int id) async {
    final db = await DatabaseHelper.database;
    await db.delete('Users', where: 'id = ?', whereArgs: [id]);
  }
}
