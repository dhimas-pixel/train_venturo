import 'package:flutter/material.dart';

import '../../../../../config/themes/color.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: kPrimaryColor,
      decoration: const InputDecoration(
        labelText: "Alamat Email",
        labelStyle: TextStyle(
          color: kBlackPrimaryColor,
          fontFamily: "Montserrat",
          fontSize: 18,
        ),
        hintText: "Lorem.ipsum@gmail.com",
        hintStyle: TextStyle(
          color: kGreyColor,
          fontFamily: "Montserrat",
          fontSize: 14,
        ),
        fillColor: Colors.transparent,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kSecondaryColor),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
