import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/modules/features/history/controllers/history_controller.dart';
import 'package:train_venturo/modules/features/history/view/components/card_riwayat.dart';
import 'package:train_venturo/modules/features/history/view/components/empty_data.dart';
import 'package:train_venturo/modules/features/tracking/view/ui/tracking_view.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';
import 'package:train_venturo/shared/widgets/shimmer_effect.dart';

import '../../../../../config/themes/color.dart';
import '../../../../../utils/functions/common_functions.dart';
import '../components/card_history.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CommonFunctions commonFunctions = CommonFunctions();
    return GetBuilder<HistoryController>(
      init: HistoryController(),
      builder: (value) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            automaticallyImplyLeading: false,
            title: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              child: SizedBox(
                width: widthSized(context),
                height: 45,
                child: TabBar(
                  controller: value.controller,
                  labelColor: kSecondaryColor,
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  indicatorColor: kSecondaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: kBlackPrimaryColor,
                  tabs: [
                    Text("underway".tr),
                    Text("history".tr),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            controller: value.controller,
            children: [
              value.isLoading.isTrue
                  ? ShimmerEffect(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)));
                        },
                      ),
                    )
                  : value.orderListProcess.isNotEmpty
                      ? ListView.builder(
                          itemCount: value.orderListProcess.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                  () => TrackingView(
                                      id: value
                                          .orderListProcess[index].idOrder!),
                                );
                                log(value.orderListProcess[index].idOrder
                                    .toString());
                              },
                              child: CardHistory(
                                order: value.orderListProcess[index],
                              ),
                            );
                          },
                        )
                      : EmptyData(text: "empty_history".tr),
              value.isLoading.isTrue
                  ? ShimmerEffect(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            width: widthSized(context),
                            height: 120,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          );
                        },
                      ),
                    )
                  : Stack(
                      children: [
                        SizedBox(
                          height: heightSized(context) / 1.22,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 16),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: kSecondaryColor,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          color: const Color.fromRGBO(
                                              246, 246, 246, 1),
                                        ),
                                        child: Row(
                                          children: [
                                            DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                isDense: true,
                                                icon: const Icon(
                                                    Icons.arrow_drop_down),
                                                value:
                                                    value.selectedDropdownItem,
                                                items: value.dropdownItems
                                                    .map((item) {
                                                  return DropdownMenuItem(
                                                    child: PrimaryTextStyle(
                                                      size: 16,
                                                      content: item,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    value: item,
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  // value.selectedDropdownItem =
                                                  //     newValue!;
                                                  value.filterData(newValue!);
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          value.showMyDatePicker();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 16),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: kSecondaryColor,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                            color: const Color.fromRGBO(
                                                246, 246, 246, 1),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              PrimaryTextStyle(
                                                size: 12,
                                                content:
                                                    '${value.startDateString} - ${value.endDateString}',
                                                fontWeight: FontWeight.w500,
                                                color: kGreyColor,
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 8),
                                                child: const Icon(
                                                  Icons.calendar_month,
                                                  color: kSecondaryColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                value.listHistoryOrderFilterred.isNotEmpty
                                    ? ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: value
                                            .listHistoryOrderFilterred.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Get.to(
                                                () => TrackingView(
                                                    id: value
                                                            .listHistoryOrderFilterred[
                                                                index]
                                                            .idOrder ??
                                                        0),
                                              );
                                            },
                                            child: CardRiwayat(
                                              pesanLagi: () {
                                                value.pesanLagiFunction(
                                                  value.listHistoryOrderFilterred[
                                                      index],
                                                );
                                              },
                                              order: value
                                                      .listHistoryOrderFilterred[
                                                  index],
                                            ),
                                          );
                                        },
                                      )
                                    : EmptyData(
                                        text: "empty_history_order".tr,
                                      )
                              ],
                            ),
                          ),
                        ),
                        value.listHistoryOrderFilterred.isNotEmpty
                            ? Positioned(
                                bottom: 0,
                                child: Container(
                                  height: 50,
                                  width: widthSized(context),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                    color: kSecondGreyColor,
                                  ),
                                  child: Container(
                                    height: 21,
                                    width: widthSized(context),
                                    margin: const EdgeInsets.only(
                                        left: 22, right: 25, top: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PrimaryTextStyle(
                                          size: 18,
                                          content: "total_order".tr,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        PrimaryTextStyle(
                                          size: 18,
                                          content: commonFunctions.convertToIdr(
                                              value.orderHistory?.data
                                                      ?.totalPrice ??
                                                  0,
                                              0),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}
