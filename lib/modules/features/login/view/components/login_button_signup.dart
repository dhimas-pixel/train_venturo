import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpButton extends StatelessWidget {
  final String text1, text2, assets;
  final VoidCallback press;
  final Color color, textColor;
  final double width, fontSize;
  final FontWeight fontWeight;
  const SignUpButton({
    Key? key,
    required this.text1,
    required this.text2,
    required this.color,
    required this.width,
    required this.fontSize,
    required this.textColor,
    required this.assets,
    required this.press,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          elevation: 4,
          primary: color,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          textStyle: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: 'Montserrat',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(144),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: SvgPicture.asset(assets),
            ),
            Text(
              text1,
              style: TextStyle(color: textColor),
            ),
            Text(
              text2,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
