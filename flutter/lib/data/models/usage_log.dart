class UsageLog {
  final int? id;
  final String dateTimeStart;
  final String? dateTimeEnd;
  final int userId;
  final int programId;
  final int? durationSec;

  UsageLog({
    this.id,
    required this.dateTimeStart,
    this.dateTimeEnd,
    required this.userId,
    required this.programId,
    this.durationSec,
  });

  Map<String, dynamic> toMap() => {
        'date_time_start': dateTimeStart,
        'date_time_end': dateTimeEnd,
        'user_id': userId,
        'program_id': programId,
        'duration_sec': durationSec,
      };
}
