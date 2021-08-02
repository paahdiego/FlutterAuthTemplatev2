import 'package:auth_template_v2/app_widget.dart';
import 'package:auth_template_v2/shared/controllers/menu.dart';
import 'package:auth_template_v2/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeController()),
        ChangeNotifierProvider(create: (context) => MenuController()),
      ],
      builder: (context, _) => AppWidget(),
    ),
  );
}
