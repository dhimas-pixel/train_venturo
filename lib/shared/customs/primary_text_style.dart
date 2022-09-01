import 'package:flutter/material.dart';
import 'package:train_venturo/config/themes/color.dart';

import '../../constant/core/assets_const/assets_const.dart';

class PrimaryTextStyle extends StatelessWidget {
  final double size;
  final String content;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  const PrimaryTextStyle({
    Key? key,
    required this.size,
    required this.content,
    this.fontWeight = FontWeight.normal,
    this.color = kBlackPrimaryColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: AssetsUrl.fontMont,
        fontWeight: fontWeight,
      ),
    );
  }
}
