import 'dart:developer';

import 'package:auth_template_v2/modules/login/models/login.dart';
import 'package:auth_template_v2/shared/auth/auth_controller.dart';
import 'package:auth_template_v2/shared/auth/auth_repository.dart';
import 'package:flutter/material.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginController extends ChangeNotifier {
  //State
  final stateNotifier = ValueNotifier<LoginState>(LoginState.not_loading);
  set state(LoginState state) => stateNotifier.value = state;
  LoginState get state => stateNotifier.value;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final authRepository = AuthRepository();

  Future<void> login({
    required BuildContext context,
  }) async {
    final authController = AuthController();

    if (formKey.currentState!.validate()) {
      state = LoginState.loading;
      notifyListeners();
      final login = LoginModel(
        email: emailController.text,
        password: passController.text,
      );

      try {
        final response = await authRepository.login(login);
        print(response);

        authController.authenticate(response);
        Navigator.pushReplacementNamed(context, "/home");
        state = LoginState.not_loading;
        notifyListeners();
      } catch (error) {
        state = LoginState.not_loading;
        notifyListeners();
        log(error.toString());
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "$error",
          ),
        );
      }
    }
  }
}

enum LoginState {
  loading,
  not_loading,
}
