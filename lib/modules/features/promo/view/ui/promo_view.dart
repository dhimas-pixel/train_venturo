import 'package:flutter/material.dart';
import 'package:train_venturo/modules/features/promo/view/ui/promo_mobile_body.dart';
import 'package:train_venturo/modules/features/promo/view/ui/promo_tablet_body.dart';
import 'package:train_venturo/shared/customs/responsive_layout.dart';

class PromoView extends StatelessWidget {
  final String type, name, nominal;
  const PromoView({
    Key? key,
    required this.type,
    required this.name,
    required this.nominal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: PromoMobileBody(
          type: type,
          name: name,
          nominal: nominal,
        ),
        tabletBody: const PromoTabletBody(),
      ),
    );
  }
}
