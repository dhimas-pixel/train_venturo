import 'package:flutter/material.dart';
import 'package:train_venturo/shared/customs/responsive_layout.dart';

import 'menu_mobile_body.dart';
import 'menu_tablet_body.dart';

class ManuView extends StatelessWidget {
  const ManuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MenuMobileBody(),
        tabletBody: MenuTabletBody(),
      ),
    );
  }
}
