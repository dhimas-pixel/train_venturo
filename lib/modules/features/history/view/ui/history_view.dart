import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/modules/features/history/controllers/history_controller.dart';
import 'package:train_venturo/modules/features/history/view/components/empty_data.dart';
import 'package:train_venturo/modules/features/tracking/view/ui/tracking_view.dart';
import 'package:train_venturo/shared/widgets/shimmer_effect.dart';

import '../../../../../config/themes/color.dart';
import '../components/card_history.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  tabs: const [
                    Text("Diproses"),
                    Text("Riwayat"),
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
                                      id: value.orderListProcess[index]
                                              .idOrder ??
                                          0),
                                );
                              },
                              child: CardHistory(
                                order: value.orderListProcess[index],
                              ),
                            );
                          },
                        )
                      : const EmptyData(
                          text: "Sudah Pesan?\nLacak pesananmu di sini."),
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
                                  TrackingView(
                                      id: value.orderListProcess[index]
                                              .idOrder ??
                                          0),
                                );
                              },
                              child: CardHistory(
                                order: value.orderListProcess[index],
                              ),
                            );
                          },
                        )
                      : const EmptyData(
                          text: "Sudah Pesan?\nLacak pesananmu di sini."),
            ],
          ),
        );
      },
    );
  }
}
