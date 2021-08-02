import 'package:auth_template_v2/modules/login/models/login.dart';
import 'package:auth_template_v2/shared/models/user.dart';

class AuthService {
  Future<UserModel?> login(LoginModel credentials) async {
    try {
      await Future.delayed(Duration(seconds: 2));

      if (credentials ==
          LoginModel(username: "dev@auth.com", password: "123456"))
        return UserModel(name: "Developer", photoUrl: "null");
      throw "Usuário não cadastrado";
    } catch (error) {
      throw error;
    }
  }
}
