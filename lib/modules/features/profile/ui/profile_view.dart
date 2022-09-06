import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/themes/color.dart';
import '../../../../main.dart';
import '../../../../shared/customs/primary_button.dart';
import '../../login/controllers/login_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();
    return Center(
      child: Column(
        children: [
          Text(loginController.googleAccount.value?.displayName ?? ""),
          Text(loginController.googleAccount.value?.email ?? ""),
          PrimaryButton(
            text: 'Logout',
            press: () {
              Get.find<LoginController>().logOut();
              RestartWidget.restartApp(context);
            },
            color: kRedColor,
            width: double.infinity,
            fontSize: 16,
            textColor: kWhiteColor,
          ),
        ],
      ),
    );
  }
}
