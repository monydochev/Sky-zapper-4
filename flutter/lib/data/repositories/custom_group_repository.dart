import '../database/database_helper.dart';
import '../models/custom_group.dart';
import '../models/custom_program.dart';

class CustomGroupRepository {
  Future<List<CustomGroup>> getByUser(int userId) async {
    final db = await DatabaseHelper.database;
    final results = await db.query(
      'custom_groups',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'sort, name',
    );
    return results.map((map) => CustomGroup.fromMap(map)).toList();
  }

  Future<int> insert(CustomGroup group) async {
    final db = await DatabaseHelper.database;
    return await db.insert('custom_groups', group.toMap());
  }

  Future<void> delete(int id) async {
    final db = await DatabaseHelper.database;
    await db.delete('custom_programs', where: 'group_id = ?', whereArgs: [id]);
    await db.delete('custom_groups', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<CustomProgram>> getPrograms(int groupId) async {
    final db = await DatabaseHelper.database;
    final results = await db.rawQuery('''
      SELECT cp.*, d.name_bg, d.name_en
      FROM custom_programs cp
      LEFT JOIN diseases d ON d.id = cp.program_id
      WHERE cp.group_id = ?
      ORDER BY cp.sort
    ''', [groupId]);
    return results.map((map) => CustomProgram.fromMap(map)).toList();
  }

  Future<void> addProgram(int groupId, int programId, int sort) async {
    final db = await DatabaseHelper.database;
    await db.insert('custom_programs', {
      'group_id': groupId,
      'program_id': programId,
      'sort': sort,
    });
  }

  Future<void> removeProgram(int customProgramId) async {
    final db = await DatabaseHelper.database;
    await db.delete(
      'custom_programs',
      where: 'id = ?',
      whereArgs: [customProgramId],
    );
  }
}
