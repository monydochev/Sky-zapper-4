import '../database/database_helper.dart';
import '../models/disease.dart';

class DiseaseRepository {
  Future<List<Disease>> getByCategory(int categoryId) async {
    final db = await DatabaseHelper.database;
    final results = await db.rawQuery('''
      SELECT d.*,
        (SELECT COUNT(*) FROM freq f WHERE f.disease_id = d.id) as freq_count
      FROM diseases d
      INNER JOIN programs_groups_connections pgc ON pgc.program_id = d.id
      WHERE pgc.category_id = ?
      ORDER BY pgc.sort, d.name_en
    ''', [categoryId]);
    return results.map((map) => Disease.fromMap(map)).toList();
  }

  Future<List<Disease>> search(String query, int searchMode) async {
    final db = await DatabaseHelper.database;
    final searchPattern = '%$query%';

    String sql;
    List<Object?> args;

    switch (searchMode) {
      case 0: // Search by name (EN + BG)
        sql = '''
          SELECT d.*,
            (SELECT COUNT(*) FROM freq f WHERE f.disease_id = d.id) as freq_count
          FROM diseases d
          WHERE d.name_en LIKE ? OR d.name_bg LIKE ?
          ORDER BY d.name_en
        ''';
        args = [searchPattern, searchPattern];
        break;
      case 1: // Search by description
        sql = '''
          SELECT d.*,
            (SELECT COUNT(*) FROM freq f WHERE f.disease_id = d.id) as freq_count
          FROM diseases d
          WHERE d.description_en LIKE ? OR d.description_bg LIKE ?
          ORDER BY d.name_en
        ''';
        args = [searchPattern, searchPattern];
        break;
      case 2: // Search by name + description
        sql = '''
          SELECT d.*,
            (SELECT COUNT(*) FROM freq f WHERE f.disease_id = d.id) as freq_count
          FROM diseases d
          WHERE d.name_en LIKE ? OR d.name_bg LIKE ?
            OR d.description_en LIKE ? OR d.description_bg LIKE ?
          ORDER BY d.name_en
        ''';
        args = [searchPattern, searchPattern, searchPattern, searchPattern];
        break;
      default:
        sql = '''
          SELECT d.*,
            (SELECT COUNT(*) FROM freq f WHERE f.disease_id = d.id) as freq_count
          FROM diseases d
          WHERE d.name_en LIKE ? OR d.name_bg LIKE ?
          ORDER BY d.name_en
        ''';
        args = [searchPattern, searchPattern];
    }

    final results = await db.rawQuery(sql, args);
    return results.map((map) => Disease.fromMap(map)).toList();
  }

  Future<List<Disease>> searchByFrequency(double freq) async {
    final db = await DatabaseHelper.database;
    final results = await db.rawQuery('''
      SELECT DISTINCT d.*,
        (SELECT COUNT(*) FROM freq f2 WHERE f2.disease_id = d.id) as freq_count
      FROM diseases d
      INNER JOIN freq f ON f.disease_id = d.id
      WHERE f.freq = ?
      ORDER BY d.name_en
    ''', [freq]);
    return results.map((map) => Disease.fromMap(map)).toList();
  }

  Future<Disease?> getById(int id) async {
    final db = await DatabaseHelper.database;
    final results = await db.rawQuery('''
      SELECT d.*,
        (SELECT COUNT(*) FROM freq f WHERE f.disease_id = d.id) as freq_count
      FROM diseases d
      WHERE d.id = ?
    ''', [id]);
    if (results.isEmpty) return null;
    return Disease.fromMap(results.first);
  }

  Future<List<Disease>> getAll() async {
    final db = await DatabaseHelper.database;
    final results = await db.rawQuery('''
      SELECT d.*,
        (SELECT COUNT(*) FROM freq f WHERE f.disease_id = d.id) as freq_count
      FROM diseases d
      ORDER BY d.name_en
    ''');
    return results.map((map) => Disease.fromMap(map)).toList();
  }

  Future<int> insert(Disease disease) async {
    final db = await DatabaseHelper.database;
    return await db.insert('diseases', disease.toMap());
  }

  Future<void> update(Disease disease) async {
    final db = await DatabaseHelper.database;
    await db.update(
      'diseases',
      disease.toMap(),
      where: 'id = ?',
      whereArgs: [disease.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await DatabaseHelper.database;
    await db.delete('diseases', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> setFavorite(int id, int value) async {
    final db = await DatabaseHelper.database;
    await db.rawUpdate(
      'UPDATE diseases SET favorite = ? WHERE id = ?',
      [value, id],
    );
  }

  Future<int> getNextId() async {
    final db = await DatabaseHelper.database;
    final result = await db.rawQuery(
      'SELECT MAX(id) as max_id FROM diseases WHERE id >= 61000',
    );
    final maxId = result.first['max_id'] as int?;
    return (maxId != null) ? maxId + 1 : 61000;
  }
}
