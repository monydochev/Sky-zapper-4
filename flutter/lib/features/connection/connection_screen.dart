import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n.dart';
import '../../providers/device_connection_provider.dart';
import '../../providers/locale_provider.dart';

class ConnectionScreen extends ConsumerWidget {
  const ConnectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final connectionState = ref.watch(deviceConnectionProvider);
    final connectionNotifier = ref.read(deviceConnectionProvider.notifier);
    final isDesktop = _isDesktopPlatform();

    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.tr('connect', locale)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Connection status
            if (connectionState.isConnected) ...[
              Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                  title: Text(L10n.tr('connected', locale)),
                  subtitle: connectionState.deviceInfo != null
                      ? Text(
                          '${L10n.tr('model', locale)}: ${connectionState.deviceInfo!.modelName}')
                      : null,
                  trailing: FilledButton.tonal(
                    onPressed: () => connectionNotifier.disconnect(),
                    child: Text(L10n.tr('disconnect', locale)),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],

            // USB Section (desktop only)
            if (isDesktop) ...[
              Text(
                L10n.tr('usb', locale),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.usb),
                          const SizedBox(width: 8),
                          Text(
                            L10n.tr('usb', locale),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'COM Port:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      // COM port selection would go here
                      // For now, a placeholder
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          hintText: 'Select COM port',
                        ),
                        items: const [],
                        onChanged: connectionState.isConnected ? null : (_) {},
                      ),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: connectionState.isConnected
                            ? null
                            : () {
                                // USB connection logic
                              },
                        icon: const Icon(Icons.cable),
                        label: Text(L10n.tr('connect', locale)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],

            // WiFi / LAN Section
            Text(
              L10n.tr('wifi_lan', locale),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.wifi),
                        const SizedBox(width: 8),
                        Text(
                          L10n.tr('wifi_lan', locale),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        if (connectionState.isScanning)
                          FilledButton.tonalIcon(
                            onPressed: null,
                            icon: const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            label: Text(L10n.tr('scanning', locale)),
                          )
                        else ...[
                          FilledButton.tonalIcon(
                            onPressed: connectionState.isConnected
                                ? null
                                : () => connectionNotifier.scanBroadcast(),
                            icon: const Icon(Icons.wifi_find),
                            label: Text(L10n.tr('search', locale)),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton.icon(
                            onPressed: connectionState.isConnected
                                ? null
                                : () => connectionNotifier.scanSubnet(),
                            icon: const Icon(Icons.lan),
                            label: Text(L10n.tr('scan_subnet', locale)),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Discovered devices
                    if (connectionState.discoveredDevices.isEmpty &&
                        !connectionState.isScanning) ...[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              Icon(
                                Icons.devices,
                                size: 48,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.4),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                L10n.tr('no_devices_found', locale),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.6),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ] else ...[
                      ...connectionState.discoveredDevices.map(
                        (ip) => ListTile(
                          leading: const Icon(Icons.router),
                          title: Text(ip),
                          trailing: FilledButton(
                            onPressed: connectionState.isConnected
                                ? null
                                : () => connectionNotifier.connectLan(ip),
                            child: Text(L10n.tr('connect', locale)),
                          ),
                        ),
                      ),
                    ],

                    // Error display
                    if (connectionState.error != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        connectionState.error!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isDesktopPlatform() {
    try {
      return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
    } catch (_) {
      return false;
    }
  }
}
