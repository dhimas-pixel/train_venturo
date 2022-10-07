import 'package:flutter/material.dart';

Size displaySized(BuildContext context) {
  return MediaQuery.of(context).size;
}

double heightSized(BuildContext context) {
  // debugPrint('Height = ${displaySized(context).height}');
  return displaySized(context).height;
}

double widthSized(BuildContext context) {
  // debugPrint('Width = ${displaySized(context).height}');
  return displaySized(context).width;
}
