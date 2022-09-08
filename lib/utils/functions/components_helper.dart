import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../config/themes/color.dart';
import '../../shared/customs/primary_text_style.dart';

snackBarCustom(String content, IconData icon, Color backgroundColor) {
  return showSimpleNotification(
    PrimaryTextStyle(
      size: 14,
      content: content,
      color: kWhiteColor,
    ),
    leading: Icon(
      icon,
      color: kWhiteColor,
    ),
    background: backgroundColor,
  );
}

validateEmail(String email) {
  final emailReg = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailReg.hasMatch(email);
}

loadData(BuildContext context) async {
  // show the loading dialog
  showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          // The background color
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // The loading indicator
                LoadingAnimationWidget.hexagonDots(
                  color: kPrimaryColor,
                  size: 50,
                ),
                const SizedBox(
                  height: 15,
                ),
                // Some text
                const Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                )
              ],
            ),
          ),
        );
      });

  // Your asynchronous computation here (fetching data from an API, processing files, inserting something to the database, etc)
  await Future.delayed(const Duration(seconds: 3));
}
