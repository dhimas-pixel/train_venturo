import 'package:dio/dio.dart';

class BaseUrl {
  static const _baseUrl = 'https://trainee.landa.id/javacode/';
  static const loginUrl = '${_baseUrl}auth/login';
  static const promoUrl = '${_baseUrl}promo/all';
  static const allMenuUrl = '${_baseUrl}menu/all';
  static const kategoriMenuUrl = '${_baseUrl}menu/kategori/';

  static final dio = Dio();
}
