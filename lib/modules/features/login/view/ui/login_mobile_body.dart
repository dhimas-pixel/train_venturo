import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/modules/features/connection/connection_view.dart';
import 'package:train_venturo/modules/features/login/controllers/login_controller.dart';
import 'package:train_venturo/modules/features/login/view/components/login_button_signup.dart';
import 'package:train_venturo/modules/models/login_model/login_api_request_model.dart';
import 'package:train_venturo/shared/customs/primary_button.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';
import 'package:train_venturo/utils/functions/components_helper.dart';

import '../components/email_textfield.dart';
import '../components/password_textfield.dart';

class LoginMobileBody extends StatefulWidget {
  const LoginMobileBody({Key? key}) : super(key: key);

  @override
  State<LoginMobileBody> createState() => _LoginMobileBodyState();
}

class _LoginMobileBodyState extends State<LoginMobileBody> {
  final loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _conEmail = TextEditingController();
  final TextEditingController _conPassword = TextEditingController();

  @override
  void dispose() {
    _conEmail.dispose();
    _conPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConnectionView(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              width: double.infinity,
              height: heightSized(context),
              child: Padding(
                padding: const EdgeInsets.all(42.0),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Image.asset(
                              '${AssetsUrl.imgUrl}default_logo.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: SizedBox(
                            height: heightSized(context) / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const PrimaryTextStyle(
                                  size: 20,
                                  content: 'Masuk untuk melanjutkan!',
                                  fontWeight: FontWeight.w500,
                                ),
                                EmailTextField(
                                  controller: _conEmail,
                                ),
                                PassTextField(
                                  controller: _conPassword,
                                ),
                                PrimaryButton(
                                  text: "Masuk",
                                  press: () async {
                                    final getEmail = _conEmail.text;
                                    final getPass = _conPassword.text;
                                    if (getEmail.isEmpty && getPass.isEmpty) {
                                      snackBarCustom(
                                        "Tolong isi form dengan lengkap!",
                                        Icons.error_sharp,
                                        kRedColor,
                                      );
                                    } else if (!GetUtils.isEmail(getEmail)) {
                                      snackBarCustom(
                                        "Alamat email tidak valid!",
                                        Icons.error_sharp,
                                        kRedColor,
                                      );
                                    } else {
                                      loadData(context);
                                      final getRespon =
                                          await loginController.loginApi(
                                        LoginApiReqModel(
                                          email: getEmail,
                                          password: getPass,
                                        ),
                                      );

                                      if (getRespon!.statusCode == 422) {
                                        snackBarCustom(
                                          "Password yang anda masukkan salah!",
                                          Icons.error_sharp,
                                          kRedColor,
                                        );
                                      } else if (getRespon.statusCode == 204) {
                                        snackBarCustom(
                                          "User tidak ditemukan.",
                                          Icons.error_sharp,
                                          kRedColor,
                                        );
                                      } else {
                                        snackBarCustom(
                                          "Berhasil Login",
                                          Icons.done_outline_rounded,
                                          kSecondaryColor,
                                        );
                                      }
                                      Navigator.of(context).pop();
                                    }
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
                              press: () async {
                                loadData(context);
                                final getRespon =
                                    await loginController.loginGoogle();

                                if (getRespon!.statusCode == 422) {
                                  snackBarCustom(
                                    "Password yang anda masukkan salah!",
                                    Icons.error_sharp,
                                    kRedColor,
                                  );
                                } else if (getRespon.statusCode == 204) {
                                  snackBarCustom(
                                    "User tidak ditemukan.",
                                    Icons.error_sharp,
                                    kRedColor,
                                  );
                                } else {
                                  snackBarCustom(
                                    "Berhasil Login",
                                    Icons.done_outline_rounded,
                                    kSecondaryColor,
                                  );
                                }
                                Navigator.of(context).pop();
                              },
                              color: kWhiteColor,
                              width: double.infinity,
                              fontSize: 14,
                              textColor: kBlackPrimaryColor,
                              assets: "${AssetsUrl.svgUrl}ic_google.svg",
                            ),
                            SignUpButton(
                              text1: "Masuk menggunakan ",
                              text2: "Apple",
                              press: () {
                                Get.defaultDialog(
                                  title: "Perhatian",
                                  middleText: "Fitur belum tersedia",
                                  onCancel: () {
                                    Navigator.of(context).pop();
                                  },
                                  cancelTextColor: kRedColor,
                                  buttonColor: kRedColor,
                                  textCancel: "Kembali",
                                );
                              },
                              color: kBlackPrimaryColor,
                              width: double.infinity,
                              fontSize: 14,
                              textColor: kWhiteColor,
                              assets: "${AssetsUrl.svgUrl}ic_apple.svg",
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
        ),
      ),
    );
  }
}
