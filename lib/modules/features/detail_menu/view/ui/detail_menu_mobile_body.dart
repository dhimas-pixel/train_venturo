import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:train_venturo/modules/features/detail_menu/controllers/detail_menu_controller.dart';
import 'package:train_venturo/modules/features/menu/controllers/menu_controller.dart';
import 'package:train_venturo/shared/customs/appbar_primary.dart';
import 'package:train_venturo/shared/customs/primary_button.dart';
import 'package:train_venturo/shared/widgets/shimmer_effect.dart';

import '../../../../../config/themes/color.dart';
import '../../../../../constant/common/media_query.dart';
import '../../../../../constant/core/assets_const/assets_const.dart';
import '../../../../../shared/customs/primary_text_style.dart';
import '../../../../../shared/customs/small_button.dart';
import '../../../../../shared/widgets/scroll_behaviour.dart';
import '../components/card_detail_menu.dart';
import '../components/choose_item.dart';

class DetailMenuMobileBody extends GetView<DetailMenuController> {
  const DetailMenuMobileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPrimary(name: "Detail Menu"),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              height: heightSized(context),
              width: double.infinity,
              color: Colors.transparent,
              child: controller.obx(
                (_) => SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: SizedBox(
                          width: double.infinity,
                          child: SizedBox(
                            height: 181,
                            child: FadeInImage(
                              placeholder: const AssetImage(
                                  "${AssetsUrl.imgUrl}ic_loading.gif"),
                              image: NetworkImage(
                                  controller.dataDetailMenu.menu!.foto ?? ""),
                              imageErrorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                      "${AssetsUrl.imgUrl}ic_no_image.png"),
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      PrimaryTextStyle(
                                        size: 20,
                                        content: controller
                                                .dataDetailMenu.menu!.nama ??
                                            "",
                                        fontWeight: FontWeight.w600,
                                        color: kSecondaryColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: SizedBox(
                                          width: 295,
                                          child: PrimaryTextStyle(
                                            size: 14,
                                            content: controller.dataDetailMenu
                                                    .menu!.deskripsi ??
                                                "",
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Divider(color: kGreyColor),
                                      ),
                                      ListView(
                                        shrinkWrap: true,
                                        children: [
                                          SizedBox(
                                            width: widthSized(context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5),
                                                      child: SvgPicture.asset(
                                                          "${AssetsUrl.svgUrl}ic_harga.svg"),
                                                    ),
                                                    const PrimaryTextStyle(
                                                      size: 16,
                                                      content: "Harga",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )
                                                  ],
                                                ),
                                                PrimaryTextStyle(
                                                  size: 16,
                                                  content:
                                                      "Rp ${controller.dataDetailMenu.menu!.harga}",
                                                  fontWeight: FontWeight.w600,
                                                  color: kSecondaryColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Divider(color: kGreyColor),
                                          ),
                                          // LEVEL
                                          Conditional.single(
                                            context: context,
                                            conditionBuilder: (context) =>
                                                controller.dataDetailMenu.level!
                                                    .isEmpty,
                                            widgetBuilder: (context) =>
                                                const SizedBox.shrink(),
                                            fallbackBuilder: (context) =>
                                                GestureDetector(
                                              onTap: () => bottomSheetPrimary(
                                                context,
                                                'Pilih Level',
                                                SizedBox(
                                                  height: 50,
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder: (ctx, i) {
                                                      return Obx(
                                                        () => ChooseItem(
                                                          onTap: () {
                                                            controller
                                                                .checkOptionLevel(
                                                                    i + 1);
                                                          },
                                                          item: controller
                                                                  .dataDetailMenu
                                                                  .level![i]
                                                                  .keterangan ??
                                                              "",
                                                          selected: i + 1 ==
                                                              controller
                                                                  .optionLevel
                                                                  .value,
                                                        ),
                                                      );
                                                    },
                                                    itemCount: controller
                                                        .dataDetailMenu
                                                        .level!
                                                        .length,
                                                  ),
                                                ),
                                              ),
                                              child: Obx(
                                                () => CardDetailMenu(
                                                  svgUrl:
                                                      '${AssetsUrl.svgUrl}ic_level.svg',
                                                  name: 'Level',
                                                  content: controller.itemLevel
                                                              .value ==
                                                          ""
                                                      ? 'Pilih Level'
                                                      : controller
                                                          .itemLevel.value,
                                                ),
                                              ),
                                            ),
                                          ),
                                          //
                                          Conditional.single(
                                            context: context,
                                            conditionBuilder: (context) =>
                                                controller.dataDetailMenu.level!
                                                    .isEmpty,
                                            widgetBuilder: (context) =>
                                                const SizedBox.shrink(),
                                            fallbackBuilder: (context) =>
                                                const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              child: Divider(color: kGreyColor),
                                            ),
                                          ),
                                          // TOPPING
                                          Conditional.single(
                                            context: context,
                                            conditionBuilder: (context) =>
                                                controller.dataDetailMenu
                                                    .topping!.isEmpty,
                                            widgetBuilder: (context) =>
                                                const SizedBox.shrink(),
                                            fallbackBuilder: (context) =>
                                                GestureDetector(
                                              onTap: () => bottomSheetPrimary(
                                                context,
                                                'Pilih Toping',
                                                SizedBox(
                                                  height: 50,
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder: (ctx, i) {
                                                      return Obx(
                                                        () => ChooseItem(
                                                          onTap: () {
                                                            controller
                                                                .checkOptionToping(
                                                                    i + 1);
                                                          },
                                                          item: controller
                                                                  .dataDetailMenu
                                                                  .topping![i]
                                                                  .keterangan ??
                                                              "",
                                                          selected: i + 1 ==
                                                              controller
                                                                  .optionToping
                                                                  .value,
                                                        ),
                                                      );
                                                    },
                                                    itemCount: controller
                                                        .dataDetailMenu
                                                        .topping!
                                                        .length,
                                                  ),
                                                ),
                                              ),
                                              child: Obx(
                                                () => CardDetailMenu(
                                                  svgUrl:
                                                      '${AssetsUrl.svgUrl}ic_toping.svg',
                                                  name: 'Toping',
                                                  content: controller.itemToping
                                                              .value ==
                                                          ""
                                                      ? 'Pilih Toping'
                                                      : controller
                                                          .itemToping.value,
                                                ),
                                              ),
                                            ),
                                          ),
                                          //
                                          Conditional.single(
                                            context: context,
                                            conditionBuilder: (context) =>
                                                controller.dataDetailMenu
                                                    .topping!.isEmpty,
                                            widgetBuilder: (context) =>
                                                const SizedBox.shrink(),
                                            fallbackBuilder: (context) =>
                                                const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              child: Divider(color: kGreyColor),
                                            ),
                                          ),
                                          // Catatan
                                          GestureDetector(
                                            onTap: () => bottomSheetPrimary(
                                              context,
                                              'Buat Catatan',
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          widthSized(context) /
                                                              1.3,
                                                      child: const TextField(
                                                        autocorrect: false,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    kSecondaryColor),
                                                          ),
                                                        ),
                                                        maxLength: 100,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.check_circle,
                                                        color: kSecondaryColor,
                                                        size: 35,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            child: const CardDetailMenu(
                                              svgUrl:
                                                  '${AssetsUrl.svgUrl}ic_catatan.svg',
                                              name: 'Catatan',
                                              content: 'Tambahkan catatan',
                                            ),
                                          ),
                                          //
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Divider(color: kGreyColor),
                                          ),
                                        ],
                                      ),
                                      PrimaryButton(
                                        text: "Tambahkan Ke Pesanan",
                                        press: () {},
                                        color: kSecondaryColor,
                                        width: widthSized(context),
                                        fontSize: 16,
                                        textColor: kWhiteColor,
                                        fontWeight: FontWeight.w600,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 35,
                            child: Row(
                              children: [
                                SmallButton(
                                  onTap: () {
                                    MenuController.to
                                        .decreatment(Get.arguments);
                                  },
                                  icon: Icons.indeterminate_check_box_outlined,
                                ),
                                GetBuilder<MenuController>(
                                  init: MenuController(),
                                  builder: (_) {
                                    return PrimaryTextStyle(
                                      size: 15,
                                      content: MenuController.to
                                          .getCount(controller.dataDetailMenu
                                                  .menu?.idMenu ??
                                              0)
                                          .value,
                                      color: kBlackPrimaryColor,
                                    );
                                  },
                                ),
                                SmallButton(
                                  onTap: () {
                                    MenuController.to
                                        .increatment(Get.arguments);
                                  },
                                  icon: Icons.add_box_rounded,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                onLoading: Column(
                  children: [
                    ShimmerEffect(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: SizedBox(
                          width: double.infinity,
                          child: Container(
                            height: 181,
                            width: 181,
                            color: kGreyColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> bottomSheetPrimary(
    BuildContext context, String title, Widget child) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
    ),
    backgroundColor: Colors.white,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: [
                  const Divider(
                    thickness: 5,
                    indent: 170,
                    endIndent: 170,
                    color: Colors.grey,
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      PrimaryTextStyle(
                        size: 18,
                        content: title,
                        fontWeight: FontWeight.w600,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              child,
            ],
          ),
        ),
      );
    },
  );
}
