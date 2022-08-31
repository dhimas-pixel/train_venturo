import 'package:flutter/material.dart';
import 'package:train_venturo/config/themes/color.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final double width, fontSize;
  final FontWeight fontWeight;
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.width,
    required this.fontSize,
    required this.textColor,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      child: OutlinedButton(
        onPressed: press,
        style: OutlinedButton.styleFrom(
          elevation: 4,
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          textStyle: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: 'Montserrat',
          ),
          side: const BorderSide(
            width: 1,
            color: kPrimaryColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(144),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
