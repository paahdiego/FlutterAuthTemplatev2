import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static String get logo => "assets/icons/logo.svg";

  static Future<void> loadCache() {
    return Future.wait([
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, AppIcons.logo),
        null,
      ),
    ]);
  }
}
