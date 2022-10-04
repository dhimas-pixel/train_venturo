import 'package:dio/dio.dart';
import 'package:train_venturo/modules/models/profil_model/user_detail_response_model.dart';

import '../../../../constant/core/api_const/base_url_api.dart';
import '../../../../utils/functions/cache_manager.dart';

class ProfilService {
  Future<UserDetailResModel?> getUserDetail() async {
    try {
      Response response = await BaseUrl.dio.get(
        "${BaseUrl.userDetailUrl}${CacheManager.getidUser()}",
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = UserDetailResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<UserDetailResModel?> updateImg(String value) async {
    try {
      Response response = await BaseUrl.dio.post(
        "${BaseUrl.updateImgUrl}${CacheManager.getidUser()}",
        data: {"image": value},
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = UserDetailResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<UserDetailResModel?> updateKTP(String value) async {
    try {
      Response response = await BaseUrl.dio.post(
        "${BaseUrl.updateKTPUrl}${CacheManager.getidUser()}",
        data: {"image": value},
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = UserDetailResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<UserDetailResModel?> updateUserDetail(String key, String value) async {
    try {
      Response response = await BaseUrl.dio.post(
        "${BaseUrl.updateUserUrl}${CacheManager.getidUser()}",
        data: {key: value},
        options: Options(
          headers: {
            'token': CacheManager.getToken(),
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = UserDetailResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
