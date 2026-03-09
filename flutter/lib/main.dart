import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'app.dart';

/// Log file for debug output
late final File _logFile;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize sqflite FFI for Windows/Linux/macOS desktop
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    debugPrint('[MAIN] sqflite FFI initialized for desktop');
  }

  // Setup log file
  _logFile = File('/tmp/sky_zapper_debug.log');
  try {
    await _logFile.writeAsString(
      '=== SKY Zapper started ${DateTime.now()} ===\n',
    );
  } catch (_) {
    // Sandbox may block — continue without file logging
  }

  // Override debugPrint to also write to file
  final originalDebugPrint = debugPrint;
  debugPrint = (String? message, {int? wrapWidth}) {
    originalDebugPrint(message, wrapWidth: wrapWidth);
    if (message != null) {
      try {
        final timestamp = DateTime.now().toIso8601String().substring(11, 23);
        _logFile.writeAsStringSync('[$timestamp] $message\n',
            mode: FileMode.append);
      } catch (_) {}
    }
  };

  // Also capture Flutter errors
  FlutterError.onError = (details) {
    final msg = details.exceptionAsString();
    debugPrint('[FlutterError] $msg');
    developer.log(msg, error: details.exception, stackTrace: details.stack);
  };

  runApp(
    const ProviderScope(
      child: SkyZapperApp(),
    ),
  );
}
