import 'package:flutter/material.dart';
import 'package:train_venturo/modules/features/location/view/ui/location_mobile_body.dart';
import 'package:train_venturo/shared/customs/responsive_layout.dart';

import 'location_tablet_body.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: LocationMobileBody(),
        tabletBody: LocationTabletBody(),
      ),
    );
  }
}
