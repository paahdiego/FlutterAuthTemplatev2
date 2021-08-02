import 'package:auth_template_v2/modules/login/controllers/login_controller.dart';
import 'package:auth_template_v2/modules/side_menu/side_menu.dart';
import 'package:auth_template_v2/shared/config/app_sizes.dart';
import 'package:auth_template_v2/shared/controllers/menu.dart';
import 'package:auth_template_v2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool invisiblePassword = true;
  IconData invisiblePasswordIcon = Icons.visibility_off_outlined;

  final controller = LoginController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    AppSizes sizes = AppSizes(context);

    return Scaffold(
      key: Provider.of<MenuController>(context).scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterLogo(),
                      SizedBox(height: sizes.displayHeight * 0.07),
                      Column(
                        children: [
                          TextFormField(),
                          SizedBox(height: sizes.displayHeight * 0.05),
                          TextFormField(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
