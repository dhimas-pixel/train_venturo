import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:train_venturo/modules/features/order/controller/order_controller.dart';
import 'package:train_venturo/modules/features/voucher/controllers/voucher_controller.dart';
import 'package:train_venturo/shared/customs/primary_button.dart';

import '../../../../../config/themes/color.dart';
import '../../../../../constant/common/media_query.dart';
import '../../../../../shared/customs/appbar_primary.dart';
import '../../../../../shared/customs/primary_text_style.dart';

class DetailVoucherView extends GetView<VoucherController> {
  final String imgUrl, name, desc, firstDate, lastDate;
  const DetailVoucherView({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.desc,
    required this.firstDate,
    required this.lastDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime convertfirstDate = DateTime.parse(firstDate);
    DateTime convertlastDate = DateTime.parse(lastDate);

    String formattedfirstDate =
        DateFormat('dd/MM/yyyy').format(convertfirstDate).toString();
    String formattedlastDate =
        DateFormat('dd/MM/yyyy').format(convertlastDate).toString();

    return Scaffold(
      appBar: AppBarPrimary(
        name: "Detail Voucher",
        back: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
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
                        child: Image.network(imgUrl),
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
                            offset: const Offset(
                                0, 3), // changes position of shadow
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
                              PrimaryTextStyle(
                                size: 20,
                                content: name,
                                fontWeight: FontWeight.w600,
                                color: kSecondaryColor,
                              ),
                              Html(data: desc),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Divider(color: kGreyColor),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.calendar_month_outlined,
                                          color: kSecondaryColor,
                                          size: 30,
                                        ),
                                      ),
                                      PrimaryTextStyle(
                                        size: 18,
                                        content: "Valid Date",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  PrimaryTextStyle(
                                    size: 16,
                                    content:
                                        "$formattedfirstDate - $formattedlastDate",
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Divider(color: kGreyColor),
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
            Positioned(
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: widthSized(context),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kGreyColor,
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: PrimaryButton(
                      text: "use_voucher".tr,
                      press: () {
                        OrderController.to.selectedVoucher =
                            controller.dataVoucher[Get.arguments];
                        OrderController.to.update();
                        Get.close(2);
                      },
                      color: kSecondaryColor,
                      width: widthSized(context),
                      fontSize: 16,
                      textColor: kWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
