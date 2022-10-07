import 'package:dio/dio.dart';
import 'package:train_venturo/modules/models/voucher_model/voucher_response_model.dart';

import '../../../../constant/core/api_const/base_url_api.dart';
import '../../../../utils/functions/cache_manager.dart';

class VoucherService {
  Future<VoucherResModel?> getAllVoucher() async {
    try {
      Response response = await BaseUrl.dio.get(
        BaseUrl.voucherAllUrl,
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = VoucherResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<VoucherResModel?> getVoucherById() async {
    try {
      Response response = await BaseUrl.dio.get(
        "${BaseUrl.voucherIdUserUrl}${CacheManager.getidUser()}",
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = VoucherResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
