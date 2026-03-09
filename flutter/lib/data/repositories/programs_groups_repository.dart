import '../database/database_helper.dart';

class ProgramsGroupsRepository {
  Future<void> link(int categoryId, int programId, int sort) async {
    final db = await DatabaseHelper.database;
    await db.insert('programs_groups_connections', {
      'category_id': categoryId,
      'program_id': programId,
      'sort': sort,
    });
  }

  Future<void> unlink(int id) async {
    final db = await DatabaseHelper.database;
    await db.delete(
      'programs_groups_connections',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> unlinkByProgramAndCategory(
      int categoryId, int programId) async {
    final db = await DatabaseHelper.database;
    await db.delete(
      'programs_groups_connections',
      where: 'category_id = ? AND program_id = ?',
      whereArgs: [categoryId, programId],
    );
  }
}
