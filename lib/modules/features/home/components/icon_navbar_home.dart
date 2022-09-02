import 'package:flutter/material.dart';

class IconHomeBar extends StatelessWidget {
  final IconData icon;
  const IconHomeBar({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 30,
    );
  }
}
