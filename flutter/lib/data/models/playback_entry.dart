class PlaybackEntry {
  final int programId;
  final double freqHz;
  final int freqId;
  final int freqSec;
  int totalTimeSec;
  final int pauseSec;
  final int pauseType; // 0=program pause, 1=cycle pause
  final int pausePass; // repeat iteration counter
  final String? programName;

  PlaybackEntry({
    required this.programId,
    required this.freqHz,
    required this.freqId,
    required this.freqSec,
    this.totalTimeSec = 0,
    this.pauseSec = 0,
    this.pauseType = 0,
    this.pausePass = 0,
    this.programName,
  });
}
