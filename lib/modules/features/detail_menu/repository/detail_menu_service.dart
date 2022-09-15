import 'package:dio/dio.dart';
import 'package:train_venturo/modules/models/detail_menu_model/detail_menu_response_model.dart';

import '../../../../constant/core/api_const/base_url_api.dart';
import '../../../../utils/functions/cache_manager.dart';

class DetailMenuService {
  Future<DetailMenuResModel?> getDetailMenu(int idMenu) async {
    try {
      Response response = await BaseUrl.dio.get(
        "${BaseUrl.detailMenuUrl}$idMenu",
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = DetailMenuResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
