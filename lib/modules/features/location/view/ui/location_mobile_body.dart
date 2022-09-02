import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:train_venturo/config/routes/name_routes.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/modules/features/location/controllers/location_controller.dart';
import 'package:train_venturo/shared/customs/background.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';
import 'package:train_venturo/shared/widgets/bounce_animation.dart';

import '../../../../../shared/widgets/fade_animation.dart';
import '../../../../../shared/widgets/scale_animation.dart';

class LocationMobileBody extends StatefulWidget {
  const LocationMobileBody({Key? key}) : super(key: key);

  @override
  State<LocationMobileBody> createState() => _LocationMobileBodyState();
}

class _LocationMobileBodyState extends State<LocationMobileBody> {
  final getState = Get.put(LocationController());
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      getState.getlocation();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Background(
          child: SizedBox(
            height: heightSized(context) / 1.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const FadeAnimation(
                //   child: PrimaryTextStyle(
                //     size: 22,
                //     content: "Mencari Lokasimu ...",
                //     color: kGreyColor,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      FadeAnimation(
                        child: Image.asset("${AssetsUrl.imgUrl}img_map.png"),
                      ),
                      ScaleAnimations(
                        child: BounceAnimation(
                          child:
                              SvgPicture.asset("${AssetsUrl.svgUrl}ic_map.svg"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: widthSized(context) / 1.4,
                  child: getState.obx(
                    (_) {
                      return PrimaryTextStyle(
                        size: 22,
                        content:
                            "${getState.placemarks[0].street}, ${getState.placemarks[0].subLocality}, ${getState.placemarks[0].locality}, ${getState.placemarks[0].subAdministrativeArea}, ${getState.placemarks[0].postalCode}",
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                      );
                    },
                    onLoading: FadeAnimation(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: PrimaryTextStyle(
                              size: 22,
                              content: "Mencari Lokasimu",
                              color: kGreyColor,
                            ),
                          ),
                          LoadingAnimationWidget.waveDots(
                            color: kPrimaryColor,
                            size: 30,
                          ),
                        ],
                      ),
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
