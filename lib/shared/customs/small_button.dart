import 'package:flutter/material.dart';
import 'package:train_venturo/config/themes/color.dart';

class SmallButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const SmallButton({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 28,
        color: kSecondaryColor,
      ),
    );
  }
}
