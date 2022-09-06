import 'package:dio/dio.dart';

class BaseUrl {
  static const _baseUrl = 'https://trainee.landa.id/javacode/';
  static const loginUrl = '${_baseUrl}auth/login';

  static final dio = Dio();
}
