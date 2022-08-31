import 'package:flutter/material.dart';
import 'package:train_venturo/config/themes/color.dart';

class PrimaryTextStyle extends StatelessWidget {
  final double size;
  final String content;
  final FontWeight fontWeight;
  final Color color;
  const PrimaryTextStyle({
    Key? key,
    required this.size,
    required this.content,
    this.fontWeight = FontWeight.normal,
    this.color = kBlackPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: 'Poppins',
        fontWeight: fontWeight,
      ),
    );
  }
}
