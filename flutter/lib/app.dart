import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/l10n.dart';
import 'core/theme.dart';
import 'features/auth/login_screen.dart';
import 'features/home/home_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/locale_provider.dart';

class SkyZapperApp extends ConsumerStatefulWidget {
  const SkyZapperApp({super.key});

  @override
  ConsumerState<SkyZapperApp> createState() => _SkyZapperAppState();
}

class _SkyZapperAppState extends ConsumerState<SkyZapperApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    // Delay provider modification to after the widget tree is built
    Future(() async {
      debugPrint('[APP] Starting initialization...');
      final stopwatch = Stopwatch()..start();
      try {
        final authNotifier = ref.read(authProvider.notifier);
        await authNotifier.autoLogin();
        debugPrint('[APP] Initialization complete in ${stopwatch.elapsedMilliseconds}ms');
      } catch (e) {
        debugPrint('[APP] Initialization ERROR: $e');
      }
      if (mounted) {
        setState(() {
          _initialized = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final authState = ref.watch(authProvider);

    return MaterialApp(
      title: L10n.tr('app_title', locale),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: !_initialized
          ? const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            )
          : authState.isLoggedIn
              ? const HomeScreen()
              : const LoginScreen(),
    );
  }
}
