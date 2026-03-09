class CustomGroup {
  final int id;
  final String name;
  final int sort;
  final int userId;

  CustomGroup({
    required this.id,
    required this.name,
    this.sort = 0,
    required this.userId,
  });

  factory CustomGroup.fromMap(Map<String, dynamic> map) => CustomGroup(
        id: map['id'] as int,
        name: map['name'] as String,
        sort: (map['sort'] as int?) ?? 0,
        userId: map['user_id'] as int,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'sort': sort,
        'user_id': userId,
      };
}
