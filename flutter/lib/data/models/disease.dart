class Disease {
  final int id;
  final String? nameEn;
  final String? nameBg;
  final String? descriptionEn;
  final String? descriptionBg;
  final int favorite;
  final int? categoryId;
  final int? sort;
  final int freqCount;

  Disease({
    required this.id,
    this.nameEn,
    this.nameBg,
    this.descriptionEn,
    this.descriptionBg,
    this.favorite = 0,
    this.categoryId,
    this.sort,
    this.freqCount = 0,
  });

  factory Disease.fromMap(Map<String, dynamic> map) {
    return Disease(
      id: map['id'] as int,
      nameEn: map['name_en'] as String?,
      nameBg: map['name_bg'] as String?,
      descriptionEn:
          map['description_en'] as String? ?? map['description_En'] as String?,
      descriptionBg: map['description_bg'] as String?,
      favorite: (map['favorite'] as int?) ?? 0,
      categoryId: map['category_id'] as int?,
      sort: map['sort'] as int?,
      freqCount: (map['freq_count'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_bg': nameBg,
      'description_en': descriptionEn,
      'description_bg': descriptionBg,
      'favorite': favorite,
      'category_id': categoryId,
      'sort': sort,
      'freq_count': freqCount,
    };
  }

  String getName(String locale) =>
      locale == 'bg' ? (nameBg ?? nameEn ?? '') : (nameEn ?? nameBg ?? '');

  String getDescription(String locale) => locale == 'bg'
      ? (descriptionBg ?? descriptionEn ?? '')
      : (descriptionEn ?? descriptionBg ?? '');
}
