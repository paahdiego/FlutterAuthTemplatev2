import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  final themeModeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);

  ThemeMode get themeMode => themeModeNotifier.value;

  void changeTheme() {
    if (themeModeNotifier.value == ThemeMode.dark)
      themeModeNotifier.value = ThemeMode.light;
    else
      themeModeNotifier.value = ThemeMode.dark;
    notifyListeners();
  }
}
