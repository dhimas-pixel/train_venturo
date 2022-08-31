import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:train_venturo/config/routes/name_routes.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/modules/features/location/view/components/background.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';

import '../../../../../shared/widgets/fade_animation.dart';
import '../../../../../shared/widgets/scale_animation.dart';

class LocationMobileBody extends StatelessWidget {
  const LocationMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Background(
          child: Container(
            height: heightSized(context) / 1.6,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const FadeAnimation(
                  child: PrimaryTextStyle(
                    size: 22,
                    content: "Mencari Lokasimu ...",
                    color: kGreyColor,
                  ),
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    FadeAnimation(
                      child: Image.asset("assets/images/img_map.png"),
                    ),
                    ScaleAnimations(
                      child: SvgPicture.asset("assets/svg/ic_map.svg"),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.offAllNamed(AppRoutes.homeView),
                  child: SizedBox(
                    width: widthSized(context) / 1.8,
                    child: const PrimaryTextStyle(
                      size: 22,
                      content:
                          "Perumahan Griyashanta Permata N-524, Mojolangu, Kec. Lowokwaru, Kota Malang",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
