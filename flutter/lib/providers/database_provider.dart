import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../data/database/database_helper.dart';

final databaseProvider = FutureProvider<Database>((ref) => DatabaseHelper.database);
