import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:train_venturo/modules/features/menu/repository/menu_service.dart';
import 'package:train_venturo/modules/features/menu/repository/promo_service.dart';
import 'package:train_venturo/modules/models/promo_model.dart/promo_response_model.dart'
    as promo;

import '../../../models/menu_model.dart/menu_response_model.dart' as menu;

class MenuController extends GetxController with StateMixin {
  PromoService promoService = PromoService();
  MenuService menuService = MenuService();

  late List<promo.Data> _dataPromo = [];
  List<promo.Data> get dataPromo => _dataPromo;

  late List<menu.Data> _dataAllMenu = [];
  List<menu.Data> get dataAllMenu => _dataAllMenu;

  late List<menu.Data> _dataFood = [];
  List<menu.Data> get dataFood => _dataFood;

  late List<menu.Data> _dataDrink = [];
  List<menu.Data> get dataDrink => _dataDrink;

  late List<menu.Data> _dataSnack = [];
  List<menu.Data> get dataSnack => _dataSnack;

  Future<void> getPromo() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await promoService.getPromo();
      _dataPromo = response!.data!;
    } on DioError {
      _dataPromo = [];
    }
    change(null, status: RxStatus.success());
  }

  Future<void> getAllMenu() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await menuService.getAllMenu();
      _dataAllMenu = response!.data!;
    } on DioError {
      _dataAllMenu = [];
    }
    change(null, status: RxStatus.success());
  }

  Future<void> getMenuCategory(String where) async {
    change(null, status: RxStatus.loading());
    try {
      final response = await menuService.getMenuCategory(where);
      if (where == "makanan") {
        _dataFood = response!.data!;
      } else if (where == "minuman") {
        _dataDrink = response!.data!;
      } else {
        _dataSnack = response!.data!;
      }
    } on DioError {
      _dataFood = [];
      _dataDrink = [];
      _dataSnack = [];
    }
    change(null, status: RxStatus.success());
  }
}
