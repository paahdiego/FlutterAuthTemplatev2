import 'package:auth_template_v2/shared/config/app_sizes.dart';
import 'package:auth_template_v2/shared/controllers/menu.dart';
import 'package:auth_template_v2/shared/models/user_model.dart';
import 'package:auth_template_v2/theme/theme.dart';
import 'package:auth_template_v2/theme/theme_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auth_template_v2/l10n/l10n.dart';
import 'package:auth_template_v2/l10n/locale_provider.dart';
import 'package:auth_template_v2/modules/home/controllers/home_controller.dart';
import 'package:auth_template_v2/modules/home/widgets/drawer_list_tile/drawer_list_tile.dart';

import 'package:auth_template_v2/shared/auth/auth_controller.dart';

import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final authController = AuthController();
  UserModel? user;
  @override
  void initState() {
    //loadUser();
    super.initState();
  }

  Future<void> loadUser() async {
    user = await authController.getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final homeController = Provider.of<HomeController>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final sizes = AppSizes(context);
    final themeController = Provider.of<ThemeController>(context);

    return Material(
      child: Drawer(
        elevation: 2.0,
        child: SingleChildScrollView(
          child: Container(
            height: sizes.displayHeight,
            color: Theme.of(context).accentColor,
            child: Column(
              children: [
                DrawerHeader(
                  child: Column(
                    children: [
                      /* SvgPicture.asset(
                        AppIcons.logo,
                        height: sizes.displayHeight * 0.1,
                      ), */
                      SizedBox(height: 20),
                      if (user != null)
                        Text(
                          /* user!.name != null
                              ? user!.name!
                              : user!.email! ?? "Usuário", */
                          "user",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: AppColors.white,
                                  ),
                        ),
                      if (user == null)
                        Text(
                          "Usuário",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: AppColors.white,
                                  ),
                        ),
                    ],
                  ),
                ),
                DrawerListTile(
                  title: themeController.themeMode.toString(),
                  icon: Icon(Icons.dark_mode),
                  onTap: () {
                    themeController.changeTheme();
                  },
                ),
                DrawerListTile(
                  title: AppLocalizations.of(context)!.language,
                  icon: Text(
                    L10n.getFlag(localeProvider.locale.languageCode),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 24),
                  ),
                  onTap: () {
                    int currentIndex = L10n.all.indexOf(localeProvider.locale);
                    int total = L10n.all.length;
                    int nextIndex = 0;
                    if (currentIndex != total - 1) {
                      nextIndex = currentIndex + 1;
                    }
                    localeProvider.locale = L10n.all[nextIndex];
                  },
                ),
                DrawerListTile(
                  title: "Página 1",
                  icon: Icon(
                    Icons.home_repair_service_outlined,
                    color: AppColors.white,
                  ),
                  onTap: () {
                    Provider.of<MenuController>(context, listen: false)
                        .controlMenu();
                  },
                ),
                DrawerListTile(
                  title: AppLocalizations.of(context)!.logout,
                  icon: Icon(
                    Icons.power_settings_new_outlined,
                    color: AppColors.white,
                  ),
                  onTap: () async {
                    await authController.logout().then(
                          (_) => Navigator.pushReplacementNamed(context, "/"),
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
