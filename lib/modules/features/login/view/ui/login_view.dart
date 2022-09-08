import 'package:flutter/material.dart';
import 'package:train_venturo/modules/features/connection/connection_view.dart';
import 'package:train_venturo/modules/features/login/view/ui/login_mobile_body.dart';
import 'package:train_venturo/modules/features/login/view/ui/login_tablet_body.dart';
import 'package:train_venturo/shared/customs/responsive_layout.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ConnectionView(
        child: ResponsiveLayout(
          mobileBody: LoginMobileBody(),
          tabletBody: LoginTabletBody(),
        ),
      ),
    );
  }
}
