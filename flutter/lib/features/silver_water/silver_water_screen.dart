import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants.dart';
import '../../core/l10n.dart';
import '../../device/protocol/commands.dart';
import '../../device/protocol/byte_offsets.dart';
import '../../providers/device_connection_provider.dart';
import '../../providers/locale_provider.dart';

// --- Simple Notifiers for silver water state ---

class _IntNotifier extends Notifier<int> {
  final int _defaultValue;
  _IntNotifier(this._defaultValue);

  @override
  int build() => _defaultValue;
  void set(int value) => state = value;
}

class _BoolNotifier extends Notifier<bool> {
  @override
  bool build() => false;
  void set(bool value) => state = value;
}

final _silverWaterCurrentProvider =
    NotifierProvider<_IntNotifier, int>(() => _IntNotifier(5));
final _silverWaterVolumeProvider =
    NotifierProvider<_IntNotifier, int>(() => _IntNotifier(200));
final _silverWaterConcentrationProvider =
    NotifierProvider<_IntNotifier, int>(() => _IntNotifier(2));
final _silverWaterRunningProvider =
    NotifierProvider<_BoolNotifier, bool>(_BoolNotifier.new);
final _silverWaterTimeRemainingProvider =
    NotifierProvider<_IntNotifier, int>(() => _IntNotifier(0));
final _silverWaterExpectedTimeProvider =
    NotifierProvider<_IntNotifier, int>(() => _IntNotifier(0));
final _silverWaterOutputCurrentProvider =
    NotifierProvider<_IntNotifier, int>(() => _IntNotifier(0));

class SilverWaterScreen extends ConsumerStatefulWidget {
  const SilverWaterScreen({super.key});

  @override
  ConsumerState<SilverWaterScreen> createState() => _SilverWaterScreenState();
}

class _SilverWaterScreenState extends ConsumerState<SilverWaterScreen> {
  Timer? _monitorTimer;

  @override
  void dispose() {
    _monitorTimer?.cancel();
    super.dispose();
  }

