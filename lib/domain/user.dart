import 'dart:ui';

class User {
  final String id;
  final String email;
  final String name;
  final Color avatarColor;

  User(this.id, this.email, this.name, this.avatarColor);

  User copyWith({String? email, String? name, Color? avatarColor}) =>
      User(id, email ?? this.email, name ?? this.name, avatarColor ?? this.avatarColor);
}
