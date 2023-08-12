import 'dart:convert';

import 'package:test_app_union/features/auth/src/models/user.dart';

class AuthResponse {
  final Tokens tokens;
  final User user;

  AuthResponse({
    required this.tokens,
    required this.user,
  });

  factory AuthResponse.fromRawJson(String str) =>
      AuthResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        tokens: Tokens.fromJson(json["tokens"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "tokens": tokens.toJson(),
        "user": user.toJson(),
      };
}

class Tokens {
  final String accessToken;
  final String refreshToken;

  Tokens({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Tokens.fromRawJson(String str) => Tokens.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}
