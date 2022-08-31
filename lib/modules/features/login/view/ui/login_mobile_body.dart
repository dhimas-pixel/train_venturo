import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/config/routes/name_routes.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/modules/features/login/view/components/login_button_signup.dart';
import 'package:train_venturo/shared/customs/primary_button.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';

import '../components/email_textfield.dart';
import '../components/password_textfield.dart';

class LoginMobileBody extends StatelessWidget {
  const LoginMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            width: double.infinity,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.all(42.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Image.asset('assets/images/default_logo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: SizedBox(
                        height: size.height / 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const PrimaryTextStyle(
                              size: 22,
                              content: 'Masuk untuk melanjutkan!',
                              fontWeight: FontWeight.w500,
                            ),
                            const EmailTextField(),
                            const PassTextField(),
                            PrimaryButton(
                              text: "Masuk",
                              press: () {
                                Get.toNamed(AppRoutes.locationView);
                              },
                              color: kSecondaryColor,
                              textColor: kWhiteColor,
                              width: double.infinity,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: const <Widget>[
                            Expanded(child: Divider(color: kGreyColor)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: PrimaryTextStyle(
                                size: 14,
                                content: "atau",
                                color: kGreyColor,
                              ),
                            ),
                            Expanded(child: Divider(color: kGreyColor)),
                          ],
                        ),
                        SignUpButton(
                          text1: "Masuk menggunakan ",
                          text2: "Google",
                          press: () {},
                          color: kWhiteColor,
                          width: double.infinity,
                          fontSize: 14,
                          textColor: kBlackPrimaryColor,
                          assets: "assets/svg/ic_google.svg",
                        ),
                        SignUpButton(
                          text1: "Masuk menggunakan ",
                          text2: "Apple",
                          press: () {},
                          color: kBlackPrimaryColor,
                          width: double.infinity,
                          fontSize: 14,
                          textColor: kWhiteColor,
                          assets: "assets/svg/ic_apple.svg",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
