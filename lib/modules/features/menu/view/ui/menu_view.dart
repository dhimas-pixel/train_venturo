import 'package:flutter/material.dart';
import 'package:train_venturo/shared/customs/responsive_layout.dart';

import 'menu_mobile_body.dart';
import 'menu_tablet_body.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MenuMobileBody(),
      tabletBody: MenuTabletBody(),
    );
  }
}
