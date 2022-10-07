import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:train_venturo/config/routes/name_routes.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/modules/features/menu/controllers/menu_controller.dart';
import 'package:train_venturo/modules/features/menu/view/components/card_menu.dart';
import 'package:train_venturo/modules/features/order/controller/order_controller.dart';
import 'package:train_venturo/modules/features/tracking/view/ui/tracking_view.dart';
import 'package:train_venturo/modules/features/voucher/controllers/voucher_controller.dart';
import 'package:train_venturo/shared/customs/primary_button.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';

import '../../../../../shared/customs/appbar_primary.dart';
import '../../../../models/menu_model/menu_response_model.dart';
import '../../../../models/order_model/order_request_model.dart';
import '../../../menu/view/components/com_helper.dart';

class OrderMobileBody extends GetView<OrderController> {
  const OrderMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VoucherController());
    return Scaffold(
      appBar: AppBarPrimary(
        name: "order".tr,
        back: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: heightSized(context),
              width: double.infinity,
              child: Stack(
                children: [
                  SizedBox(
                    height: heightSized(context) / 1.8,
                    child: GetBuilder<MenuController>(
                      init: MenuController(),
                      builder: (state) {
                        return ListView.builder(
                          itemBuilder: (ctx, i) {
                            return CardMenu(
                              image: Image.network(
                                  controller.dummyData[i].foto ?? ""),
                              name: controller.dummyData[i].nama ?? "",
                              cost: controller.orderData[i].harga.toString(),
                              quantity: controller.orderData[i].jumlah ?? 0,
                              increament: () {
                                state.increatment(
                                    controller.orderData[i].idMenu ?? 0);
                                if (state
                                        .getCount(
                                            controller.orderData[i].idMenu ?? 0)
                                        .value !=
                                    0) {
                                  final setData = Menu(
                                    idMenu: controller.orderData[i].idMenu ?? 0,
                                    harga: state
                                        .getHarga(
                                            controller.orderData[i].idMenu ?? 0)
                                        .value,
                                    level: state
                                        .getIdLevel(
                                            controller.orderData[i].idMenu ?? 0)
                                        .value,
                                    topping: state
                                        .getIdToping(
                                            controller.orderData[i].idMenu ?? 0)
                                        .value,
                                    jumlah: state
                                        .getCount(
                                            controller.orderData[i].idMenu ?? 0)
                                        .value,
                                  );
                                  final setDummy = Data(
                                    idMenu: controller.orderData[i].idMenu ?? 0,
                                    foto: controller.dummyData[i].foto ?? "",
                                    nama: controller.dummyData[i].nama ?? "",
                                  );
                                  state.addCardManager(setData, setDummy);
                                  controller.totalHarga();
                                }
                              },
                              decreament: () {
                                if (state
                                        .getCount(
                                            controller.orderData[i].idMenu ?? 0)
                                        .value ==
                                    1) {
                                  primaryAlert(
                                    context,
                                    () {
                                      state.decreatment(
                                          controller.orderData[i].idMenu ?? 0);
                                      final setData = Menu(
                                        idMenu:
                                            controller.orderData[i].idMenu ?? 0,
                                        harga: state
                                            .getHarga(controller
                                                    .orderData[i].idMenu ??
                                                0)
                                            .value,
                                        level: state
                                            .getIdLevel(controller
                                                    .orderData[i].idMenu ??
                                                0)
                                            .value,
                                        topping: state
                                            .getIdToping(controller
                                                    .orderData[i].idMenu ??
                                                0)
                                            .value,
                                        jumlah: state
                                            .getCount(controller
                                                    .orderData[i].idMenu ??
                                                0)
                                            .value,
                                      );
                                      state.removeCardManager(setData);
                                      controller.totalHarga();
                                      Get.back();
                                      if (controller.orderData.isEmpty) {
                                        Get.back();
                                      }
                                    },
                                  );
                                } else {
                                  state.decreatment(
                                      controller.orderData[i].idMenu ?? 0);
                                  final setData = Menu(
                                    idMenu: controller.orderData[i].idMenu ?? 0,
                                    harga: state
                                        .getHarga(
                                            controller.orderData[i].idMenu ?? 0)
                                        .value,
                                    level: state
                                        .getIdLevel(
                                            controller.orderData[i].idMenu ?? 0)
                                        .value,
                                    topping: state
                                        .getIdToping(
                                            controller.orderData[i].idMenu ?? 0)
                                        .value,
                                    jumlah: state
                                        .getCount(
                                            controller.orderData[i].idMenu ?? 0)
                                        .value,
                                  );
                                  state.removeCardManager(setData);
                                  controller.totalHarga();
                                }
                              },
                            );
                          },
                          itemCount: controller.orderData.length,
                        );
                      },
                    ),
                  ),
                ],
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
                      color: kSecondGreyColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(4, 0),
                          color: kGreyColor,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GetBuilder<MenuController>(
                                init: MenuController(),
                                builder: (state) {
                                  return PrimaryTextStyle(
                                    size: 18,
                                    content: "total_order".tr +
                                        "(${state.newDataCount} Menu) : ",
                                    fontWeight: FontWeight.w500,
                                  );
                                },
                              ),
                              GetBuilder<OrderController>(
                                init: OrderController(),
                                builder: (state) {
                                  return PrimaryTextStyle(
                                    size: 14,
                                    content: "Rp ${state.containTotal}",
                                    fontWeight: FontWeight.bold,
                                    color: kSecondaryColor,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Divider(),
                        ),
                        GetBuilder<OrderController>(
                          init: OrderController(),
                          builder: (state) {
                            return Conditional.single(
                              context: context,
                              conditionBuilder: (context) =>
                                  controller.dataDiskon.isNotEmpty,
                              widgetBuilder: (context) => Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.defaultDialog(
                                        title: "info_diskon".tr,
                                        titlePadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 24),
                                        titleStyle: const TextStyle(
                                          color: kSecondaryColor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textCancel: "ok".tr,
                                        cancelTextColor: kSecondaryColor,
                                        buttonColor: kSecondaryColor,
                                        content: Container(
                                          width: widthSized(context),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25),
                                          height: (40 *
                                                  controller.dataDiskon.length)
                                              .toDouble(),
                                          child: ListView.builder(
                                            itemCount:
                                                controller.dataDiskon.length,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    controller.dataDiskon[index]
                                                            .nama ??
                                                        "",
                                                  ),
                                                  Text(
                                                    "${controller.dataDiskon[index].diskon ?? "0"} %",
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      );
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
                                          Row(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Icon(
                                                  Icons.discount_outlined,
                                                  size: 28,
                                                  color: kSecondaryColor,
                                                ),
                                              ),
                                              PrimaryTextStyle(
                                                size: 18,
                                                content: "discount".tr,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          PrimaryTextStyle(
                                            size: 14,
                                            content:
                                                "Rp ${state.jumlahDiskon.toInt()}",
                                            fontWeight: FontWeight.bold,
                                            color: kRedColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              fallbackBuilder: (context) => GestureDetector(
                                onTap: () {
                                  if (VoucherController
                                      .to.dataVoucher.isNotEmpty) {
                                    Get.toNamed(AppRoutes.voucherView);
                                  } else {
                                    Get.defaultDialog(
                                      title: "Info Voucher",
                                      titleStyle: const TextStyle(
                                        color: kSecondaryColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textCancel: "ok".tr,
                                      cancelTextColor: kSecondaryColor,
                                      buttonColor: kSecondaryColor,
                                      content: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: PrimaryTextStyle(
                                            size: 16,
                                            content: "empty_voucher".tr),
                                      ),
                                    );
                                  }
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
                                      Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Icon(
                                              Icons.credit_card_rounded,
                                              size: 28,
                                              color: kSecondaryColor,
                                            ),
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
                                            state.selectedVoucher != null,
                                        widgetBuilder: (context) => Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                PrimaryTextStyle(
                                                  size: 14,
                                                  content:
                                                      "Rp ${state.selectedVoucher?.nominal ?? 0}",
                                                  color: kRedColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                PrimaryTextStyle(
                                                  size: 10,
                                                  content: state.selectedVoucher
                                                          ?.nama ??
                                                      "",
                                                ),
                                              ],
                                            ),
                                            const Icon(
                                                Icons.chevron_right_rounded)
                                          ],
                                        ),
                                        fallbackBuilder: (context) =>
                                            PrimaryTextStyle(
                                          size: 14,
                                          content: "choose_voucher".tr,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.payments_outlined,
                                      size: 28,
                                      color: kSecondaryColor,
                                    ),
                                  ),
                                  PrimaryTextStyle(
                                    size: 18,
                                    content: "payment".tr,
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
                        Container(
                          width: widthSized(context),
                          height: heightSized(context) / 10,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.shopping_basket_outlined,
                                size: 42,
                                color: kSecondaryColor,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PrimaryTextStyle(
                                    size: 12,
                                    content: "total_payment".tr,
                                    color: kGreyColor,
                                  ),
                                  GetBuilder<OrderController>(
                                    init: OrderController(),
                                    builder: (state) {
                                      return PrimaryTextStyle(
                                        size: 20,
                                        content:
                                            "Rp ${state.dataOrder.totalBayar! < 0 ? 0 : state.dataOrder.totalBayar!}",
                                        fontWeight: FontWeight.bold,
                                        color: kSecondaryColor,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              GetBuilder<OrderController>(
                                init: OrderController(),
                                builder: (state) {
                                  return PrimaryButton(
                                    text: "order_now".tr,
                                    press: () {
                                      showDialogIdentify(context, state);
                                    },
                                    color: kSecondaryColor,
                                    width: widthSized(context) / 2.5,
                                    fontSize: 13,
                                    textColor: kWhiteColor,
                                    fontWeight: FontWeight.bold,
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  showDialogVerifyWithPin(OrderController value) {
    return showDialog(
      context: Get.overlayContext!,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          content: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            child: Column(children: [
              PrimaryTextStyle(
                size: 22,
                content: "verif_order".tr,
                fontWeight: FontWeight.w600,
              ),
              PrimaryTextStyle(
                size: 16,
                content: "insert_pin".tr,
                color: kGreyColor,
              ),
              const SizedBox(
                height: 36,
              ),
              PinCodeTextField(
                controller: value.pinController,
                appContext: context,
                length: 6,
                obscureText: true,
                autoFocus: true,
                obscuringCharacter: '*',
                keyboardType: TextInputType.number,
                errorAnimationController: value.errorController,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 35,
                  fieldWidth: 35,
                ),
                onCompleted: (v) async {
                  await value.checkPin(context);
                  if (value.idOfNewOrder != 0) {
                    showOrderSuccessDialog(value.idOfNewOrder);
                  }
                },
                onChanged: (String data) {
                  // value.pinController.text = data;
                },
              ),
            ]),
          ),
        );
      },
    );
  }

  showDialogIdentify(BuildContext context, OrderController value) {
    return showDialog(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          content: Container(
            height: widthSized(context) - 50,
            width: widthSized(context),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                PrimaryTextStyle(
                  size: 22,
                  content: "verif_order".tr,
                  fontWeight: FontWeight.w600,
                ),
                PrimaryTextStyle(
                  size: 16,
                  content: "finger_print".tr,
                  color: kGreyColor,
                ),
                const SizedBox(
                  height: 36,
                ),
                GestureDetector(
                  onTap: () async {
                    await value.authenticateWithBiometrics(context);
                    if (value.isLoading.isFalse && value.idOfNewOrder != 0) {
                      showOrderSuccessDialog(value.idOfNewOrder);
                    }
                  },
                  child: const Icon(
                    Icons.fingerprint,
                    color: kSecondaryColor,
                    size: 142,
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(),
                        flex: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "or".tr,
                          style: const TextStyle(
                            color: kGreyColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Future.delayed(Duration.zero, () async {
                      // Navigator.pop(context);
                      Get.back();
                      showDialogVerifyWithPin(value);
                    });
                  },
                  child: PrimaryTextStyle(
                    size: 16,
                    content: "verif_using_pin".tr,
                    fontWeight: FontWeight.w600,
                    color: kSecondaryColor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showOrderSuccessDialog(int id) {
    AlertDialog orderSuccessDialog = AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16),
            child:
                SvgPicture.asset("${AssetsUrl.svgUrl}ic_pesanan_disiapkan.svg"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Text(
              "order_prepared".tr,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 22,
                color: Color.fromRGBO(30, 30, 30, 1),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              "you_can_track".tr,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color.fromRGBO(46, 46, 46, 0.5),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 8),
            child: ElevatedButton(
              onPressed: () {
                Get.to(
                  () => TrackingView(
                    id: id,
                    fromOrder: false,
                  ),
                );
              },
              child: Text(
                "ok".tr,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                primary: kSecondaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size.fromHeight(40),
                side: const BorderSide(
                  color: Color.fromARGB(255, 0, 113, 127),
                  width: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );

    showDialog(
      context: Get.overlayContext!,
      builder: (BuildContext context) {
        return orderSuccessDialog;
      },
    );
  }
}
