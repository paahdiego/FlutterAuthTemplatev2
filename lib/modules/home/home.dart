import 'package:auth_template_v2/modules/home/widgets/side_menu/side_menu.dart';
import 'package:auth_template_v2/shared/controllers/menu.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Provider.of<MenuController>(context).scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Container();
        }),
      ),
    );
  }
}
