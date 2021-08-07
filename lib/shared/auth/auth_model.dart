import 'dart:convert';

import 'package:auth_template_v2/shared/models/user_model.dart';

class AuthModel {
  final UserModel? user;
  final String accessToken;
  AuthModel({
    this.user,
    required this.accessToken,
  });

  AuthModel copyWith({
    UserModel? user,
    String? accessToken,
  }) {
    return AuthModel(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user?.toMap(),
      'access_token': accessToken,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      user: UserModel.fromMap(map['user']),
      accessToken: map['access_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));

  @override
  String toString() => 'AuthModel(user: $user, accessToken: $accessToken)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthModel &&
        other.user == user &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode => user.hashCode ^ accessToken.hashCode;
}
