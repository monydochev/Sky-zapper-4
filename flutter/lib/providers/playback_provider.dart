import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/playback_entry.dart';
import '../data/repositories/disease_repository.dart';
import '../data/repositories/frequency_repository.dart';
import '../data/repositories/category_repository.dart';
import '../device/protocol/commands.dart';
import 'device_connection_provider.dart';

enum PlaybackStatus { idle, playing, paused, stopped }

class PlaybackState {
  final PlaybackStatus status;
  final List<PlaybackEntry> entries;
  final int currentIndex;
  final int remainingSeconds;
  final int totalSeconds;
  final String? currentProgramName;
  final double? currentFreqHz;
  final int currentCycle;
  final int totalCycles;

  const PlaybackState({
    this.status = PlaybackStatus.idle,
    this.entries = const [],
    this.currentIndex = 0,
    this.remainingSeconds = 0,
    this.totalSeconds = 0,
    this.currentProgramName,
    this.currentFreqHz,
    this.currentCycle = 1,
    this.totalCycles = 1,
  });

  bool get isPlaying => status == PlaybackStatus.playing;
  bool get isPaused => status == PlaybackStatus.paused;
  bool get isIdle =>
      status == PlaybackStatus.idle || status == PlaybackStatus.stopped;

  PlaybackEntry? get currentEntry =>
      (entries.isNotEmpty && currentIndex < entries.length)
          ? entries[currentIndex]
          : null;

  double get progress =>
      totalSeconds > 0 ? (totalSeconds - remainingSeconds) / totalSeconds : 0;

  String get remainingTimeFormatted {
    final min = remainingSeconds ~/ 60;
    final sec = remainingSeconds % 60;
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }

  String get totalTimeFormatted {
    final min = totalSeconds ~/ 60;
    final sec = totalSeconds % 60;
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }

  PlaybackState copyWith({
    PlaybackStatus? status,
    List<PlaybackEntry>? entries,
    int? currentIndex,
    int? remainingSeconds,
    int? totalSeconds,
    String? currentProgramName,
    double? currentFreqHz,
    int? currentCycle,
    int? totalCycles,
    bool clearCurrentProgram = false,
    bool clearCurrentFreq = false,
  }) {
    return PlaybackState(
      status: status ?? this.status,
      entries: entries ?? this.entries,
      currentIndex: currentIndex ?? this.currentIndex,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      totalSeconds: totalSeconds ?? this.totalSeconds,
      currentProgramName: clearCurrentProgram
          ? null
          : (currentProgramName ?? this.currentProgramName),
      currentFreqHz:
          clearCurrentFreq ? null : (currentFreqHz ?? this.currentFreqHz),
      currentCycle: currentCycle ?? this.currentCycle,
      totalCycles: totalCycles ?? this.totalCycles,
    );
  }
}

class PlaybackNotifier extends Notifier<PlaybackState> {
  late final DiseaseRepository _diseaseRepo;
  late final FrequencyRepository _freqRepo;
  late final CategoryRepository _categoryRepo;
  Timer? _timer;

  @override
  PlaybackState build() {
    _diseaseRepo = ref.watch(diseaseRepositoryProvider);
    _freqRepo = ref.watch(frequencyRepositoryProvider);
    _categoryRepo = ref.watch(categoryRepositoryProvider);

    ref.onDispose(() {
      _timer?.cancel();
    });

    return const PlaybackState();
  }

  DeviceConnectionNotifier get _connectionNotifier =>
      ref.read(deviceConnectionProvider.notifier);

  Future<void> playProgram(int diseaseId, String programName,
      {int repeatCount = 1, int pauseBetweenCycles = 0}) async {
    _timer?.cancel();

    final frequencies = await _freqRepo.getByDiseaseId(diseaseId);
    if (frequencies.isEmpty) return;

    final entries = <PlaybackEntry>[];
    int totalSec = 0;

    for (int cycle = 0; cycle < repeatCount; cycle++) {
      for (final freq in frequencies) {
        final entry = PlaybackEntry(
          programId: diseaseId,
          freqHz: freq.freq,
          freqId: freq.id,
          freqSec: freq.timeSec,
          programName: programName,
          pausePass: cycle,
        );
        entries.add(entry);
        totalSec += freq.timeSec;
      }

      // Add pause between cycles (except after last cycle)
      if (cycle < repeatCount - 1 && pauseBetweenCycles > 0) {
        entries.add(PlaybackEntry(
          programId: diseaseId,
          freqHz: 0,
          freqId: 0,
          freqSec: pauseBetweenCycles,
          pauseSec: pauseBetweenCycles,
          pauseType: 1,
          pausePass: cycle,
          programName: programName,
        ));
        totalSec += pauseBetweenCycles;
      }
    }

    state = PlaybackState(
      status: PlaybackStatus.playing,
      entries: entries,
      currentIndex: 0,
      remainingSeconds: totalSec,
      totalSeconds: totalSec,
      currentProgramName: programName,
      currentFreqHz: entries.first.freqHz,
      currentCycle: 1,
      totalCycles: repeatCount,
    );

    _sendCurrentFrequency();
    _startTimer();
  }

