import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:train_venturo/modules/features/login/repository/login_service.dart';
import 'package:train_venturo/modules/models/login_model/login_api_request_model.dart';
import 'package:train_venturo/modules/models/login_model/login_google_request_model.dart';
import 'package:train_venturo/modules/models/login_model/login_response_model.dart';
import 'package:train_venturo/utils/functions/cache_manager.dart';

class LoginController extends GetxController {
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
        await CacheManager.saveToken(response.data!.token);
        await CacheManager.saveId(response.data!.user!.idUser);
      }
      return response;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<LoginResModel?> loginApi(LoginApiReqModel getModel) async {
    try {
      final response = await loginService.loginAPi(getModel);
      if (response!.data != null) {
        isLogged.value = true;
        await CacheManager.saveToken(response.data!.token);
        await CacheManager.saveId(response.data!.user!.idUser);
      }
      return response;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<void> checkLoginStatus() async {
    final token = CacheManager.getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }

  void logOut() async {
    isLogged.value = false;
    CacheManager.removeToken();
    googleAccount.value = await _googleSignin.signOut();
  }
}