  void _startMonitoring() {
    _monitorTimer?.cancel();
    _monitorTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      // Request device status to update silver water readings
      final notifier = ref.read(deviceConnectionProvider.notifier);
      notifier.sendCommand(Uint8List.fromList([
        0,
        0,
        Commands.cmdReadAll,
        0,
      ]));
    });
  }

  void _stopMonitoring() {
    _monitorTimer?.cancel();
    _monitorTimer = null;
  }

  Future<void> _startSilverWater() async {
    final connectionState = ref.read(deviceConnectionProvider);
    if (!connectionState.isConnected || connectionState.deviceInfo == null) {
      return;
    }

    final deviceInfo = connectionState.deviceInfo!;
    final offsets = ByteOffsets.forModel(deviceInfo.shortMac);
    final notifier = ref.read(deviceConnectionProvider.notifier);

    final currentMa = ref.read(_silverWaterCurrentProvider);
    final volume = ref.read(_silverWaterVolumeProvider);
    final concentration = ref.read(_silverWaterConcentrationProvider);

    // Write current setpoint
    await notifier.sendCommand(Uint8List.fromList([
      0,
      0,
      Commands.cmdWriteSettings,
      offsets.currentSetPoint,
      currentMa,
    ]));

    // Write water quantity (2 bytes LE)
    final volumeBytes = ByteData(2);
    volumeBytes.setUint16(0, volume, Endian.little);
    await notifier.sendCommand(Uint8List.fromList([
      0,
      0,
      Commands.cmdWriteSettings,
      offsets.waterQuantity,
      volumeBytes.getUint8(0),
      volumeBytes.getUint8(1),
    ]));

    // Write concentration
    await notifier.sendCommand(Uint8List.fromList([
      0,
      0,
      Commands.cmdWriteSettings,
      offsets.silverConcentration,
      concentration,
    ]));

    // Start silver water (set silverWaterOn = 1)
    await notifier.sendCommand(Uint8List.fromList([
      0,
      0,
      Commands.cmdWriteSettings,
      offsets.silverWaterOn,
      1,
    ]));

    ref.read(_silverWaterRunningProvider.notifier).set(true);
    _startMonitoring();
  }

  Future<void> _stopSilverWater() async {
    final connectionState = ref.read(deviceConnectionProvider);
    if (!connectionState.isConnected || connectionState.deviceInfo == null) {
      return;
    }

    final deviceInfo = connectionState.deviceInfo!;
    final offsets = ByteOffsets.forModel(deviceInfo.shortMac);
    final notifier = ref.read(deviceConnectionProvider.notifier);

    // Stop silver water (set silverWaterOn = 0)
    await notifier.sendCommand(Uint8List.fromList([
      0,
      0,
      Commands.cmdWriteSettings,
      offsets.silverWaterOn,
      0,
    ]));

    ref.read(_silverWaterRunningProvider.notifier).set(false);
    _stopMonitoring();
  }

  String _formatTime(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;
    if (hours > 0) {
      return '${hours}h ${minutes.toString().padLeft(2, '0')}m ${secs.toString().padLeft(2, '0')}s';
    }
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final connectionState = ref.watch(deviceConnectionProvider);
    final isRunning = ref.watch(_silverWaterRunningProvider);
    final currentMa = ref.watch(_silverWaterCurrentProvider);
    final volume = ref.watch(_silverWaterVolumeProvider);
    final concentration = ref.watch(_silverWaterConcentrationProvider);
    final timeRemaining = ref.watch(_silverWaterTimeRemainingProvider);
    final expectedTime = ref.watch(_silverWaterExpectedTimeProvider);
    final outputCurrent = ref.watch(_silverWaterOutputCurrentProvider);

    final isConnected = connectionState.isConnected;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                L10n.tr('silver_water', locale),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),

              // Current (mA) selector
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        L10n.tr('current_ma', locale),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children:
                            AppConstants.silverWaterCurrentOptions.map((val) {
                          return ChoiceChip(
                            selected: currentMa == val,
                            label: Text('$val mA'),
                            onSelected: isRunning
                                ? null
                                : (selected) {
                                    if (selected) {
                                      ref
                                          .read(_silverWaterCurrentProvider
                                              .notifier)
                                          .set(val);
                                    }
                                  },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Water Volume selector
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        L10n.tr('water_volume', locale),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      SegmentedButton<int>(
                        segments:
                            AppConstants.silverWaterVolumeOptions.map((val) {
                          return ButtonSegment(
                            value: val,
                            label: Text('$val ml'),
                          );
                        }).toList(),
                        selected: {volume},
                        onSelectionChanged: isRunning
                            ? null
                            : (selected) {
                                ref
                                    .read(
                                        _silverWaterVolumeProvider.notifier)
                                    .set(selected.first);
                              },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Concentration selector
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        L10n.tr('concentration', locale),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      SegmentedButton<int>(
                        segments: AppConstants
                            .silverWaterConcentrationOptions
                            .map((val) {
                          return ButtonSegment(
                            value: val,
                            label: Text('$val ppm'),
                          );
                        }).toList(),
                        selected: {concentration},
                        onSelectionChanged: isRunning
                            ? null
                            : (selected) {
                                ref
                                    .read(_silverWaterConcentrationProvider
                                        .notifier)
                                    .set(selected.first);
                              },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Start/Stop button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: isRunning
                    ? FilledButton.icon(
                        onPressed: isConnected ? _stopSilverWater : null,
                        icon: const Icon(Icons.stop),
                        label: Text(L10n.tr('stop', locale)),
                        style: FilledButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.error,
                        ),
                      )
                    : FilledButton.icon(
                        onPressed: isConnected ? _startSilverWater : null,
                        icon: const Icon(Icons.play_arrow),
                        label: Text(L10n.tr('start', locale)),
                      ),
              ),
              const SizedBox(height: 16),

              // Monitoring display
              if (isRunning) ...[
                Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Remaining time
                        _buildMonitorRow(
                          context,
                          L10n.tr('remaining_time', locale),
                          _formatTime(timeRemaining),
                          Icons.timer,
                        ),
                        const SizedBox(height: 12),

                        // Expected time
                        _buildMonitorRow(
                          context,
                          L10n.tr('expected_time', locale),
                          _formatTime(expectedTime),
                          Icons.schedule,
                        ),
                        const SizedBox(height: 12),

                        // Output current
                        _buildMonitorRow(
                          context,
                          L10n.tr('output_current', locale),
                          '$outputCurrent mA',
                          Icons.electric_bolt,
                        ),

                        // Progress bar
                        if (expectedTime > 0) ...[
                          const SizedBox(height: 16),
                          LinearProgressIndicator(
                            value: expectedTime > 0
                                ? (expectedTime - timeRemaining) /
                                    expectedTime
                                : 0,
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                // No current warning
                if (isRunning && outputCurrent == 0) ...[
                  const SizedBox(height: 12),
                  Card(
                    color: Theme.of(context).colorScheme.errorContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.warning_amber,
                            color:
                                Theme.of(context).colorScheme.onErrorContainer,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              L10n.tr('no_current_warning', locale),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onErrorContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],

              if (!isConnected) ...[
                const SizedBox(height: 16),
                Card(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(L10n.tr('disconnected', locale)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMonitorRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
