import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static const String _dbName = 'SKY_Zapper.sqlite';

  static Future<Database> get database async {
    if (_database != null) return _database!;
    debugPrint('[DB] Initializing database...');
    final stopwatch = Stopwatch()..start();
    _database = await _initDatabase().timeout(
      const Duration(seconds: 15),
      onTimeout: () => throw Exception('Database init timed out after 15s'),
    );
    debugPrint('[DB] Database ready in ${stopwatch.elapsedMilliseconds}ms');
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    debugPrint('[DB] Getting database path...');
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);
    debugPrint('[DB] Database path: $path');

    // Check if db already exists
    final exists = await databaseExists(path);
    debugPrint('[DB] Database exists: $exists');

    if (!exists) {
      // Copy from assets
      debugPrint('[DB] Copying database from assets...');
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      final data = await rootBundle.load('assets/db/$_dbName');
      debugPrint('[DB] Asset loaded: ${data.lengthInBytes} bytes');
      final bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      debugPrint('[DB] Database file written to disk');
    }

    debugPrint('[DB] Opening database...');
    return await openDatabase(path);
  }

  static Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
