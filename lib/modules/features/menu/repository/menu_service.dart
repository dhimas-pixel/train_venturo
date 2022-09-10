import 'package:dio/dio.dart';
import 'package:train_venturo/modules/models/menu_model.dart/menu_response_model.dart';

import '../../../../constant/core/api_const/base_url_api.dart';
import '../../../../utils/functions/cache_manager.dart';

class MenuService {
  Future<MenuResModel?> getAllMenu() async {
    try {
      Response response = await BaseUrl.dio.get(
        BaseUrl.allMenuUrl,
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = MenuResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<MenuResModel?> getMenuCategory(String category) async {
    try {
      Response response = await BaseUrl.dio.get(
        "${BaseUrl.kategoriMenuUrl}$category",
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = MenuResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
