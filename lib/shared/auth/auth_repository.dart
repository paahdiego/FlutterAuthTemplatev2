import 'dart:convert';

import 'package:auth_template_v2/modules/login/models/login_model.dart';
import 'package:auth_template_v2/shared/auth/auth_model.dart';
import 'package:auth_template_v2/shared/config/connection.dart';

import 'package:http/http.dart' as http;

class AuthRepository {
  Future<AuthModel> login(LoginModel credentials) async {
    final uri = getUri("auth/login");
    print(uri.toString());

    try {
      final response = await http.post(
        uri,
        body: credentials.toMap(),
      );

      if (response.statusCode == 200) {
        return AuthModel.fromJson(response.body);
      } else {
        final error = jsonDecode(response.body);
        throw "${error["status"]}: ${error["message"]}";
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
