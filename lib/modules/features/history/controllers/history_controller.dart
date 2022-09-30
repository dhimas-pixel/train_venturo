import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/modules/features/order/repository/order_service.dart';
import 'package:train_venturo/modules/features/tracking/view/ui/tracking_view.dart';
import 'package:train_venturo/modules/models/order_model.dart/order_history_response_model.dart';
import 'package:train_venturo/modules/models/order_model.dart/order_list_by_iduser_model.dart'
    as order;
import 'package:train_venturo/shared/customs/primary_button.dart';

import '../../../models/order_model.dart/order_response_model.dart';

class HistoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  OrderService orderService = OrderService();

  final RxList<order.Order> _orderListProcess = <order.Order>[].obs;
  RxList<order.Order> get orderListProcess => _orderListProcess;

  final RxList<order.Order> _orderList = <order.Order>[].obs;
  RxList<order.Order> get orderList => _orderList;

  RxBool isLoading = false.obs;

  OrderHistoryResModel? orderHistory;

  List<order.Order> listHistoryOrderFilterred = [];
  List<order.Order> listHistoryOrderFilterredDone = [];
  List<order.Order> listHistoryOrderFilterredBatal = [];
  List<order.Order> listHistoryOrderDataAll = [];
  List<order.Order> listHistoryOrderData = [];

  var dropdownItems = [
    "Semua Status",
    "Selesai",
    "Dibatalkan",
  ];
  var selectedDropdownItem = "Semua Status";

  // Date
  DateTimeRange? selectedDateRange;
  DateTime? startDate;
  DateTime? endDate;

  String startDateString = "";
  String endDateString = "";

  DateFormat formatter = DateFormat('dd/MM/yy');
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: 2);
    initialFun();
  }

  initialFun() async {
    isLoading = true.obs;
    update();
    endDate = DateTime.now();
    startDate = endDate!.subtract(const Duration(days: 7));

    startDateString = formatter.format(startDate!).toString();
    endDateString = formatter.format(endDate!).toString();

    await getHistoryOrder();
    await getOrderListProcess();

    isLoading = false.obs;
    update();
  }

  Future<void> getOrderListProcess() async {
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
  }

  getHistoryOrder() async {
    OrderHistoryResModel? getOrder = await orderService.getHistoryOrder();

    if (getOrder != null) {
      orderHistory = getOrder;
      listHistoryOrderFilterred = getOrder.data?.listData ?? [];
      listHistoryOrderData = getOrder.data?.listData ?? [];
      listHistoryOrderDataAll.addAll(getOrder.data?.listData ?? []);
      List<order.Order> listHistoryOrderDone =
          listHistoryOrderData.where((i) => i.status == 3).toList();

      List<order.Order> listHistoryOrderBatal =
          listHistoryOrderData.where((i) => i.status == 4).toList();

      listHistoryOrderFilterredBatal = listHistoryOrderBatal;
      listHistoryOrderFilterredDone = listHistoryOrderDone;
    }
  }

  void showMyDatePicker() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: Get.context!,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'done'.tr,
    );

    if (result != null) {
      // Rebuild the UI
      selectedDateRange = result;
      startDate = result.start;
      endDate = result.end;

      startDateString = formatter.format(startDate!).toString();
      endDateString = formatter.format(endDate!).toString();

      await filterDataInDateRange();
    }
    update();
  }

  filterDataInDateRange() async {
    await filterData(selectedDropdownItem);
    List<order.Order> tempOrder = [];
    tempOrder.addAll(listHistoryOrderFilterred);
    listHistoryOrderFilterred.clear();

    for (var i = 0; i < tempOrder.length; i += 1) {
      var date = dateFormat.parse(tempOrder[i].tanggal!);
      if (date.compareTo(startDate!) >= 0 && date.compareTo(endDate!) <= 0) {
        listHistoryOrderFilterred.add(tempOrder[i]);
      }
    }
  }

  filterData(String data) async {
    listHistoryOrderFilterred.clear();
    selectedDropdownItem = data;

    switch (data) {
      case 'Selesai':
        listHistoryOrderFilterred.addAll(listHistoryOrderFilterredDone);
        break;
      case 'Done':
        listHistoryOrderFilterred.addAll(listHistoryOrderFilterredDone);
        break;
      case 'Dibatalkan':
        listHistoryOrderFilterred.addAll(listHistoryOrderFilterredBatal);
        break;
      case 'Canceled':
        listHistoryOrderFilterred.addAll(listHistoryOrderFilterredBatal);
        break;
      default:
        listHistoryOrderFilterred.addAll(listHistoryOrderDataAll);
        break;
    }
    update();
  }

  pesanLagiFunction(order.Order order) async {
    showDialog(
        context: Get.context!,
        builder: (builder) {
          return AlertDialog(
            title: const Text("Pesan kembali menu ini?"),
            actions: [
              PrimaryButton(
                text: "Oke",
                press: () async {
                  OrderResModel? isSent = await orderService.reOrderAdd(order);

                  if (isSent != null) {
                    Get.snackbar(
                        "order_menu_success_title".tr,
                        "order_menu_success_message".trParams({
                          'length': '${order.menu?.length ?? 0}',
                          'totalBayar': ' ${order.totalBayar}'
                        }));
                    Get.close(1);
                    Get.to(() => TrackingView(id: isSent.data!.idOrder!));
                  }
                },
                color: kSecondaryColor,
                width: 100,
                fontSize: 16,
                textColor: kWhiteColor,
              ),
            ],
          );
        });
  }
}
