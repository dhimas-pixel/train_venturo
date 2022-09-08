import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:train_venturo/modules/features/login/repository/login_service.dart';
import 'package:train_venturo/modules/models/login_model/login_api_request_model.dart';
import 'package:train_venturo/modules/models/login_model/login_google_request_model.dart';
import 'package:train_venturo/modules/models/login_model/login_response_model.dart';

class LoginController extends GetxController with CacheManager {
  LoginService loginService = LoginService();

  final _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  var isObscure = true.obs;

  final isLogged = false.obs;

  Future<LoginResModel?> loginGoogle() async {
    try {
      googleAccount.value = await _googleSignin.signIn();
      final response = await loginService.loginGoogle(LoginGoogleReqModel(
          nama: googleAccount.value!.displayName,
          email: googleAccount.value!.email));
      if (response!.data != null) {
        isLogged.value = true;
        await saveToken(response.data!.token);
      }
      return response;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  // loginGoogle() async {
  //   googleAccount.value = await _googleSignin.signIn();
  //   print(googleAccount.value!.displayName);
  //   // print(googleAccount.value!.email);
  // }

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

  void logOut() async {
    isLogged.value = false;
    removeToken();
    googleAccount.value = await _googleSignin.signOut();
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
