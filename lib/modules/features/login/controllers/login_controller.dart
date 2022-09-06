import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:train_venturo/modules/features/login/repository/login_service.dart';
import 'package:train_venturo/modules/models/login_model/login_api_request_model.dart';
import 'package:train_venturo/modules/models/login_model/login_response_model.dart';

class LoginController extends GetxController with CacheManager {
  LoginService loginService = LoginService();

  var isObscure = true.obs;

  final isLogged = false.obs;

  Future<LoginResModel?> loginApi(LoginApiReqModel getModel) async {
    try {
      final response = await loginService.loginAPi(getModel);
      if (response!.data != null) {
        isLogged.value = true;
        await saveToken(response.data!.token);
      }
      return response;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<void> checkLoginStatus() async {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }

  void logOut() {
    isLogged.value = false;
    removeToken();
  }
}

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.token.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.token.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.erase();
  }
}

enum CacheManagerKey { token }
