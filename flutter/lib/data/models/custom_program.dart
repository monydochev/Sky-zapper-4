class CustomProgram {
  final int id;
  final int groupId;
  final int programId;
  final int sort;
  final String? programName; // from join
  final String? programNameEn;

  CustomProgram({
    required this.id,
    required this.groupId,
    required this.programId,
    this.sort = 0,
    this.programName,
    this.programNameEn,
  });

  factory CustomProgram.fromMap(Map<String, dynamic> map) => CustomProgram(
        id: map['id'] as int,
        groupId: map['group_id'] as int,
        programId: map['program_id'] as int,
        sort: (map['sort'] as int?) ?? 0,
        programName: map['name_bg'] as String?,
        programNameEn: map['name_en'] as String?,
      );
}
