import 'package:auth_template_v2/shared/auth/auth_model.dart';
import 'package:auth_template_v2/shared/models/user_model.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  Future<void> isAuthenticated(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("token")) {
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  void authenticate(AuthModel auth) async {
    if (auth.user != null) saveUser(auth.user!);
    saveToken(auth.accessToken);
  }

  void saveToken(String token) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("token", token);
    return;
  }

  Future<String> getToken() async {
    final instance = await SharedPreferences.getInstance();
    final token = instance.get("token") as String;
    return token;
  }

  void saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<UserModel> getUser() async {
    final instance = await SharedPreferences.getInstance();
    final json = instance.get("user") as String;
    return UserModel.fromJson(json);
  }

  Future<void> logout() async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove("user");
    await instance.remove("token");
    return;
  }
}
