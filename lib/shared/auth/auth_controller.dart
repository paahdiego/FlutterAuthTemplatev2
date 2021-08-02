import 'package:auth_template_v2/shared/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  final authenticationStatus = ValueNotifier<AuthenticationStatus>(
      AuthenticationStatus.not_authenticated);

  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      Navigator.pushReplacementNamed(context, "/home", arguments: user);
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  void saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    _user = user;
    return;
  }

  Future<void> clearUser() async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove("user");
    _user = null;
    return;
  }

  Future<UserModel> getUser() async {
    final instance = await SharedPreferences.getInstance();
    final json = instance.get("user") as String;

    return UserModel.fromJson(json);
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 1));
    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      setUser(context, UserModel.fromJson(json));
    } else {
      setUser(context, null);
    }
    return;
  }
}

enum AuthenticationStatus {
  authenticated,
  not_authenticated,
}
