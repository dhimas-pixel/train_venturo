import 'package:flutter/material.dart';

import '../../../../../config/themes/color.dart';

class PassTextField extends StatefulWidget {
  final TextEditingController controller;
  const PassTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: kPrimaryColor,
      obscureText: _isObscure,
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
          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
          color: kGreyColor,
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
