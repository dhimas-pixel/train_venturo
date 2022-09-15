import 'package:flutter/material.dart';
import 'package:train_venturo/shared/customs/responsive_layout.dart';

import 'detail_menu_mobile_body.dart';
import 'detail_menu_tablet_body.dart';

class DetailMenuView extends StatelessWidget {
  const DetailMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: DetailMenuMobileBody(),
      tabletBody: DetailMenuTabletBody(),
    );
  }
}
