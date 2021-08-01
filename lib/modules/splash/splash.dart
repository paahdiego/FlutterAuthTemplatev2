import 'package:auth_template_v2/shared/config/app_sizes.dart';
import 'package:auth_template_v2/shared/widgets/default_loading_icon/default_loading_icon.dart';
import 'package:auth_template_v2/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // final AuthController authController = AuthController();
  @override
  void initState() {
    super.initState();
    // currentUser(context);
  }

  // Future<void> currentUser(context) async {
  //   await authController.currentUser(context);
  // }

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FlutterLogo(size: sizes.displayWidth * 0.5),
          SizedBox(
            height: sizes.displayHeight * 0.1,
          ),
          Center(
            child: DefaultLoadingIcon(
              size: sizes.displayHeight * 0.05,
              stroke: 4.5,
            ),
          )
        ],
      ),
    );
  }
}
