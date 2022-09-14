import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/modules/features/menu/controllers/menu_controller.dart';
import 'package:train_venturo/shared/widgets/shimmer_effect.dart';

import 'card_menu.dart';

class MenuSnack extends GetView<MenuController> {
  const MenuSnack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: controller.obx(
        (_) => ListView.builder(
          itemBuilder: (ctx, i) {
            return CardMenu(
              image: FadeInImage(
                placeholder:
                    const AssetImage("${AssetsUrl.imgUrl}ic_loading.gif"),
                image: NetworkImage(
                  controller.dataSnack[i].foto.toString(),
                ),
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.asset("${AssetsUrl.imgUrl}ic_no_image.png"),
              ),
              name: controller.dataSnack[i].nama ?? "",
              cost: controller.dataSnack[i].harga.toString(),
              quantity: controller.dataSnack[i].jumlah.toString(),
              increament: () {
                controller.increatment(controller.dataSnack[i].idMenu ?? 0);
              },
              decreament: () {
                controller.decreatment(controller.dataSnack[i].idMenu ?? 0);
              },
            );
          },
          itemCount: controller.dataSnack.length,
        ),
        onLoading: ListView.builder(
          itemBuilder: (ctx, i) {
            return ShimmerEffect(
              child: CardMenu(
                image: Image.asset("${AssetsUrl.imgUrl}ic_no_image.png"),
                name: "",
                cost: "",
                quantity: '',
                increament: () {},
                decreament: () {},
              ),
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
