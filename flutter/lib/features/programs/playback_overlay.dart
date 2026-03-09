import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n.dart';
import '../../providers/locale_provider.dart';
import '../../providers/playback_provider.dart';

class PlaybackOverlay extends ConsumerWidget {
  const PlaybackOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final playbackState = ref.watch(playbackProvider);
    final playbackNotifier = ref.read(playbackProvider.notifier);

    if (playbackState.isIdle) return const SizedBox.shrink();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Progress bar
          LinearProgressIndicator(
            value: playbackState.progress,
            minHeight: 3,
            backgroundColor:
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
          ),

          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                // Program info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Current program name
                      if (playbackState.currentProgramName != null)
                        Text(
                          playbackState.currentProgramName!,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                      const SizedBox(height: 2),

                      // Frequency and time info
                      Row(
                        children: [
                          if (playbackState.currentFreqHz != null &&
                              playbackState.currentFreqHz! > 0) ...[
                            Icon(
                              Icons.graphic_eq,
                              size: 14,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${playbackState.currentFreqHz} Hz',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(width: 12),
                          ],
                          Icon(
                            Icons.timer,
                            size: 14,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${playbackState.remainingTimeFormatted} / ${playbackState.totalTimeFormatted}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          if (playbackState.totalCycles > 1) ...[
                            const SizedBox(width: 12),
                            Text(
                              '${L10n.tr('cycle', locale)} ${playbackState.currentCycle}/${playbackState.totalCycles}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),

                // Playback controls
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Play/Pause
                    IconButton(
                      onPressed: () {
                        if (playbackState.isPlaying) {
                          playbackNotifier.pause();
                        } else if (playbackState.isPaused) {
                          playbackNotifier.resume();
                        }
                      },
                      icon: Icon(
                        playbackState.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 28,
                      ),
                      tooltip: playbackState.isPlaying
                          ? L10n.tr('pause', locale)
                          : L10n.tr('play', locale),
                    ),

                    // Stop
                    IconButton(
                      onPressed: () => playbackNotifier.stop(),
                      icon: const Icon(Icons.stop, size: 28),
                      tooltip: L10n.tr('stop', locale),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
