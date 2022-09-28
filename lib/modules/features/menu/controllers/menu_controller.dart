import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:train_venturo/modules/features/menu/repository/menu_service.dart';
import 'package:train_venturo/modules/features/menu/repository/promo_service.dart';
import 'package:train_venturo/modules/models/order_model.dart/order_request_model.dart'
    as order;
import 'package:train_venturo/modules/models/promo_model.dart/promo_response_model.dart'
    as promo;

import '../../../../config/routes/name_routes.dart';
import '../../../models/menu_model.dart/menu_response_model.dart' as menu;

class MenuController extends GetxController with StateMixin {
  PromoService promoService = PromoService();
  MenuService menuService = MenuService();

  RxBool isFound = true.obs;

  static MenuController get to => Get.find();

  final RxList<promo.Data> _dataPromo = <promo.Data>[].obs;
  RxList<promo.Data> get dataPromo => _dataPromo;

  final RxList<menu.Data> _dataAllMenu = <menu.Data>[].obs;
  RxList<menu.Data> get dataAllMenu => _dataAllMenu;

  Rx<List<menu.Data>> foundMenu = Rx<List<menu.Data>>([]);

  final RxList<menu.Data> _dataFood = <menu.Data>[].obs;
  RxList<menu.Data> get dataFood => _dataFood;

  final RxList<menu.Data> _dataDrink = <menu.Data>[].obs;
  RxList<menu.Data> get dataDrink => _dataDrink;

  final RxList<menu.Data> _dataSnack = <menu.Data>[].obs;
  RxList<menu.Data> get dataSnack => _dataSnack;

  // Order Data
  final RxList<order.Menu> _orderNewData = <order.Menu>[].obs;
  RxList<order.Menu> get orderNewData => _orderNewData;

  final RxList<menu.Data> _dummyData = <menu.Data>[].obs;
  RxList<menu.Data> get dummyData => _dummyData;

