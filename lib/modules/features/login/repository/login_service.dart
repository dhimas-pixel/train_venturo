import 'package:dio/dio.dart';
import 'package:train_venturo/constant/core/api_const/base_url_api.dart';
import 'package:train_venturo/modules/models/login_model/login_api_request_model.dart';
import 'package:train_venturo/modules/models/login_model/login_google_request_model.dart';
import 'package:train_venturo/modules/models/login_model/login_response_model.dart';

class LoginService {
  Future<LoginResModel?> loginAPi(LoginApiReqModel getModel) async {
    try {
      Response response = await BaseUrl.dio.post(
        BaseUrl.loginUrl,
        data: {
          "email": getModel.email,
          "password": getModel.password,
        },
        options: Options(
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = LoginResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<LoginResModel?> loginGoogle(LoginGoogleReqModel getModel) async {
    try {
      Response response = await BaseUrl.dio.post(
        BaseUrl.loginUrl,
        data: {
          "is_google": "is_google",
          "nama": getModel.nama,
          "email": getModel.email,
        },
        options: Options(
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = LoginResModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
