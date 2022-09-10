import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/modules/features/menu/controllers/menu_controller.dart';
import 'package:train_venturo/shared/widgets/shimmer_effect.dart';

import 'card_menu.dart';

class MenuSnack extends StatelessWidget {
  const MenuSnack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuController = Get.find<MenuController>();
    return SizedBox(
      child: menuController.obx(
        (_) => ListView.builder(
          itemBuilder: (ctx, i) {
            return CardMenu(
              image: FadeInImage(
                placeholder:
                    const AssetImage("${AssetsUrl.imgUrl}ic_loading.gif"),
                image: NetworkImage(
                  menuController.dataSnack[i].foto.toString(),
                ),
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.asset("${AssetsUrl.imgUrl}ic_no_image.png"),
              ),
              name: menuController.dataSnack[i].nama ?? "",
              cost: menuController.dataSnack[i].harga.toString(),
            );
          },
          itemCount: menuController.dataSnack.length,
        ),
        onLoading: ListView.builder(
          itemBuilder: (ctx, i) {
            return ShimmerEffect(
              child: CardMenu(
                image: Image.asset("${AssetsUrl.imgUrl}ic_no_image.png"),
                name: "",
                cost: "",
              ),
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
