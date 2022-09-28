import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:train_venturo/modules/features/menu/controllers/menu_controller.dart';
import 'package:train_venturo/modules/features/order/repository/order_service.dart';
import 'package:train_venturo/modules/models/diskon_model.dart/diskon_response_model.dart'
    as diskon;
import 'package:train_venturo/modules/models/order_model.dart/order_request_model.dart'
    as order;
import 'package:train_venturo/modules/models/voucher_model.dart/voucher_response_model.dart'
    as voucher;
import 'package:train_venturo/utils/functions/components_helper.dart';
import '../../../../utils/functions/cache_manager.dart';
import '../../../models/menu_model.dart/menu_response_model.dart' as menu;

class OrderController extends GetxController {
  static OrderController get to => Get.find();

  OrderService orderService = OrderService();

  RxList<order.Menu> get orderData => MenuController.to.orderNewData;
  RxList<menu.Data> get dummyData => MenuController.to.dummyData;

  order.Order get dataOrder => _dataOrder;

  final RxList<diskon.Data> _dataDiskon = <diskon.Data>[].obs;
  RxList<diskon.Data> get dataDiskon => _dataDiskon;

  voucher.Data? selectedVoucher;

  final order.Order _dataOrder = order.Order(
    potongan: 0,
    totalBayar: 0,
  );

  double jumlahDiskon = 0;
  int jumlahBayar = 0;
  RxInt containTotal = 0.obs;

  LocalAuthentication auth = LocalAuthentication();
  TextEditingController pinController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  RxBool isSuccess = false.obs;
  RxBool isLoading = false.obs;
  int idOfNewOrder = 0;

  @override
  void onInit() {
    getMyDiskon();
    super.onInit();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  // checkPin() async {
  //   if (pinController.text == userBox.values.first.pin) {
  //     // Get.back(closeOverlays: true);
  //     Get.close(2);
  //     isLoading = true.obs;
  //     update();
  //     await checkout();
  //     isLoading = false.obs;

  //     update();
  //   } else {
  //     errorController.add(ErrorAnimationType.shake);
  //   }
  // }

  Future<void> authenticateWithBiometrics(BuildContext context) async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Scan fingerprint untuk melanjutkan pembelian',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      log(e.toString());

      return;
    }

    if (authenticated) {
      log("true auth");
      Get.close(1);
      isLoading = true.obs;
      loadData(context);
      update();
      await checkout();

      isLoading = false.obs;
      Get.back();
      // checkout();
    } else {
      log("false auth");
    }
  }

  Future<void> getMyDiskon() async {
    try {
      final response = await orderService.getDiskonId();
      if (response!.data != null) {
        _dataDiskon.value = response.data!;
      }
      totalHarga();
      update();
    } on DioError {
      _dataDiskon.value = [];
      update();
    }
  }

  Future<void> totalHarga() async {
    containTotal.value = 0;
    for (int itemcount = 0; itemcount < orderData.length; itemcount++) {
      containTotal.value += orderData[itemcount].harga!;
    }
    if (_dataDiskon.isNotEmpty) {
      int diskon = 0;
      for (int itemcount = 0; itemcount < _dataDiskon.length; itemcount++) {
        diskon += _dataDiskon[itemcount].diskon ?? 0;
      }
      jumlahDiskon = containTotal.value * (diskon / 100);
      _dataOrder.potongan = jumlahDiskon.toInt();
      _dataOrder.totalBayar = containTotal.value - jumlahDiskon.toInt();
    } else {
      _dataOrder.potongan = selectedVoucher?.nominal ?? 0;
      _dataOrder.totalBayar =
          containTotal.value - (selectedVoucher?.nominal ?? 0);
    }
    update();
  }

  checkout() async {
    order.Order setOrder = order.Order(
      idUser: CacheManager.getidUser(),
      idVoucher: (selectedVoucher?.idVoucher ?? 0),
      potongan: _dataOrder.potongan,
      totalBayar: _dataOrder.totalBayar,
    );
    final response = await orderService.orderAdd(order.OrderReqModel(
      order: setOrder,
      menu: orderData,
    ));
    idOfNewOrder = response?.data?.idOrder ?? 0;
    log(response!.data!.toJson().toString());
    update();
  }
}
