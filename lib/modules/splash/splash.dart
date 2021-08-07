import 'package:animated_card/animated_card.dart';
import 'package:auth_template_v2/shared/auth/auth_controller.dart';
import 'package:auth_template_v2/shared/components/default_loading_icon/default_loading_icon.dart';
import 'package:auth_template_v2/shared/config/app_sizes.dart';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final authController = AuthController();
  @override
  void initState() {
    super.initState();
    isAuthenticated(context);
  }

  Future<void> isAuthenticated(context) async {
    await Future.delayed(Duration(seconds: 2));
    await authController.isAuthenticated(context);
  }

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedCard(
            curve: Curves.bounceIn,
            direction: AnimatedCardDirection.top,
            duration: Duration(milliseconds: 1000),
            child: Center(
              child: FlutterLogo(
                size: sizes.displayWidth * 0.5,
              ),
            ),
          ),
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
