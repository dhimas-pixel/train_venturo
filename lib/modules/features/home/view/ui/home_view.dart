import 'package:flutter/material.dart';
import 'package:train_venturo/modules/features/home/view/ui/home_mobile_body.dart';
import 'package:train_venturo/modules/features/home/view/ui/home_tablet_body.dart';
import 'package:train_venturo/shared/customs/responsive_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: HomeMobileBody(),
        tabletBody: HomeTabletBody(),
      ),
    );
  }
}
