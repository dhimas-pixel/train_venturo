import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/modules/features/menu/repository/menu_service.dart';
import 'package:train_venturo/modules/features/menu/repository/promo_service.dart';
import 'package:train_venturo/modules/models/promo_model.dart/promo_response_model.dart'
    as promo;

import '../../../models/menu_model.dart/menu_response_model.dart' as menu;

class MenuController extends GetxController with StateMixin {
  PromoService promoService = PromoService();
  MenuService menuService = MenuService();

  RxBool isFound = true.obs;

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

  void getPromo() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await promoService.getPromo();
      _dataPromo.value = response!.data!;
    } on DioError {
      _dataPromo.value = [];
    }
    change(null, status: RxStatus.success());
  }

  void getAllMenu() async {
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

  // void getMenuCategory(String where) async {
  //   change(null, status: RxStatus.loading());
  //   try {
  //     final response = await menuService.getMenuCategory(where);
  //     if (where == "makanan") {
  //       _dataFood.value = response!.data!;
  //     } else if (where == "minuman") {
  //       _dataDrink.value = response!.data!;
  //     } else {
  //       _dataSnack.value = response!.data!;
  //     }
  //   } on DioError {
  //     _dataFood.value = [];
  //     _dataDrink.value = [];
  //     _dataSnack.value = [];
  //   }
  //   change(null, status: RxStatus.success());
  // }

  @override
  void onInit() {
    getPromo();
    getAllMenu();
    // getMenuCategory('makanan');
    // getMenuCategory('minuman');
    // getMenuCategory('snack');
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
    countAll[0].jumlah++;
    update();
    // _dataAllMenu[index].jumlah++;
    // _dataFood[index].jumlah++;
    // List<menu.Data> results = [];
    // var countFood =
    //     _dataFood.where((element) => element.idMenu == idMenu).toList();
    // var countDrink =
    //     _dataDrink.where((element) => element.idMenu == idMenu).toList();
    // print(idMenu);
    // countAll[0].jumlah++;
    // countFood[0].jumlah++;
    // countDrink[0].jumlah++;
    // if (category == 'makanan') {
    //   // print(countFood[0].jumlah++);
    // }
    // print(countAll[0].nama);
    // print(countDrink[0].jumlah++);
    // print(countFood[0].nama);
    // print(countAll[0].nama);
    // print(countDrink[0].nama);
  }

  void decreatment(int idMenu) {
    var countAll =
        _dataAllMenu.where((element) => element.idMenu == idMenu).toList();
    if (countAll[0].jumlah > 0) {
      countAll[0].jumlah--;
    }
    update();
  }
}
