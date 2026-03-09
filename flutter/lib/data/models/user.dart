class AppUser {
  final int id;
  final String? name;
  final String? powerOptions;
  final String? pass;

  AppUser({
    required this.id,
    this.name,
    this.powerOptions,
    this.pass,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) => AppUser(
        id: map['id'] as int,
        name: map['name'] as String?,
        powerOptions: map['power_options'] as String?,
        pass: map['pass'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'power_options': powerOptions,
        'pass': pass,
      };

  bool get isAdmin => id == 1;
  bool get hasPassword => pass != null && pass!.isNotEmpty;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AppUser && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
