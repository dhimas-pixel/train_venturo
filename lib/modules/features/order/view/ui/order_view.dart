import 'package:flutter/material.dart';
import 'package:train_venturo/shared/customs/responsive_layout.dart';

import 'order_mobile_body.dart';
import 'order_tablet_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: OrderMobileBody(),
      tabletBody: OrderTabletBody(),
    );
  }
}
