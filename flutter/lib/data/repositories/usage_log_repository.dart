import 'package:intl/intl.dart';

import '../database/database_helper.dart';
import '../models/usage_log.dart';

class UsageLogRepository {
  static final DateFormat _dateFormat =
      DateFormat('yyyy-MM-dd HH:mm:ss');

  Future<int> logStart(int userId, int programId) async {
    final db = await DatabaseHelper.database;
    final now = _dateFormat.format(DateTime.now());
    return await db.insert('usage_log', {
      'date_time_start': now,
      'user_id': userId,
      'program_id': programId,
    });
  }

  Future<void> logEnd(int logId, int durationSec) async {
    final db = await DatabaseHelper.database;
    final now = _dateFormat.format(DateTime.now());
    await db.update(
      'usage_log',
      {
        'date_time_end': now,
        'duration_sec': durationSec,
      },
      where: 'id = ?',
      whereArgs: [logId],
    );
  }

  Future<List<UsageLog>> getAll() async {
    final db = await DatabaseHelper.database;
    final results = await db.query('usage_log', orderBy: 'id DESC');
    return results
        .map((map) => UsageLog(
              id: map['id'] as int?,
              dateTimeStart: map['date_time_start'] as String,
              dateTimeEnd: map['date_time_end'] as String?,
              userId: map['user_id'] as int,
              programId: map['program_id'] as int,
              durationSec: map['duration_sec'] as int?,
            ))
        .toList();
  }
}
