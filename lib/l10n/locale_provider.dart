import 'package:auth_template_v2/l10n/l10n.dart';
import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale = L10n.all[0];

  Locale get locale => _locale!;

  set locale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
