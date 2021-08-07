import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final _currentPage = ValueNotifier<AppPages>(AppPages.deliveries);

  set page(AppPages page) {
    _currentPage.value = page;

    notifyListeners();
  }

  AppPages get page => _currentPage.value;
}

enum AppPages {
  deliveries,
}
