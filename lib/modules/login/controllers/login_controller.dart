import 'package:auth_template_v2/modules/login/models/login.dart';
import 'package:auth_template_v2/shared/auth/auth_controller.dart';
import 'package:auth_template_v2/shared/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginController extends ChangeNotifier {
  final stateNotifier = ValueNotifier<LoginState>(LoginState.not_loading);

  set state(LoginState state) => stateNotifier.value = state;
  LoginState get state => stateNotifier.value;

  Future<void> login({
    required formKey,
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    final authController = AuthController();
    if (formKey.currentState!.validate()) {
      state = LoginState.loading;
      notifyListeners();
      LoginModel login = LoginModel(
        username: username,
        password: password,
      );

      try {
        final user = await AuthService().login(login);
        if (user != null) {
          authController.saveUser(user);
          Navigator.pushReplacementNamed(context, "/home");
        }

        state = LoginState.not_loading;
        notifyListeners();
      } catch (error) {
        state = LoginState.not_loading;
        notifyListeners();
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
