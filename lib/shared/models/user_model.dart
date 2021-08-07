import 'dart:convert';

class UserModel {
  final String name;
  final String? photoUrl;

  UserModel({
    required this.name,
    this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
