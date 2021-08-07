import 'package:auth_template_v2/modules/login/controllers/login_controller.dart';
import 'package:auth_template_v2/shared/components/default_button/default_button.dart';
import 'package:auth_template_v2/shared/components/default_input_field/default_input_field.dart';
import 'package:auth_template_v2/shared/components/default_loading_icon/default_loading_icon.dart';
import 'package:auth_template_v2/shared/config/app_sizes.dart';
import 'package:auth_template_v2/theme/theme.dart';
import 'package:auth_template_v2/theme/theme_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = LoginController();

  bool invisiblePassword = true;
  IconData invisiblePasswordIcon = Icons.visibility_off_outlined;

  @override
  void initState() {
    super.initState();
    loginController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    final themeController = Provider.of<ThemeController>(context);

    return Container(
      width: sizes.displayHeight,
      height: sizes.displayHeight,
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: loginController.formKey,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: sizes.safeHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlutterLogo(
                          size: sizes.displayWidth * 0.6,
                        ),
                        SizedBox(height: sizes.defaultPaddingValue * 4),
                        Container(
                          width: sizes.displayWidth * 0.8,
                          child: Column(
                            children: [
                              DefaultInputField(
                                hintText: AppLocalizations.of(context)!.email,
                                icon: Icons.person_outlined,
                                fontColor: AppColors.fontColorLight,
                                controller: loginController.emailController,
                                textInputAction: TextInputAction.next,
                                inputFormatters: [LowerCaseTextFormatter()],
                                keyboardType: TextInputType.emailAddress,
                                validator: Validatorless.multiple(
                                  [
                                    Validatorless.email(
                                        AppLocalizations.of(context)!
                                            .emailValidator),
                                    Validatorless.required(
                                        AppLocalizations.of(context)!
                                            .emailValidator),
                                  ],
                                ),
                              ),
                              SizedBox(height: sizes.defaultPaddingValue),
                              DefaultInputField(
                                fontColor: AppColors.fontColorLight,
                                hintText:
                                    AppLocalizations.of(context)!.password,
                                icon: Icons.lock_outlined,
                                controller: loginController.passController,
                                obscureText: invisiblePassword,
                                onFieldSubmitted: (_) async {
                                  await loginController.login(context: context);
                                },
                                suffixIcon: IconButton(
                                    splashColor: AppColors.transparent,
                                    icon: Icon(
                                      invisiblePasswordIcon,
                                      color: invisiblePassword
                                          ? AppColors.primary.withOpacity(0.3)
                                          : AppColors.primary,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        invisiblePassword = !invisiblePassword;
                                        if (invisiblePassword) {
                                          invisiblePasswordIcon =
                                              Icons.visibility_off_outlined;
                                        } else {
                                          invisiblePasswordIcon =
                                              Icons.visibility_outlined;
                                        }
                                      });
                                    }),
                                keyboardType: TextInputType.visiblePassword,
                                validator: Validatorless.multiple(
                                  [
                                    Validatorless.required(
                                        AppLocalizations.of(context)!
                                            .passwordValidator),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: sizes.defaultPaddingValue * 2),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: sizes.displayWidth * 0.1),
                          child: DefaultButton(
                            color: AppColors.primary.withAlpha(230),
                            onPressed: () async {
                              await loginController.login(context: context);
                            },
                            child: loginController.state != LoginState.loading
                                ? Text(
                                    AppLocalizations.of(context)!.signIn,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: Colors.white),
                                  )
                                : DefaultLoadingIcon(
                                    size: 24,
                                    valueColor: AppColors.white,
                                    stroke: 3.5,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: sizes.defaultPaddingValue,
                    right: sizes.defaultPaddingValue,
                    child: IconButton(
                      icon: Icon(Icons.dark_mode),
                      onPressed: () {
                        themeController.changeTheme();
                      },
                    ),
                  )
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
