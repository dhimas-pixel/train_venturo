import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:get/get.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/modules/features/tracking/controllers/detail_pesanan_controller.dart';
import 'package:train_venturo/modules/features/tracking/view/components/cardOrder.dart';
import 'package:train_venturo/shared/customs/appbar_primary.dart';
import 'package:train_venturo/shared/widgets/shimmer_effect.dart';

import '../../../../../config/routes/name_routes.dart';
import '../../../../../config/themes/color.dart';
import '../../../../../constant/core/assets_const/assets_const.dart';
import '../../../../../shared/customs/primary_text_style.dart';
import '../../../login/controllers/login_controller.dart';
import '../../../menu/controllers/menu_controller.dart';

class TrackingView extends GetView<DetailPesananController> {
  final int id;
  final bool fromOrder;
  const TrackingView({
    Key? key,
    required this.id,
    this.fromOrder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPesananController>(
      init: DetailPesananController(idOrder: id),
      builder: (state) {
        return WillPopScope(
          onWillPop: () async {
            if (fromOrder) {
              Get.back();
            } else {
              await Get.deleteAll(force: true);
              Get.put(LoginController());
              Get.put(MenuController());
              Get.toNamed(AppRoutes.homeView);
            }
            return true;
          },
          child: Scaffold(
            appBar: AppBarPrimary(
              name: "Pesanan",
              back: () async {
                if (fromOrder) {
                  Get.back();
                } else {
                  await Get.deleteAll(force: true);
                  Get.put(LoginController());
                  Get.put(MenuController());
                  Get.toNamed(AppRoutes.homeView);
                }
              },
            ),
            body: SizedBox(
              height: heightSized(context),
              child: controller.obx(
                (_) => Stack(
                  children: [
                    SizedBox(
                      height: heightSized(context) / 2.5,
                      child: ListView.builder(
                        itemCount: state.orderDetail?.detail?.length ?? 0,
                        itemBuilder: (context, i) {
                          return CardOrder(
                            image: FadeInImage(
                              placeholder: const AssetImage(
                                  "${AssetsUrl.imgUrl}ic_loading.gif"),
                              image: NetworkImage(
                                state.orderDetail?.detail?[i].foto.toString() ??
                                    "",
                              ),
                              imageErrorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                      "${AssetsUrl.imgUrl}ic_no_image.png"),
                            ),
                            name: state.orderDetail?.detail?[i].nama ?? "",
                            cost: state.orderDetail?.detail?[i].harga ?? "",
                            quantity: state.orderDetail?.detail?[i].jumlah ?? 0,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Stack(
                        children: [
                          Container(
                            width: widthSized(context),
                            padding: const EdgeInsets.only(top: 12),
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(246, 246, 246, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      PrimaryTextStyle(
                                        size: 18,
                                        content:
                                            "Total Pesanan (${state.orderDetail?.detail?.length ?? 0} Menu) : ",
                                        fontWeight: FontWeight.w500,
                                      ),
                                      PrimaryTextStyle(
                                        size: 14,
                                        content:
                                            "Rp ${state.orderDetail?.order?.totalBayar ?? 0}",
                                        fontWeight: FontWeight.bold,
                                        color: kSecondaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Conditional.single(
                                  context: context,
                                  conditionBuilder: (context) =>
                                      state.orderDetail?.order?.idVoucher == 0,
                                  widgetBuilder: (context) => Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25.0),
                                        child: Divider(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25.0, vertical: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.discount_outlined,
                                                  size: 28,
                                                  color: kSecondaryColor,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                PrimaryTextStyle(
                                                  size: 18,
                                                  content: "Diskon",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ],
                                            ),
                                            PrimaryTextStyle(
                                              size: 14,
                                              content:
                                                  "Rp ${state.orderDetail?.order?.potongan ?? 0}",
                                              fontWeight: FontWeight.bold,
                                              color: kRedColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  fallbackBuilder: (context) => Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25.0),
                                        child: Divider(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25.0, vertical: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.credit_card_rounded,
                                                  size: 28,
                                                  color: kSecondaryColor,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                PrimaryTextStyle(
                                                  size: 18,
                                                  content: "Voucher",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ],
                                            ),
                                            Conditional.single(
                                              context: context,
                                              conditionBuilder: (context) =>
                                                  state.orderDetail?.order
                                                      ?.namaVoucher !=
                                                  null,
                                              widgetBuilder: (context) => Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      PrimaryTextStyle(
                                                        size: 14,
                                                        content:
                                                            "Rp ${state.orderDetail?.order?.potongan ?? 0}",
                                                        color: kRedColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      PrimaryTextStyle(
                                                        size: 10,
                                                        content: state
                                                                .orderDetail
                                                                ?.order
                                                                ?.namaVoucher ??
                                                            "",
                                                      ),
                                                    ],
                                                  ),
                                                  const Icon(Icons
                                                      .chevron_right_rounded)
                                                ],
                                              ),
                                              fallbackBuilder: (context) =>
                                                  const PrimaryTextStyle(
                                                size: 14,
                                                content: "Pilih Voucher",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.0),
                                  child: Divider(),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.payments_outlined,
                                              size: 28,
                                              color: kSecondaryColor,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            PrimaryTextStyle(
                                              size: 18,
                                              content: "Pembayaran",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                        const PrimaryTextStyle(
                                          size: 14,
                                          content: "Paylater",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      child: Divider(),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Get.to(ChooseVoucherView());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25.0, vertical: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const PrimaryTextStyle(
                                              size: 18,
                                              content: "Total Pembayaran",
                                              fontWeight: FontWeight.w500,
                                            ),
                                            PrimaryTextStyle(
                                              size: 18,
                                              content:
                                                  "Rp ${state.orderDetail?.order?.totalBayar ?? 0}",
                                              fontWeight: FontWeight.bold,
                                              color: kSecondaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      child: Divider(),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Get.to(ChooseVoucherView());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25.0, vertical: 12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const PrimaryTextStyle(
                                              size: 18,
                                              content:
                                                  "Pesanan kamu sedang disiapkan",
                                              fontWeight: FontWeight.w600,
                                            ),
                                            const SizedBox(
                                              height: 24,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Conditional.single(
                                                        context: context,
                                                        conditionBuilder: (context) =>
                                                            state
                                                                    .orderDetail!
                                                                    .order!
                                                                    .status! >=
                                                                1 &&
                                                            state
                                                                    .orderDetail!
                                                                    .order!
                                                                    .status! <
                                                                4,
                                                        widgetBuilder:
                                                            (context) =>
                                                                const Icon(
                                                          Icons
                                                              .check_circle_rounded,
                                                          color:
                                                              kSecondaryColor,
                                                          size: 24,
                                                        ),
                                                        fallbackBuilder:
                                                            (context) =>
                                                                const Icon(
                                                          Icons.circle,
                                                          color: kGreyColor,
                                                          size: 24,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      const PrimaryTextStyle(
                                                        size: 12,
                                                        content:
                                                            "Pesanan diterima",
                                                        color: kGreyColor,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Divider(
                                                      thickness: 3,
                                                      color: state
                                                                      .orderDetail!
                                                                      .order!
                                                                      .status! >=
                                                                  2 &&
                                                              state
                                                                      .orderDetail!
                                                                      .order!
                                                                      .status! <
                                                                  4
                                                          ? kSecondaryColor
                                                          : kGreyColor),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Conditional.single(
                                                        context: context,
                                                        conditionBuilder: (context) =>
                                                            state
                                                                    .orderDetail!
                                                                    .order!
                                                                    .status! >=
                                                                2 &&
                                                            state
                                                                    .orderDetail!
                                                                    .order!
                                                                    .status! <
                                                                4,
                                                        widgetBuilder:
                                                            (context) =>
                                                                const Icon(
                                                          Icons
                                                              .check_circle_rounded,
                                                          color:
                                                              kSecondaryColor,
                                                          size: 24,
                                                        ),
                                                        fallbackBuilder:
                                                            (context) =>
                                                                const Icon(
                                                          Icons.circle,
                                                          color: kGreyColor,
                                                          size: 24,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      const PrimaryTextStyle(
                                                        size: 12,
                                                        content:
                                                            "Silahkan Diambil",
                                                        color: kGreyColor,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Divider(
                                                      thickness: 3,
                                                      color: state
                                                                  .orderDetail!
                                                                  .order!
                                                                  .status! ==
                                                              3
                                                          ? kSecondaryColor
                                                          : kGreyColor),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Conditional.single(
                                                        context: context,
                                                        conditionBuilder:
                                                            (context) =>
                                                                state
                                                                    .orderDetail!
                                                                    .order!
                                                                    .status! ==
                                                                3,
                                                        widgetBuilder:
                                                            (context) =>
                                                                const Icon(
                                                          Icons
                                                              .check_circle_rounded,
                                                          color:
                                                              kSecondaryColor,
                                                          size: 24,
                                                        ),
                                                        fallbackBuilder:
                                                            (context) =>
                                                                const Icon(
                                                          Icons.circle,
                                                          color: kGreyColor,
                                                          size: 24,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      const PrimaryTextStyle(
                                                        size: 12,
                                                        content:
                                                            "Pesanan Selesai",
                                                        color: kGreyColor,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                onLoading: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, i) {
                    return ShimmerEffect(
                      child: CardOrder(
                        image:
                            Image.asset("${AssetsUrl.imgUrl}ic_no_image.png"),
                        name: "",
                        cost: "",
                        quantity: 0,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
