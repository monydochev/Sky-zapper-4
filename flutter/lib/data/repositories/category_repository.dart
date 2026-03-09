import '../database/database_helper.dart';
import '../models/category.dart';

class CategoryRepository {
  Future<List<Category>> getAll() async {
    final db = await DatabaseHelper.database;
    final results = await db.rawQuery('''
      SELECT c.*,
        (SELECT COUNT(*) FROM programs_groups_connections pgc WHERE pgc.category_id = c.id) as program_count
      FROM category c
      ORDER BY c.sort, c.category_name_EN
    ''');
    return results.map((map) => Category.fromMap(map)).toList();
  }

  Future<List<Category>> getForUser(int userId) async {
    final db = await DatabaseHelper.database;
    final results = await db.rawQuery('''
      SELECT c.*,
        (SELECT COUNT(*) FROM programs_groups_connections pgc WHERE pgc.category_id = c.id) as program_count
      FROM category c
      WHERE c.type_id <= 0 OR c.user_id = ?
      ORDER BY c.sort, c.category_name_EN
    ''', [userId]);
    return results.map((map) => Category.fromMap(map)).toList();
  }

  Future<Category?> getById(int id) async {
    final db = await DatabaseHelper.database;
    final results = await db.rawQuery('''
      SELECT c.*,
        (SELECT COUNT(*) FROM programs_groups_connections pgc WHERE pgc.category_id = c.id) as program_count
      FROM category c
      WHERE c.id = ?
    ''', [id]);
    if (results.isEmpty) return null;
    return Category.fromMap(results.first);
  }

  Future<int> insert(Category cat) async {
    final db = await DatabaseHelper.database;
    final result = await db.rawQuery('SELECT MAX(id) as max_id FROM category');
    final maxId = (result.first['max_id'] as int?) ?? 0;
    final newId = maxId + 1;

    final map = cat.toMap();
    map['id'] = newId;
    await db.insert('category', map);
    return newId;
  }

  Future<void> update(Category cat) async {
    final db = await DatabaseHelper.database;
    await db.update(
      'category',
      cat.toMap(),
      where: 'id = ?',
      whereArgs: [cat.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await DatabaseHelper.database;
    await db.delete('category', where: 'id = ?', whereArgs: [id]);
  }
}
