import 'package:auth_template_v2/l10n/l10n.dart';
import 'package:auth_template_v2/l10n/locale_provider.dart';
import 'package:auth_template_v2/modules/home/home.dart';
import 'package:auth_template_v2/modules/login/login.dart';
import 'package:auth_template_v2/modules/splash/splash.dart';
import 'package:auth_template_v2/theme/theme.dart';
import 'package:auth_template_v2/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, _) {
        return AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarBrightness: themeController.themeMode == ThemeMode.dark
                ? Brightness.dark
                : Brightness.light,
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: "/",
            themeMode: themeController.themeMode,
            darkTheme: ThemeData.dark().copyWith(
              primaryColor: AppColors.primaryDark,
              accentColor: AppColors.secondaryDark,
              scaffoldBackgroundColor: AppColors.black,
              textTheme: GoogleFonts.interTextTheme(
                Theme.of(context).textTheme.apply(
                      bodyColor: AppColors.fontColorDark,
                    ),
              ),
            ),
            theme: ThemeData.light().copyWith(
              primaryColor: AppColors.primary,
              accentColor: AppColors.secondary,
              scaffoldBackgroundColor: AppColors.white,
              textTheme: GoogleFonts.interTextTheme(
                Theme.of(context).textTheme.apply(
                      bodyColor: AppColors.fontColorLight,
                    ),
              ),
            ),
            routes: {
              "/": (context) => SplashPage(),
              "/login": (context) => LoginPage(),
              "/home": (context) => HomePage(),
            },
            locale: Provider.of<LocaleProvider>(context).locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
          ),
        );
      },
    );
  }
}
