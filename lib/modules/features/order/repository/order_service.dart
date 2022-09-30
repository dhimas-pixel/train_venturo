import 'package:dio/dio.dart';
import 'package:train_venturo/modules/models/diskon_model.dart/diskon_response_model.dart';
import 'package:train_venturo/modules/models/order_model.dart/order_detail_response_model.dart';
import 'package:train_venturo/modules/models/order_model.dart/order_history_response_model.dart';
import 'package:train_venturo/modules/models/order_model.dart/order_list_by_iduser_model.dart'
    as id_user;
import 'package:train_venturo/modules/models/order_model.dart/order_request_model.dart';
import 'package:train_venturo/modules/models/order_model.dart/order_response_model.dart';

import '../../../../constant/core/api_const/base_url_api.dart';
import '../../../../utils/functions/cache_manager.dart';

class OrderService {
  Future<DiskonResModel?> getDiskonId() async {
    try {
      Response response = await BaseUrl.dio.get(
        "${BaseUrl.diskonIdUserUrl}${CacheManager.getidUser()}",
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = DiskonResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<OrderResModel?> orderAdd(OrderReqModel getModel) async {
    try {
      Response response = await BaseUrl.dio.post(
        BaseUrl.orderAddUrl,
        data: {
          "order": getModel.order,
          "menu": getModel.menu,
        },
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = OrderResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<OrderResModel?> reOrderAdd(id_user.Order getModel) async {
    try {
      List<dynamic> menus = [];
      for (var menu in getModel.menu!) {
        menus.add({
          'id_menu': menu.idMenu,
          'harga': menu.harga,
          'level': 0,
          'topping': menu.topping,
          'jumlah': menu.jumlah
        });
      }
      Response response = await BaseUrl.dio.post(
        BaseUrl.orderAddUrl,
        data: {
          "order": {
            'id_user': CacheManager.getidUser(),
            'id_voucher': 0,
            'potongan': 0,
            'total_bayar': getModel.totalBayar,
          },
          "menu": menus,
        },
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = OrderResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<OrderDetailResModel?> getDetailOrder(int idOrder) async {
    try {
      Response response = await BaseUrl.dio.get(
        "${BaseUrl.orderDetailUrl}$idOrder",
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = OrderDetailResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<id_user.OrderListByIdUserResModel?> getOrderListByUser() async {
    try {
      Response response = await BaseUrl.dio.get(
        "${BaseUrl.orderByUserUrl}${CacheManager.getidUser()}",
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = id_user.OrderListByIdUserResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<OrderHistoryResModel?> getHistoryOrder() async {
    try {
      Response response = await BaseUrl.dio.post(
        "${BaseUrl.orderHistoryUrl}${CacheManager.getidUser()}",
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = OrderHistoryResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
