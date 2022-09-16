import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/modules/features/menu/controllers/menu_controller.dart';
import 'package:train_venturo/modules/features/menu/view/components/card_menu.dart';

import '../../../../../shared/customs/appbar_primary.dart';

class OrderMobileBody extends GetView<MenuController> {
  const OrderMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPrimary(name: "Pesanan"),
      body: SafeArea(
        child: SizedBox(
          height: heightSized(context),
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: (ctx, i) {
              return CardMenu(
                image: Image.network(controller.dummyData[i].foto ?? ""),
                name: controller.dummyData[i].nama ?? "",
                cost: controller.orderNewData[i].harga.toString(),
                quantity: controller.orderNewData[i].jumlah ?? 0,
                increament: () {},
                decreament: () {},
              );
            },
            itemCount: controller.orderNewData.length,
          ),
        ),
      ),
    );
  }
}
