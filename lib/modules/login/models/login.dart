import 'dart:convert';

class LoginModel {
  final String username;
  final String password;
  LoginModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));
}