  Future<void> playGroup(int categoryId,
      {int pauseBetweenPrograms = 0,
      int repeatCount = 1,
      int pauseBetweenCycles = 0}) async {
    _timer?.cancel();

    final category = await _categoryRepo.getById(categoryId);
    if (category == null) return;

    final diseases = await _diseaseRepo.getByCategory(categoryId);
    if (diseases.isEmpty) return;

    final entries = <PlaybackEntry>[];
    int totalSec = 0;

    final actualRepeat = repeatCount > 0
        ? repeatCount
        : (category.repeat > 0 ? category.repeat : 1);
    final actualPauseProgram =
        pauseBetweenPrograms > 0 ? pauseBetweenPrograms : category.pauseProgram;
    final actualPauseCycle =
        pauseBetweenCycles > 0 ? pauseBetweenCycles : category.pauseRepeatCycle;

    for (int cycle = 0; cycle < actualRepeat; cycle++) {
      for (int d = 0; d < diseases.length; d++) {
        final disease = diseases[d];
        final frequencies = await _freqRepo.getByDiseaseId(disease.id);

        for (final freq in frequencies) {
          final entry = PlaybackEntry(
            programId: disease.id,
            freqHz: freq.freq,
            freqId: freq.id,
            freqSec: freq.timeSec,
            programName: disease.nameBg ?? disease.nameEn ?? '',
            pausePass: cycle,
          );
          entries.add(entry);
          totalSec += freq.timeSec;
        }

        // Pause between programs (except after last program)
        if (d < diseases.length - 1 && actualPauseProgram > 0) {
          entries.add(PlaybackEntry(
            programId: disease.id,
            freqHz: 0,
            freqId: 0,
            freqSec: actualPauseProgram,
            pauseSec: actualPauseProgram,
            pauseType: 0,
            pausePass: cycle,
            programName: disease.nameBg ?? disease.nameEn ?? '',
          ));
          totalSec += actualPauseProgram;
        }
      }

      // Pause between cycles (except after last cycle)
      if (cycle < actualRepeat - 1 && actualPauseCycle > 0) {
        entries.add(PlaybackEntry(
          programId: 0,
          freqHz: 0,
          freqId: 0,
          freqSec: actualPauseCycle,
          pauseSec: actualPauseCycle,
          pauseType: 1,
          pausePass: cycle,
        ));
        totalSec += actualPauseCycle;
      }
    }

    if (entries.isEmpty) return;

    state = PlaybackState(
      status: PlaybackStatus.playing,
      entries: entries,
      currentIndex: 0,
      remainingSeconds: totalSec,
      totalSeconds: totalSec,
      currentProgramName: entries.first.programName,
      currentFreqHz: entries.first.freqHz,
      currentCycle: 1,
      totalCycles: actualRepeat,
    );

    _sendCurrentFrequency();
    _startTimer();
  }

  void pause() {
    if (state.status != PlaybackStatus.playing) return;
    _timer?.cancel();
    state = state.copyWith(status: PlaybackStatus.paused);

    // Send stop frequency to device
    _connectionNotifier.sendCommand(Uint8List.fromList([
      0,
      0,
      Commands.cmdAdvanced,
      Commands.subSetPowerFreq,
      0, 0, 0, 0, // freq = 0
      0, // power = 0
    ]));
  }

  void resume() {
    if (state.status != PlaybackStatus.paused) return;
    state = state.copyWith(status: PlaybackStatus.playing);
    _sendCurrentFrequency();
    _startTimer();
  }

  void stop() {
    _timer?.cancel();

    // Send stop frequency to device
    _connectionNotifier.sendCommand(Uint8List.fromList([
      0,
      0,
      Commands.cmdAdvanced,
      Commands.subSetPowerFreq,
      0, 0, 0, 0, // freq = 0
      0, // power = 0
    ]));

    state = const PlaybackState(status: PlaybackStatus.stopped);
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _onTimerTick();
    });
  }

  void _onTimerTick() {
    if (state.status != PlaybackStatus.playing) return;

    final entry = state.currentEntry;
    if (entry == null) {
      stop();
      return;
    }

    final newRemaining = state.remainingSeconds - 1;
    entry.totalTimeSec++;

    if (entry.totalTimeSec >= entry.freqSec) {
      // Move to next entry
      final nextIndex = state.currentIndex + 1;
      if (nextIndex >= state.entries.length) {
        // Playback complete
        stop();
        return;
      }

      final nextEntry = state.entries[nextIndex];
      state = state.copyWith(
        currentIndex: nextIndex,
        remainingSeconds: newRemaining,
        currentProgramName: nextEntry.programName,
        currentFreqHz: nextEntry.freqHz,
        currentCycle: nextEntry.pausePass + 1,
      );
      _sendCurrentFrequency();
    } else {
      state = state.copyWith(remainingSeconds: newRemaining);
    }
  }

  void _sendCurrentFrequency() {
    final entry = state.currentEntry;
    if (entry == null) return;

    if (entry.pauseSec > 0) {
      // Pause entry: send zero frequency
      _connectionNotifier.sendCommand(Uint8List.fromList([
        0,
        0,
        Commands.cmdAdvanced,
        Commands.subSetPowerFreq,
        0, 0, 0, 0,
        0,
      ]));
      return;
    }

    // Convert frequency to device format (Hz * 100 as 4-byte LE)
    final freqInt = (entry.freqHz * 100).toInt();
    final freqBytes = ByteData(4);
    freqBytes.setUint32(0, freqInt, Endian.little);

    _connectionNotifier.sendCommand(Uint8List.fromList([
      0,
      0,
      Commands.cmdAdvanced,
      Commands.subSetPowerFreq,
      freqBytes.getUint8(0),
      freqBytes.getUint8(1),
      freqBytes.getUint8(2),
      freqBytes.getUint8(3),
      100, // power (will be overridden by device settings)
    ]));
  }
}

final diseaseRepositoryProvider = Provider<DiseaseRepository>((ref) {
  return DiseaseRepository();
});

final frequencyRepositoryProvider = Provider<FrequencyRepository>((ref) {
  return FrequencyRepository();
});

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});

final playbackProvider = NotifierProvider<PlaybackNotifier, PlaybackState>(
  PlaybackNotifier.new,
);
