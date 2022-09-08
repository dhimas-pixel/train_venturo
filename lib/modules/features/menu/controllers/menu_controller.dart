import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:train_venturo/modules/features/menu/repository/promo_service.dart';
import 'package:train_venturo/modules/models/promo_model.dart/promo_response_model.dart'
    as promo;

class MenuController extends GetxController with StateMixin {
  PromoService promoService = PromoService();

  late List<promo.Data> _data = [];
  List<promo.Data> get data => _data;

  Future<void> getPromo() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await promoService.getPromo();
      _data = response!.data!;
    } on DioError {
      _data = [];
    }
    change(null, status: RxStatus.success());
  }
}