  Future<void> getPromo() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await promoService.getPromo();
      _dataPromo.value = response!.data!;
    } on DioError {
      _dataPromo.value = [];
    }
    change(null, status: RxStatus.success());
  }

  Future<void> getAllMenu() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await menuService.getAllMenu();
      _dataAllMenu.value = response!.data!;
      _dataFood.value = _dataAllMenu
          .where((element) =>
              element.kategori.toString().toLowerCase().contains('makanan'))
          .toList();
      _dataDrink.value = _dataAllMenu
          .where((element) =>
              element.kategori.toString().toLowerCase().contains('minuman'))
          .toList();
      _dataSnack.value = _dataAllMenu
          .where((element) =>
              element.kategori.toString().toLowerCase().contains('snack'))
          .toList();
    } on DioError {
      _dataAllMenu.value = [];
    }
    change(null, status: RxStatus.success());
  }

  @override
  void onInit() {
    getPromo();
    getAllMenu();
    foundMenu.value = _dataAllMenu;
    super.onInit();
  }

  void filterMenu(String menuName) {
    List<menu.Data> results = [];
    if (menuName.isEmpty) {
      isFound.value = true;
    } else {
      isFound.value = false;
      results = _dataAllMenu
          .where((element) => element.nama
              .toString()
              .toLowerCase()
              .contains(menuName.toLowerCase()))
          .toList();
    }
    foundMenu.value = results;
  }

  void increatment(int idMenu) {
    var countAll =
        _dataAllMenu.where((element) => element.idMenu == idMenu).toList();
    if (countAll[0].jumlah == 0) {
      Get.toNamed(AppRoutes.detailMenuView, arguments: idMenu);
    }
    countAll[0].jumlah++;
    update();
  }

  void decreatment(int idMenu) {
    var countAll =
        _dataAllMenu.where((element) => element.idMenu == idMenu).toList();
    if (countAll[0].jumlah > 0) {
      countAll[0].jumlah--;
    }
    update();
  }

  Rx<int> getCount(int idMenu) {
    var countAll =
        _dataAllMenu.where((element) => element.idMenu == idMenu).toList();
    int getData = countAll[0].jumlah;
    return getData.obs;
  }

  Rx<String?> getKetLevel(int idMenu) {
    var countAll =
        _dataAllMenu.where((element) => element.idMenu == idMenu).toList();
    String? getData = countAll[0].ketLevel;
    return getData.obs;
  }

  Rx<int?> getIdLevel(int idMenu) {
    var countAll =
        _dataAllMenu.where((element) => element.idMenu == idMenu).toList();
    int? getData = countAll[0].level;
    return getData.obs;
  }

  Rx<int?> getHarga(int idMenu) {
    var countAll =
        _dataAllMenu.where((element) => element.idMenu == idMenu).toList();
    int? getData = countAll[0].harga;
    return getData.obs;
  }

  Rx<List<String>?> getKetToping(int idMenu) {
    var countAll =
        _dataAllMenu.where((element) => element.idMenu == idMenu).toList();
    List<String>? getData = [];
    getData = countAll[0].ketToping;
    return getData.obs;
  }

  Rx<List<int>?> getIdToping(int idMenu) {
    var countAll =
        _dataAllMenu.where((element) => element.idMenu == idMenu).toList();
    List<int>? getData = [];
    getData = countAll[0].toping;
    return getData.obs;
  }

  int get newDataCount {
    return _orderNewData.length;
  }

  void addCardManager(order.Menu setData, menu.Data dummyData) {
    int? totalHarga = setData.harga! * setData.jumlah!;
    final newAddItem = order.Menu(
      idMenu: setData.idMenu,
      harga: totalHarga,
      level: setData.level,
      topping: setData.topping,
      jumlah: setData.jumlah,
    );
    final newDummy = menu.Data(
      idMenu: dummyData.idMenu,
      foto: dummyData.foto,
      nama: dummyData.nama,
    );
    if (_orderNewData.isNotEmpty) {
      bool isFound = false;
      for (int itemcount = 0; itemcount < newDataCount; itemcount++) {
        if (_orderNewData[itemcount].idMenu == newAddItem.idMenu) {
          isFound = true;
          // Update
          _orderNewData[itemcount].harga = totalHarga;
          _orderNewData[itemcount].level = setData.level;
          _orderNewData[itemcount].jumlah = setData.jumlah;
          _orderNewData[itemcount].topping = setData.topping;
          for (var i = 0; i < _orderNewData.length; i++) {
            log(_orderNewData[i].toJson().toString());
          }
          break;
        }
      }
      if (!isFound) {
        _orderNewData.add(newAddItem);
        _dummyData.add(newDummy);
        log("Data Ada : addCard");
        for (var i = 0; i < _orderNewData.length; i++) {
          log("Order" + _orderNewData[i].toJson().toString());
          log("Dummy" + _dummyData[i].toJson().toString());
        }
        update();
      }
    } else {
      _orderNewData.add(newAddItem);
      _dummyData.add(newDummy);
      log("Data kosong : addCard");
      update();
    }
  }

  void removeCardManager(order.Menu setData) {
    int? totalHarga = setData.harga! * setData.jumlah!;
    final newAddItem = order.Menu(
      idMenu: setData.idMenu,
      harga: totalHarga,
      level: setData.level,
      topping: setData.topping,
      jumlah: setData.jumlah,
    );
    if (_orderNewData.isNotEmpty) {
      if (setData.jumlah == 0) {
        for (int itemcount = 0; itemcount < newDataCount; itemcount++) {
          if (_orderNewData[itemcount].idMenu == newAddItem.idMenu) {
            // Update
            _orderNewData
                .removeWhere((element) => element.idMenu == setData.idMenu);
            _dummyData
                .removeWhere((element) => element.idMenu == setData.idMenu);
            for (var i = 0; i < _orderNewData.length; i++) {
              log(_orderNewData[i].toJson().toString());
              log(_dummyData[i].toJson().toString());
            }
            log(setData.idMenu.toString());
            update();
            break;
          }
        }
      } else {
        for (int itemcount = 0; itemcount < newDataCount; itemcount++) {
          if (_orderNewData[itemcount].idMenu == newAddItem.idMenu) {
            // Update
            _orderNewData[itemcount].harga = totalHarga;
            _orderNewData[itemcount].level = setData.level;
            _orderNewData[itemcount].jumlah = setData.jumlah;
            _orderNewData[itemcount].topping = setData.topping;
            for (var i = 0; i < _orderNewData.length; i++) {
              log(_orderNewData[i].toJson().toString());
              log(_dummyData[i].toJson().toString());
            }
            break;
          }
        }
      }
    }
  }
}
