import 'dart:developer';

import 'package:get/get.dart';
import 'package:train_venturo/modules/models/order_model.dart/order_request_model.dart'
    as order;

class OrderController extends GetxController {
  static OrderController get to => Get.find();

  final RxList<order.Menu> _addNewData = <order.Menu>[].obs;

  int get newDataCount {
    return _addNewData.length;
  }

  void addCardManager(order.Menu setData) {
    final newAddItem = order.Menu(
      idMenu: setData.idMenu,
      harga: setData.harga,
      level: setData.level,
      topping: setData.topping,
      jumlah: setData.jumlah,
    );
    if (_addNewData.isNotEmpty) {
      bool isFound = false;
      for (int itemcount = 0; itemcount < newDataCount; itemcount++) {
        if (_addNewData[itemcount].idMenu == newAddItem.idMenu) {
          isFound = true;
          // _addNewData[itemcount].toggleDone();
          log("Menu : $isFound");
          break;
        }
      }
      if (!isFound) {
        _addNewData.add(newAddItem);
        log(_addNewData.length.toString());
        log("addCard");
        update();
      }
    } else {
      _addNewData.add(newAddItem);
      log(_addNewData.length.toString());
      log("Data kosong : addCard");
      update();
    }
  }
}
