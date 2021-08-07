import 'package:flutter/material.dart';

class AppSizes extends ChangeNotifier {
  //Sizes
  Size displaySize = Size(0, 0);
  double defaultWidgetWidth = 0;
  double defaultPaddingValue = 20;

  final BuildContext context;
  late MediaQueryData mediaQuery;

  AppSizes(
    this.context,
  ) {
    mediaQuery = MediaQuery.of(context);
    displaySize = MediaQuery.of(context).size;
    defaultWidgetWidth = displaySize.width * 0.9;

    defaultPaddingValue = displaySize.width * 0.1 / 2;
  }
  //Sizes
  double get displayWidth => displaySize.width;
  double get displayHeight => displaySize.height;
  double get safeHeight => displayHeight - safePaddingTop - safePaddingBottom;

  //Padding
  double get safePaddingTop => mediaQuery.padding.top;
  double get safePaddingBottom => mediaQuery.padding.bottom;
  EdgeInsets get defaultHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: this.defaultPaddingValue);

  ////BorderRadius
  BorderRadius get defaultBorderRadius => BorderRadius.all(Radius.circular(10));
}
