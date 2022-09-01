import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';
import 'package:train_venturo/shared/widgets/scroll_behaviour.dart';

import '../../../../../shared/customs/card_promo.dart';

class MenuMobileBody extends StatelessWidget {
  const MenuMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SizedBox(
          width: double.infinity,
          height: heightSized(context),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: SizedBox(
                  height: 240,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "${AssetsUrl.svgUrl}ic_voucher.svg",
                            width: 27,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: PrimaryTextStyle(
                              size: 20,
                              content: "Promo yang Tersedia",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 158,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, i) {
                                    return const Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: CardPromo(),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
