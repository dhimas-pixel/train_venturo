import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/config/routes/name_routes.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/modules/features/detail_menu/view/ui/detail_menu_view.dart';
import 'package:train_venturo/modules/features/menu/controllers/menu_controller.dart';
import 'package:train_venturo/shared/widgets/shimmer_effect.dart';

import 'card_menu.dart';

class AllMenu extends GetView<MenuController> {
  const AllMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: controller.obx(
        (_) => ListView.builder(
          itemBuilder: (ctx, i) {
            return GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.detailMenuView,
                  arguments: controller.dataAllMenu[i].idMenu ?? 0),
              child: CardMenu(
                image: FadeInImage(
                  placeholder:
                      const AssetImage("${AssetsUrl.imgUrl}ic_loading.gif"),
                  image: NetworkImage(
                    controller.dataAllMenu[i].foto.toString(),
                  ),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset("${AssetsUrl.imgUrl}ic_no_image.png"),
                ),
                name: controller.dataAllMenu[i].nama ?? "",
                cost: controller.dataAllMenu[i].harga.toString(),
                quantity: controller.dataAllMenu[i].jumlah,
                increament: () {
                  controller.increatment(controller.dataAllMenu[i].idMenu ?? 0);
                },
                decreament: () {
                  controller.decreatment(controller.dataAllMenu[i].idMenu ?? 0);
                },
              ),
            );
          },
          itemCount: controller.dataAllMenu.length,
        ),
        onLoading: ListView.builder(
          itemBuilder: (ctx, i) {
            return ShimmerEffect(
              child: CardMenu(
                image: Image.asset("${AssetsUrl.imgUrl}ic_no_image.png"),
                name: "",
                cost: "",
                quantity: 0,
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
