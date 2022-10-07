import 'package:dio/dio.dart';
import 'package:train_venturo/modules/models/promo_model/promo_response_model.dart';
import 'package:train_venturo/utils/functions/cache_manager.dart';

import '../../../../constant/core/api_const/base_url_api.dart';

class PromoService {
  Future<PromoResModel?> getPromo() async {
    try {
      Response response = await BaseUrl.dio.get(
        BaseUrl.promoUrl,
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = PromoResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
