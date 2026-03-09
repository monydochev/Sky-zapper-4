import '../database/database_helper.dart';
import '../models/frequency.dart';

class FrequencyRepository {
  Future<List<Frequency>> getByDiseaseId(int diseaseId) async {
    final db = await DatabaseHelper.database;
    final results = await db.query(
      'freq',
      where: 'disease_id = ?',
      whereArgs: [diseaseId],
      orderBy: 'orderno',
    );
    return results.map((map) => Frequency.fromMap(map)).toList();
  }

  Future<int> insert(Frequency freq) async {
    final db = await DatabaseHelper.database;
    return await db.insert('freq', freq.toMap());
  }

  Future<void> update(Frequency freq) async {
    final db = await DatabaseHelper.database;
    await db.update(
      'freq',
      freq.toMap(),
      where: 'id = ?',
      whereArgs: [freq.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await DatabaseHelper.database;
    await db.delete('freq', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateAllTimeSec(int diseaseId, int timeSec) async {
    final db = await DatabaseHelper.database;
    await db.rawUpdate(
      'UPDATE freq SET time_sec = ? WHERE disease_id = ?',
      [timeSec, diseaseId],
    );
  }
}
