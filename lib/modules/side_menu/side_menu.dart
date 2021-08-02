import 'package:auth_template_v2/modules/side_menu/widgets/drawer_list_tile/drawer_list_tile.dart';
import 'package:auth_template_v2/shared/auth/auth_controller.dart';
import 'package:auth_template_v2/shared/config/app_sizes.dart';
import 'package:auth_template_v2/shared/controllers/menu.dart';
import 'package:auth_template_v2/shared/models/user.dart';
import 'package:auth_template_v2/theme/theme.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    loadUser();
    super.initState();
  }

  Future<void> loadUser() async {
    user = await authController.getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final homeController = Provider.of<HomeController>(context);
    // final localeProvider = Provider.of<LocaleProvider>(context);
    // final locale = localeProvider.locale;
    AppSizes sizes = AppSizes(context);
    return Drawer(
      elevation: 2.0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  FlutterLogo(size: sizes.displayHeight * 0.1),
                  SizedBox(height: sizes.defaultPaddingValue),
                  Text(
                    user != null ? user!.name : "Usuário",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                  ),
                ],
              ),
            ),
            Divider(
              height: 2,
              color: AppColors.primary,
            ),
            DrawerListTile(
              // title: AppLocalizations.of(context)!.language,
              title: "Language",
              icon: Text(
                "L10n.getFlag(locale.languageCode)",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 24),
              ),
              onTap: () {
                /* int currentIndex = L10n.all.indexOf(locale);
                int total = L10n.all.length;
                int nextIndex = 0;
                if (currentIndex != total - 1) {
                  nextIndex = currentIndex + 1;
                }
                localeProvider.locale = L10n.all[nextIndex]; */
              },
            ),
            Divider(
              height: 2,
              color: AppColors.primary,
            ),
            DrawerListTile(
              title: "ITEM 1",
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
              title: "Logout",
              icon: Icon(
                Icons.power_settings_new_outlined,
                color: AppColors.white,
              ),
              onTap: () async {
                await authController.clearUser().then(
                      (value) =>
                          Navigator.pushReplacementNamed(context, "/splash"),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
