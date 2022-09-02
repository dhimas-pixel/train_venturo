import 'package:flutter/material.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';

import 'package:train_venturo/shared/customs/primary_text_style.dart';

class CardPromo extends StatelessWidget {
  const CardPromo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 282,
      height: 158,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('${AssetsUrl.imgUrl}bg_promo.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PrimaryTextStyle(
                size: 20,
                content: "Voucher",
                color: kWhiteColor,
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "Rp 800.000",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: AssetsUrl.fontMont,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1
                      ..color = kWhiteColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 150,
            child: PrimaryTextStyle(
              size: 14,
              content: "Mengisi review yang ditentukan",
              color: kWhiteColor,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
