class Category {
  final int id;
  final String? categoryNameBG;
  final String? categoryNameEN;
  final int favorite;
  final int repeat;
  final int pauseProgram;
  final int pauseRepeatCycle;
  final int? userId;
  final int? sort;
  final int typeId;
  final int programCount;

  Category({
    required this.id,
    this.categoryNameBG,
    this.categoryNameEN,
    this.favorite = 0,
    this.repeat = 0,
    this.pauseProgram = 0,
    this.pauseRepeatCycle = 0,
    this.userId,
    this.sort,
    this.typeId = -1,
    this.programCount = 0,
  });

  factory Category.fromMap(Map<String, dynamic> map) => Category(
        id: map['id'] as int,
        categoryNameBG: map['category_name_BG'] as String?,
        categoryNameEN: map['category_name_EN'] as String?,
        favorite: (map['favorite'] as int?) ?? 0,
        repeat: (map['repeat'] as int?) ?? 0,
        pauseProgram: (map['pause_program'] as int?) ?? 0,
        pauseRepeatCycle: (map['pause_repeat_cycle'] as int?) ?? 0,
        userId: map['user_id'] as int?,
        sort: map['sort'] as int?,
        typeId: (map['type_id'] as int?) ?? -1,
        programCount: (map['program_count'] as int?) ?? 0,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'category_name_BG': categoryNameBG,
        'category_name_EN': categoryNameEN,
        'favorite': favorite,
        'repeat': repeat,
        'pause_program': pauseProgram,
        'pause_repeat_cycle': pauseRepeatCycle,
        'user_id': userId,
        'sort': sort,
        'type_id': typeId,
      };

  String getName(String locale) => locale == 'bg'
      ? (categoryNameBG ?? categoryNameEN ?? '')
      : (categoryNameEN ?? categoryNameBG ?? '');
}
