import 'package:flutter/material.dart';

import '../../../../../config/themes/color.dart';
import '../../../../../constant/core/assets_const/assets_const.dart';

class ChooseItem extends StatelessWidget {
  final VoidCallback onTap;
  final String item;
  final bool selected;
  const ChooseItem({
    Key? key,
    required this.onTap,
    required this.item,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, right: 10),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          elevation: 4,
          backgroundColor: selected ? kSecondaryColor : kWhiteColor,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          textStyle: const TextStyle(
            color: kWhiteColor,
            fontSize: 14,
            fontFamily: AssetsUrl.fontMont,
          ),
          side: const BorderSide(
            width: 1,
            color: kSecondaryColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item,
              style: TextStyle(color: selected ? kWhiteColor : kSecondaryColor),
            ),
            selected
                ? const Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Icon(
                      Icons.check_rounded,
                      color: kWhiteColor,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
