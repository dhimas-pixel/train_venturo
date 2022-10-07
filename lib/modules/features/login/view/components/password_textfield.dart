import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/themes/color.dart';
import '../../controllers/login_controller.dart';

class PassTextField extends StatelessWidget {
  final TextEditingController controller;
  const PassTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();
    return Obx(
      () => TextField(
        controller: controller,
        cursorColor: kPrimaryColor,
        obscureText: loginController.isObscure.value,
        decoration: InputDecoration(
          labelText: "Kata Sandi",
          labelStyle: const TextStyle(
            color: kBlackPrimaryColor,
            fontFamily: "Montserrat",
            fontSize: 18,
          ),
          hintText: "****************",
          hintStyle: const TextStyle(
            color: kGreyColor,
            fontFamily: "Montserrat",
            fontSize: 14,
          ),
          fillColor: Colors.transparent,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kSecondaryColor),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: IconButton(
            icon: Icon(loginController.isObscure.isTrue
                ? Icons.visibility_off
                : Icons.visibility),
            color: kGreyColor,
            onPressed: () {
              loginController.isObscure.toggle();
            },
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
