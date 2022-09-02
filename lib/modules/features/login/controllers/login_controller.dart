import 'package:get/state_manager.dart';
import 'package:train_venturo/modules/features/login/repository/login_service.dart';
import 'package:train_venturo/modules/models/login_model/login_api_request_model.dart';
import 'package:train_venturo/modules/models/login_model/login_response_model.dart';

class LoginController extends GetxController {
  LoginService loginService = LoginService();

  Future<LoginResModel?> loginApi(LoginApiReqModel getModel) async {
    final response = await loginService.loginAPi(getModel);
    // print(response!.statusCode);
    // print(response.data!.token);
    return response;
  }
}
