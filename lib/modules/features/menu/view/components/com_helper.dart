import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/themes/color.dart';
import '../../../../../shared/customs/primary_button.dart';
import '../../../../../shared/customs/primary_text_style.dart';

Future<dynamic> primaryAlert(BuildContext context, VoidCallback positiveResp) {
  return showDialog(
    context: context,
    builder: (builder) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.delete_forever_rounded,
              color: kSecondaryColor,
              size: 120,
            ),
            PrimaryTextStyle(
              size: 22,
              content: "Hapus Item",
              fontWeight: FontWeight.bold,
            ),
            PrimaryTextStyle(
              textAlign: TextAlign.center,
              size: 16,
              content: "Apakah anda yakin akan menghapus item tersebut?",
              color: kGreyColor,
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          PrimaryButton(
            text: "Yakin",
            press: positiveResp,
            color: kWhiteColor,
            width: 100,
            fontSize: 15,
            textColor: kSecondaryColor,
          ),
          PrimaryButton(
            text: "Batal",
            press: () {
              Get.back();
            },
            color: kSecondaryColor,
            width: 100,
            fontSize: 15,
            textColor: kWhiteColor,
          ),
        ],
      );
    },
  );
}
