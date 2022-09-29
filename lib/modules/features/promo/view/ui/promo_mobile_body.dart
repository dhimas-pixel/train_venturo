import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/shared/customs/appbar_primary.dart';
import 'package:train_venturo/shared/customs/card_promo.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';

class PromoMobileBody extends StatelessWidget {
  final String type, name, nominal, term;
  const PromoMobileBody({
    Key? key,
    required this.type,
    required this.name,
    required this.nominal,
    required this.term,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        name: 'Promo',
        back: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Container(
          height: heightSized(context),
          width: double.infinity,
          color: Colors.transparent,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: SizedBox(
                    width: double.infinity,
                    child: CardPromo(
                      width: double.infinity,
                      height: 185,
                      type: type,
                      name: name,
                      nominal: nominal,
                    ),
                  ),
                ),
                Container(
                  height: heightSized(context),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 46, horizontal: 22),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const PrimaryTextStyle(
                            size: 16,
                            content: "Nama Promo",
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: PrimaryTextStyle(
                              size: 20,
                              content: name,
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Divider(color: kGreyColor),
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Icon(
                                  Icons.assignment_outlined,
                                  color: kSecondaryColor,
                                  size: 30,
                                ),
                              ),
                              PrimaryTextStyle(
                                size: 16,
                                content: "Syarat dan Ketentuan",
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 36),
                            child: Html(data: term),
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
