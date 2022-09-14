import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/modules/features/menu/controllers/menu_controller.dart';
import 'package:train_venturo/modules/features/menu/view/components/menu_makanan.dart';
import 'package:train_venturo/modules/features/menu/view/components/menu_minuman.dart';
import 'package:train_venturo/modules/features/menu/view/components/menu_snack.dart';
import 'package:train_venturo/modules/features/promo/view/ui/promo_view.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';
import 'package:train_venturo/shared/widgets/scroll_behaviour.dart';
import 'package:train_venturo/shared/widgets/shimmer_effect.dart';

import '../../../../../shared/customs/card_promo.dart';
import '../components/app_bar_home.dart';
import '../components/all_menu.dart';
import '../components/card_menu.dart';

class MenuMobileBody extends GetView<MenuController> {
  const MenuMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarHome(
        onChanged: (value) {
          controller.filterMenu(value);
        },
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Padding(
          padding: const EdgeInsets.only(top: 22.0),
          child: Obx(
            () => controller.isFound.value == true
                ? SingleChildScrollView(
                    child: SizedBox(
                        width: double.infinity,
                        height: heightSized(context),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: SizedBox(
                                height: 240,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "${AssetsUrl.svgUrl}ic_voucher.svg",
                                          width: 27,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: PrimaryTextStyle(
                                            size: 20,
                                            content: "Promo yang Tersedia",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 25),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: 158,
                                              child: controller.obx(
                                                (_) => ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder: (ctx, i) {
                                                    return GestureDetector(
                                                      onTap: () => Get.to(
                                                        () => PromoView(
                                                          type: controller
                                                                  .dataPromo[i]
                                                                  .type
                                                                  ?.toUpperCase() ??
                                                              "",
                                                          name: controller
                                                                  .dataPromo[i]
                                                                  .nama ??
                                                              "",
                                                          nominal: controller
                                                                      .dataPromo[
                                                                          i]
                                                                      .type ==
                                                                  'diskon'
                                                              ? "${controller.dataPromo[i].nominal.toString()} %"
                                                              : "Rp. ${controller.dataPromo[i].nominal.toString()}",
                                                          term: controller
                                                                  .dataPromo[i]
                                                                  .syaratKetentuan ??
                                                              "",
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 20),
                                                        child: CardPromo(
                                                          width: 282,
                                                          height: 158,
                                                          type: controller
                                                                  .dataPromo[i]
                                                                  .type
                                                                  ?.toUpperCase() ??
                                                              "",
                                                          name: controller
                                                                  .dataPromo[i]
                                                                  .nama ??
                                                              "",
                                                          nominal: controller
                                                                      .dataPromo[
                                                                          i]
                                                                      .type ==
                                                                  'diskon'
                                                              ? "${controller.dataPromo[i].nominal.toString()} %"
                                                              : "Rp. ${controller.dataPromo[i].nominal.toString()}",
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  itemCount: controller
                                                      .dataPromo.length,
                                                ),
                                                onLoading: ShimmerEffect(
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder: (ctx, i) {
                                                      return const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 20),
                                                        child: CardPromo(
                                                          width: 282,
                                                          height: 158,
                                                          type: " ",
                                                          name: " ",
                                                          nominal: " ",
                                                        ),
                                                      );
                                                    },
                                                    itemCount: 3,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: DefaultTabController(
                                length: 4,
                                child: Column(
                                  children: [
                                    ButtonsTabBar(
                                      backgroundColor: kBlackSecondaryColor,
                                      unselectedBackgroundColor:
                                          kSecondaryColor,
                                      unselectedLabelStyle: const TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 20,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                      ),
                                      radius: 30,
                                      height: 40,
                                      buttonMargin: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16),
                                      labelSpacing: 10,
                                      tabs: const [
                                        Tab(
                                          icon: Icon(
                                            Icons.format_list_bulleted_rounded,
                                          ),
                                          text: "Semua Menu",
                                        ),
                                        Tab(
                                          icon: Icon(Icons.rice_bowl_rounded),
                                          text: "Makanan",
                                        ),
                                        Tab(
                                          icon: Icon(Icons.local_cafe_rounded),
                                          text: "Minuman",
                                        ),
                                        Tab(
                                          icon: Icon(Icons.restaurant_rounded),
                                          text: "Snack",
                                        ),
                                      ],
                                    ),
                                    const Expanded(
                                      child: TabBarView(
                                        children: <Widget>[
                                          AllMenu(),
                                          MenuMakanan(),
                                          MenuMinuman(),
                                          MenuSnack(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  )
                : Obx(
                    () => ListView.builder(
                      itemBuilder: (ctx, i) {
                        return CardMenu(
                          image: FadeInImage(
                            placeholder: const AssetImage(
                                "${AssetsUrl.imgUrl}ic_loading.gif"),
                            image: NetworkImage(
                              controller.foundMenu.value[i].foto.toString(),
                            ),
                            imageErrorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                                    "${AssetsUrl.imgUrl}ic_no_image.png"),
                          ),
                          name: controller.foundMenu.value[i].nama ?? "",
                          cost: controller.foundMenu.value[i].harga.toString(),
                          quantity:
                              controller.foundMenu.value[i].jumlah.toString(),
                          increament: () {
                            controller.increatment(
                                controller.foundMenu.value[i].idMenu ?? 0);
                          },
                          decreament: () {
                            controller.decreatment(
                                controller.foundMenu.value[i].idMenu ?? 0);
                          },
                        );
                      },
                      itemCount: controller.foundMenu.value.length,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
