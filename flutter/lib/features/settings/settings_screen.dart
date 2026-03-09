import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants.dart';
import '../../core/l10n.dart';
import '../../data/repositories/options_repository.dart';
import '../../device/protocol/commands.dart';
import '../../device/protocol/byte_offsets.dart';
import '../../providers/auth_provider.dart';
import '../../providers/device_connection_provider.dart';
import '../../providers/locale_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _showDebug = false;

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final connectionState = ref.watch(deviceConnectionProvider);
    final authState = ref.watch(authProvider);
    final deviceInfo = connectionState.deviceInfo;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============================================================
              // General Settings
              // ============================================================
              _buildSectionHeader(
                context,
                L10n.tr('general_settings', locale),
                Icons.tune,
              ),
              Card(
                child: Column(
                  children: [
                    // Language
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: Text(L10n.tr('language', locale)),
                      trailing: SegmentedButton<String>(
                        segments: [
                          ButtonSegment(
                            value: 'bg',
                            label: Text(L10n.tr('bulgarian', locale)),
                          ),
                          ButtonSegment(
                            value: 'en',
                            label: Text(L10n.tr('english', locale)),
                          ),
                        ],
                        selected: {locale},
                        onSelectionChanged: (selected) {
                          ref.read(localeProvider.notifier).setLocale(
                              selected.first);
                        },
                      ),
                    ),

                    // Search mode
                    ListTile(
                      leading: const Icon(Icons.search),
                      title: Text(L10n.tr('search_mode', locale)),
                      subtitle: Text(_getSearchModeLabel(locale)),
                      trailing: PopupMenuButton<int>(
                        onSelected: (mode) async {
                          final repo = OptionsRepository();
                          await repo.updateSearch(mode);
                        },
                        itemBuilder: (ctx) => [
                          PopupMenuItem(
                            value: 0,
                            child: Text(L10n.tr('search_mode_0', locale)),
                          ),
                          PopupMenuItem(
                            value: 1,
                            child: Text(L10n.tr('search_mode_1', locale)),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Text(L10n.tr('search_mode_2', locale)),
                          ),
                        ],
                      ),
                    ),

                    // Duration, Power, Buzzer, Sweep - only when connected
                    if (deviceInfo != null) ...[
                      const Divider(height: 1),
                      ListTile(
                        leading: const Icon(Icons.timer),
                        title: Text(L10n.tr('duration_sec', locale)),
                        trailing: Text('${deviceInfo.duration} s'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.bolt),
                        title: Text(L10n.tr('power', locale)),
                        trailing: Text('${deviceInfo.power}%'),
                      ),
                      SwitchListTile(
                        secondary: const Icon(Icons.volume_up),
                        title: Text(L10n.tr('buzzer', locale)),
                        value: deviceInfo.zumer == 1,
                        onChanged: (val) {
                          _writeDeviceSetting(
                            ByteOffsets.forModel(deviceInfo.shortMac).zumer,
                            val ? 1 : 0,
                          );
                        },
                      ),
                      SwitchListTile(
                        secondary: const Icon(Icons.waves),
                        title: Text(L10n.tr('sweep', locale)),
                        value: deviceInfo.sweep == 1,
                        onChanged: (val) {
                          _writeDeviceSetting(
                            ByteOffsets.forModel(deviceInfo.shortMac).sweep,
                            val ? 1 : 0,
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // ============================================================
              // WiFi Settings (WiFi models only)
              // ============================================================
              if (deviceInfo != null && deviceInfo.isWifi) ...[
                _buildSectionHeader(
                  context,
                  L10n.tr('wifi_settings', locale),
                  Icons.wifi,
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.wifi_find),
                        title: Text(L10n.tr('scan_networks', locale)),
                        trailing: FilledButton.tonal(
                          onPressed: () {
                            // Send scan networks command
                            ref
                                .read(deviceConnectionProvider.notifier)
                                .sendCommand(Uint8List.fromList([
                                  0,
                                  0,
                                  Commands.cmdAdvanced,
                                  Commands.subScanNetworks,
                                ]));
                          },
                          child: Text(L10n.tr('scan_networks', locale)),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.wifi_tethering),
                        title: Text(L10n.tr('hotspot', locale)),
                        trailing: FilledButton.tonal(
                          onPressed: () {
                            ref
                                .read(deviceConnectionProvider.notifier)
                                .sendCommand(Uint8List.fromList([
                                  0,
                                  0,
                                  Commands.cmdAdvanced,
                                  Commands.subSetHotspot,
                                  1,
                                ]));
                          },
                          child: Text(L10n.tr('hotspot', locale)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // ============================================================
              // Users Management
              // ============================================================
              _buildSectionHeader(
                context,
                L10n.tr('users', locale),
                Icons.people,
              ),
              Card(
                child: Column(
                  children: [
                    ...authState.users.map((user) {
                      return ListTile(
                        leading: Icon(
                          user.isAdmin ? Icons.admin_panel_settings : Icons.person,
                        ),
                        title: Text(user.name ?? 'User ${user.id}'),
                        subtitle: user.isAdmin
                            ? const Text('Admin')
                            : null,
                        trailing: user.isAdmin
                            ? null
                            : IconButton(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () =>
                                    _confirmDeleteUser(context, locale, user.id),
                              ),
                      );
                    }),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.person_add),
                      title: Text(L10n.tr('add', locale)),
                      onTap: () => _showAddUserDialog(context, locale),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // ============================================================
              // Change Password
              // ============================================================
              _buildSectionHeader(
                context,
                L10n.tr('change_password', locale),
                Icons.lock,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _ChangePasswordForm(locale: locale),
                ),
              ),
              const SizedBox(height: 16),

              // ============================================================
              // Update
              // ============================================================
              _buildSectionHeader(
                context,
                L10n.tr('update', locale),
                Icons.system_update,
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.cloud_download),
                      title: Text(L10n.tr('check_updates', locale)),
                      trailing: FilledButton.tonal(
                        onPressed: () {
                          // Check for updates
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(L10n.tr('no_updates', locale)),
                            ),
                          );
                        },
                        child: Text(L10n.tr('check_updates', locale)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // ============================================================
              // Device info (when connected)
              // ============================================================
              if (deviceInfo != null) ...[
                _buildSectionHeader(
                  context,
                  L10n.tr('device', locale),
                  Icons.devices,
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(L10n.tr('model', locale)),
                        trailing: Text(deviceInfo.modelName),
                      ),
                      ListTile(
                        title: const Text('MAC'),
                        trailing: Text(deviceInfo.fullMac),
                      ),
                      ListTile(
                        title: const Text('S/N'),
                        trailing: Text('${deviceInfo.serialNumber}'),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: const Icon(Icons.download),
                        title: Text(L10n.tr('read_settings', locale)),
                        onTap: () {
                          ref
                              .read(deviceConnectionProvider.notifier)
                              .sendCommand(Uint8List.fromList([
                                0,
                                0,
                                Commands.cmdReadAll,
                                0,
                              ]));
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.warning_amber,
                            color: Colors.red),
                        title: Text(
                          L10n.tr('factory_reset', locale),
                          style: const TextStyle(color: Colors.red),
                        ),
                        onTap: () =>
                            _confirmFactoryReset(context, locale),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // ============================================================
              // Debug (hidden by default)
              // ============================================================
              InkWell(
                onTap: () {
                  setState(() {
                    _showDebug = !_showDebug;
                  });
                },
                child: _buildSectionHeader(
                  context,
                  L10n.tr('debug', locale),
                  _showDebug ? Icons.expand_less : Icons.expand_more,
                ),
              ),
              if (_showDebug)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'App Version: ${AppConstants.programVersion}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Connection: ${connectionState.isConnected ? "Connected" : "Disconnected"}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        if (connectionState.isConnected &&
                            deviceInfo != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            'Model: ${deviceInfo.shortMac} (${deviceInfo.modelName})',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            'WiFi: ${deviceInfo.isWifi}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            'Silver Water: ${deviceInfo.hasSilverWater}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                        const SizedBox(height: 8),
                        Text(
                          'User: ${authState.currentUser?.name ?? "None"} (ID: ${authState.currentUser?.id ?? "-"})',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 16),

              // ============================================================
              // About
              // ============================================================
              _buildSectionHeader(
                context,
                L10n.tr('about', locale),
                Icons.info_outline,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SKY Zapper',
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Version ${AppConstants.programVersion}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'SKY Electronics',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Text('https://sky.bg'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }

  String _getSearchModeLabel(String locale) {
    // Would read from options; for now show default
    return L10n.tr('search_mode_2', locale);
  }

  void _writeDeviceSetting(int offset, int value) {
    ref.read(deviceConnectionProvider.notifier).sendCommand(
          Uint8List.fromList([
            0,
            0,
            Commands.cmdWriteSettings,
            offset,
            value,
          ]),
        );
  }

  Future<void> _showAddUserDialog(
    BuildContext context,
    String locale,
  ) async {
    final nameCtrl = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.tr('add', locale)),
        content: TextField(
          controller: nameCtrl,
          autofocus: true,
          decoration: InputDecoration(
            labelText: L10n.tr('user', locale),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(L10n.tr('cancel', locale)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, nameCtrl.text),
            child: Text(L10n.tr('save', locale)),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      await ref.read(authProvider.notifier).addUser(result);
    }
  }

  Future<void> _confirmDeleteUser(
    BuildContext context,
    String locale,
    int userId,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.tr('delete', locale)),
        content: Text(L10n.tr('confirm_delete', locale)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(L10n.tr('cancel', locale)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(L10n.tr('delete', locale)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(authProvider.notifier).deleteUser(userId);
    }
  }

  Future<void> _confirmFactoryReset(
    BuildContext context,
    String locale,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.tr('factory_reset', locale)),
        content: Text(L10n.tr('factory_reset_confirm', locale)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(L10n.tr('cancel', locale)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(L10n.tr('factory_reset', locale)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      ref.read(deviceConnectionProvider.notifier).sendCommand(
            Uint8List.fromList([
              0,
              0,
              Commands.cmdAdvanced,
              Commands.subFactoryReset,
              15,
              170,
              200,
            ]),
          );
    }
  }
}

// ============================================================================
// Change Password Form
// ============================================================================

class _ChangePasswordForm extends ConsumerStatefulWidget {
  final String locale;

  const _ChangePasswordForm({required this.locale});

  @override
  ConsumerState<_ChangePasswordForm> createState() =>
      _ChangePasswordFormState();
}

class _ChangePasswordFormState extends ConsumerState<_ChangePasswordForm> {
  final _oldPassCtrl = TextEditingController();
  final _newPassCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();

  @override
  void dispose() {
    _oldPassCtrl.dispose();
    _newPassCtrl.dispose();
    _confirmPassCtrl.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    if (_newPassCtrl.text != _confirmPassCtrl.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(L10n.tr('wrong_password', widget.locale)),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    final success = await ref.read(authProvider.notifier).changePassword(
          _oldPassCtrl.text,
          _newPassCtrl.text,
        );

    if (mounted) {
      if (success) {
        _oldPassCtrl.clear();
        _newPassCtrl.clear();
        _confirmPassCtrl.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(L10n.tr('save', widget.locale)),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(L10n.tr('wrong_password', widget.locale)),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final hasPassword = authState.currentUser?.hasPassword ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasPassword)
          TextField(
            controller: _oldPassCtrl,
            obscureText: true,
            decoration: InputDecoration(
              labelText: L10n.tr('old_password', widget.locale),
            ),
          ),
        if (hasPassword) const SizedBox(height: 12),
        TextField(
          controller: _newPassCtrl,
          obscureText: true,
          decoration: InputDecoration(
            labelText: L10n.tr('new_password', widget.locale),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _confirmPassCtrl,
          obscureText: true,
          decoration: InputDecoration(
            labelText: L10n.tr('confirm_password', widget.locale),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: _changePassword,
            child: Text(L10n.tr('save', widget.locale)),
          ),
        ),
      ],
    );
  }
}
