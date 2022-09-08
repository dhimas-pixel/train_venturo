import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';

import '../../../../../config/themes/color.dart';

class AppBarPrimary extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  const AppBarPrimary({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(66);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: kBlackSecondaryColor,
        ),
      ),
      title: PrimaryTextStyle(
        size: 20,
        content: name,
        fontWeight: FontWeight.w600,
      ),
      centerTitle: true,
      backgroundColor: kWhiteColor,
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }
}
