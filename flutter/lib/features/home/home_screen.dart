import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n.dart';
import '../../providers/auth_provider.dart';
import '../../providers/device_connection_provider.dart';
import '../../providers/locale_provider.dart';
import '../../providers/playback_provider.dart';
import '../connection/connection_screen.dart';
import '../custom_groups/custom_groups_screen.dart';
import '../editor/editor_screen.dart';
import '../programs/playback_overlay.dart';
import '../programs/programs_screen.dart';
import '../settings/settings_screen.dart';
import '../silver_water/silver_water_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final connectionState = ref.watch(deviceConnectionProvider);
    final playbackState = ref.watch(playbackProvider);
    final authState = ref.watch(authProvider);
    final hasSilverWater = connectionState.deviceInfo?.hasSilverWater ?? false;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 800;

    final destinations = <_NavDestination>[
      _NavDestination(
        icon: Icons.play_circle_outline,
        selectedIcon: Icons.play_circle,
        label: L10n.tr('programs', locale),
        screen: const ProgramsScreen(),
      ),
      _NavDestination(
        icon: Icons.playlist_play_outlined,
        selectedIcon: Icons.playlist_play,
        label: L10n.tr('playlists', locale),
        screen: const CustomGroupsScreen(),
      ),
      if (hasSilverWater)
        _NavDestination(
          icon: Icons.water_drop_outlined,
          selectedIcon: Icons.water_drop,
          label: L10n.tr('silver_water', locale),
          screen: const SilverWaterScreen(),
        ),
      _NavDestination(
        icon: Icons.edit_outlined,
        selectedIcon: Icons.edit,
        label: L10n.tr('editor', locale),
        screen: const EditorScreen(),
      ),
      _NavDestination(
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings,
        label: L10n.tr('settings', locale),
        screen: const SettingsScreen(),
      ),
    ];

    // Clamp selected index to valid range
    if (_selectedIndex >= destinations.length) {
      _selectedIndex = 0;
    }

    final currentScreen = destinations[_selectedIndex].screen;

    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.tr('app_title', locale)),
        actions: [
          // Connection status indicator
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ConnectionScreen(),
                ),
              );
            },
            icon: Icon(
              connectionState.isConnected ? Icons.link : Icons.link_off,
              color: connectionState.isConnected
                  ? Colors.greenAccent
                  : Colors.white70,
            ),
            tooltip: connectionState.isConnected
                ? L10n.tr('connected', locale)
                : L10n.tr('disconnected', locale),
          ),

          // User info
          if (authState.currentUser != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: Text(
                  authState.currentUser!.name ?? '',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),

          // Logout
          IconButton(
            onPressed: () {
              ref.read(authProvider.notifier).logout();
            },
            icon: const Icon(Icons.logout),
            tooltip: L10n.tr('change_user', locale),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: isDesktop
                ? Row(
                    children: [
                      NavigationRail(
                        selectedIndex: _selectedIndex,
                        onDestinationSelected: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        labelType: NavigationRailLabelType.all,
                        destinations: destinations.map((d) {
                          return NavigationRailDestination(
                            icon: Icon(d.icon),
                            selectedIcon: Icon(d.selectedIcon),
                            label: Text(d.label),
                          );
                        }).toList(),
                      ),
                      const VerticalDivider(thickness: 1, width: 1),
                      Expanded(child: currentScreen),
                    ],
                  )
                : currentScreen,
          ),

          // Playback overlay
          if (!playbackState.isIdle) const PlaybackOverlay(),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: destinations.map((d) {
                return NavigationDestination(
                  icon: Icon(d.icon),
                  selectedIcon: Icon(d.selectedIcon),
                  label: d.label,
                );
              }).toList(),
            ),
    );
  }
}

class _NavDestination {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final Widget screen;

  const _NavDestination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.screen,
  });
}
