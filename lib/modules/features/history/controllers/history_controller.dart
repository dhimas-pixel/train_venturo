import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:train_venturo/modules/features/order/repository/order_service.dart';
import 'package:train_venturo/modules/models/order_model.dart/order_list_by_iduser_model.dart'
    as order;

class HistoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  OrderService orderService = OrderService();

  final RxList<order.Data> _orderListProcess = <order.Data>[].obs;
  RxList<order.Data> get orderListProcess => _orderListProcess;

  final RxList<order.Data> _orderList = <order.Data>[].obs;
  RxList<order.Data> get orderList => _orderList;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: 2);
    getOrderListProcess();
  }

  Future<void> getOrderListProcess() async {
    isLoading = true.obs;
    update();
    try {
      final response = await orderService.getOrderListByUser();
      if (response!.data != null) {
        _orderList.value = response.data!;
        _orderListProcess.value =
            _orderList.where((element) => element.status! < 3).toList();
      }
    } on DioError {
      _orderListProcess.value = [];
    }
    isLoading = false.obs;
    update();
  }
}
