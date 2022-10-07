import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/modules/features/menu/controllers/menu_controller.dart';
import 'package:train_venturo/shared/widgets/shimmer_effect.dart';
import 'package:train_venturo/modules/models/menu_model/menu_response_model.dart'
    as menu;
import 'package:train_venturo/modules/models/order_model/order_request_model.dart'
    as order;

import '../../../../../config/routes/name_routes.dart';
import 'card_menu.dart';
import 'com_helper.dart';

class MenuMakanan extends GetView<MenuController> {
  const MenuMakanan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: controller.obx(
        (_) => ListView.builder(
          itemBuilder: (ctx, i) {
            return GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.detailMenuView,
                  arguments: controller.dataFood[i].idMenu ?? 0),
              child: CardMenu(
                image: FadeInImage(
                  placeholder:
                      const AssetImage("${AssetsUrl.imgUrl}ic_loading.gif"),
                  image: NetworkImage(
                    controller.dataFood[i].foto.toString(),
                  ),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset("${AssetsUrl.imgUrl}ic_no_image.png"),
                ),
                name: controller.dataFood[i].nama ?? "",
                cost: controller.dataFood[i].harga.toString(),
                quantity: controller.dataFood[i].jumlah,
                increament: () {
                  controller.increatment(controller.dataFood[i].idMenu ?? 0);
                  if (controller
                          .getCount(controller.dataFood[i].idMenu ?? 0)
                          .value !=
                      0) {
                    final setData = order.Menu(
                      idMenu: controller.dataFood[i].idMenu ?? 0,
                      harga: controller.dataFood[i].harga ?? 0,
                      level: MenuController.to
                          .getIdLevel(controller.dataFood[i].idMenu ?? 0)
                          .value,
                      topping: MenuController.to
                          .getIdToping(controller.dataFood[i].idMenu ?? 0)
                          .value,
                      jumlah: controller
                          .getCount(controller.dataFood[i].idMenu ?? 0)
                          .value,
                    );
                    final setDummy = menu.Data(
                      idMenu: controller.dataFood[i].idMenu ?? 0,
                      foto: controller.dataFood[i].foto ?? "",
                      nama: controller.dataFood[i].nama ?? "",
                    );
                    controller.addCardManager(setData, setDummy);
                  }
                },
                decreament: () {
                  if (controller
                          .getCount(controller.dataFood[i].idMenu ?? 0)
                          .value ==
                      1) {
                    primaryAlert(
                      context,
                      () {
                        controller
                            .decreatment(controller.dataFood[i].idMenu ?? 0);
                        final setData = order.Menu(
                          idMenu: controller.dataFood[i].idMenu ?? 0,
                          harga: controller.dataFood[i].harga ?? 0,
                          level: MenuController.to
                              .getIdLevel(controller.dataFood[i].idMenu ?? 0)
                              .value,
                          topping: MenuController.to
                              .getIdToping(controller.dataFood[i].idMenu ?? 0)
                              .value,
                          jumlah: controller
                              .getCount(controller.dataFood[i].idMenu ?? 0)
                              .value,
                        );
                        controller.removeCardManager(setData);
                        Get.back();
                      },
                    );
                  } else {
                    controller.decreatment(controller.dataFood[i].idMenu ?? 0);
                    final setData = order.Menu(
                      idMenu: controller.dataFood[i].idMenu ?? 0,
                      harga: controller.dataFood[i].harga ?? 0,
                      level: MenuController.to
                          .getIdLevel(controller.dataFood[i].idMenu ?? 0)
                          .value,
                      topping: MenuController.to
                          .getIdToping(controller.dataFood[i].idMenu ?? 0)
                          .value,
                      jumlah: controller
                          .getCount(controller.dataFood[i].idMenu ?? 0)
                          .value,
                    );
                    controller.removeCardManager(setData);
                  }
                },
              ),
            );
          },
          itemCount: controller.dataFood.length,
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
