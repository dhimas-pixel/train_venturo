import 'package:flutter/material.dart';

import '../../../../../config/themes/color.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
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
