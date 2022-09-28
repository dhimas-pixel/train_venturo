import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/modules/features/history/controllers/history_controller.dart';

import '../../../../../config/themes/color.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      init: HistoryController(),
      initState: (_) {},
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
        );
      },
    );
  }
}
