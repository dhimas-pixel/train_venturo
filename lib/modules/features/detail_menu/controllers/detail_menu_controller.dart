import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:train_venturo/modules/features/detail_menu/repository/detail_menu_service.dart';
import 'package:train_venturo/modules/features/menu/controllers/menu_controller.dart';
import 'package:train_venturo/modules/models/detail_menu_model/detail_menu_response_model.dart'
    as detail_menu;
// import 'package:train_venturo/modules/models/order_model.dart/order_request_model.dart'
//     as order;

class DetailMenuController extends GetxController with StateMixin {
  DetailMenuService detailService = DetailMenuService();

  late detail_menu.Data _dataDetailMenu;
  detail_menu.Data get dataDetailMenu => _dataDetailMenu;

  // final RxList<detail_menu.Level> _dataLevel = <detail_menu.Level>[].obs;
  // RxList<detail_menu.Level> get dataLevel => _dataLevel;

  int idMenu = Get.arguments;

  Rx<int> optionLevel = 0.obs;
  Rx<int> optionToping = 0.obs;

  Rx<int> idLevel = 0.obs;
  RxList<int> idToping = <int>[].obs;

  Rx<String> itemLevel = "".obs;
  Rx<String> itemToping = "".obs;

  // final RxList<order.Menu> _addNewData = <order.Menu>[].obs;

  Future<void> getDetailMenu(int idMenu) async {
    change(null, status: RxStatus.loading());
    try {
      final response = await detailService.getDetailMenu(idMenu);
      _dataDetailMenu = response!.data!;
    } on DioError catch (e) {
      throw Exception(e);
    }
    change(null, status: RxStatus.success());
  }

  // Rx<int?> getIdLevel(int idMenu) {
  //   var countAll = _dataDetailMenu.level
  //       ?.where((element) => element.idDetail == idMenu)
  //       .toList();
  //   int? getData = countAll![0].idDetail;
  //   log("Anjing" + getData.toString());
  //   return getData.obs;
  // }

  void checkOptionLevel(int index, int idMenu) {
    optionLevel.value = index;
    var getData = _dataDetailMenu.level?[index - 1];

    var getDataMenu = MenuController.to.dataAllMenu
        .where((element) => element.idMenu == idMenu)
        .toList();

    // getDataMenu[0].ketLevel = null;
    // getDataMenu[0].level = 0;
    // MenuController.to.getIdLevel(idMenu).value = 0;

    // itemLevel.value = getData?.keterangan ?? "";
    // idLevel.value = getDataMenu[0].level!;

    getDataMenu[0].level = getData?.idDetail ?? 0;
    getDataMenu[0].ketLevel = getData?.keterangan ?? "";

    log("Id level " + getDataMenu[0].level.toString());
    log("Keterangan level " + getDataMenu[0].ketLevel.toString());
    update();
    // log("Keterangan " + getLevel[0].keterangan.toString());
  }

  void checkOptionToping(int index) {
    var getData = _dataDetailMenu.topping?[index - 1];

    var getDataMenu = MenuController.to.dataAllMenu
        .where((element) => element.idMenu == idMenu)
        .toList();

    itemToping.value = getData?.keterangan ?? "";
    if (getDataMenu[0].toping!.isNotEmpty) {
      bool isFound = false;
      for (var i = 0; i < getDataMenu[0].toping!.length; i++) {
        if (getDataMenu[0].toping?[i] == index) {
          isFound = true;
          getDataMenu[0].toping?.remove(index);

          getDataMenu[0].ketToping?.remove(itemToping.value);

          idToping.remove(index);
        }
      }
      if (!isFound) {
        getDataMenu[0].toping?.add(index);

        getDataMenu[0].ketToping?.add(itemToping.value);

        idToping.add(index);
      }
    } else {
      getDataMenu[0].toping?.add(index);

      getDataMenu[0].ketToping?.add(itemToping.value);

      idToping.add(index);
    }

    log("Id detail Toping " + getDataMenu[0].toping.toString());
    log("Keterangan Toping " + getDataMenu[0].ketToping.toString());
    update();
  }

  // int get newDataCount {
  //   return _addNewData.length;
  // }

  // void addCardManager(order.Menu setData) {
  //   final newAddItem = order.Menu(
  //     idMenu: setData.idMenu,
  //     harga: setData.harga,
  //     level: setData.level,
  //     topping: setData.topping,
  //     jumlah: setData.jumlah,
  //   );
  //   if (_addNewData.isNotEmpty) {
  //     bool isFound = false;
  //     for (int itemcount = 0; itemcount < newDataCount; itemcount++) {
  //       if (_addNewData[itemcount].idMenu == newAddItem.idMenu) {
  //         isFound = true;
  //         // _addNewData[itemcount].toggleDone();
  //         log("Menu : $isFound");
  //         break;
  //       }
  //     }
  //     if (!isFound) {
  //       _addNewData.add(newAddItem);
  //       log(_addNewData.length.toString());
  //       log("addCard");
  //       update();
  //     }
  //   } else {
  //     _addNewData.add(newAddItem);
  //     log(_addNewData.length.toString());
  //     log("Data kosong : addCard");
  //     update();
  //   }
  // }

  @override
  void onInit() {
    getDetailMenu(idMenu);
    super.onInit();
  }
}
