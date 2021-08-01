import 'package:auth_template_v2/modules/home/home.dart';
import 'package:auth_template_v2/modules/login/login.dart';
import 'package:auth_template_v2/modules/splash/splash.dart';
import 'package:auth_template_v2/theme/theme.dart';
import 'package:auth_template_v2/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      themeMode: Provider.of<ThemeController>(context).themeMode,
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: AppColors.primaryDark,
        accentColor: AppColors.secondaryDark,
        scaffoldBackgroundColor: AppColors.black,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: AppColors.secondary,
              ),
        ),
      ),
      theme: ThemeData.light().copyWith(
        primaryColor: AppColors.primary,
        accentColor: AppColors.secondary,
        scaffoldBackgroundColor: AppColors.white,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: AppColors.secondary,
              ),
        ),
      ),
      routes: {
        "/": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
