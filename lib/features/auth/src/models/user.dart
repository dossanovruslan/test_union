import 'dart:convert';

class User {
  final int id;
  final String email;
  final String nickname;

  User({
    required this.id,
    required this.email,
    required this.nickname,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        nickname: json["nickname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "nickname": nickname,
      };
}
