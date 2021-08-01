import 'package:flutter/material.dart';

class AppImages {
  // static String get logo = "assets/images/logo.png";

  static Future<void> loadCache(BuildContext context) {
    return Future.wait([
      //  precacheImage(Image.asset(AppImages.logo).image, context),
    ]);
  }
}
