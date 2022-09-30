import 'package:flutter/material.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/shared/customs/background.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';

class EmptyData extends StatelessWidget {
  final String text;
  const EmptyData({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      top: 200,
      child: SizedBox(
        width: widthSized(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 156,
              height: 156,
              child: Image.asset(
                "${AssetsUrl.imgUrl}ic_no_data.png",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryTextStyle(
              size: 22,
              content: text,
              textAlign: TextAlign.center,
              color: kGreyColor,
            )
          ],
        ),
      ),
    );
  }
}
