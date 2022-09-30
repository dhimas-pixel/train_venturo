import 'package:dio/dio.dart';

class BaseUrl {
  static const _baseUrl = 'https://trainee.landa.id/javacode/';
  static const loginUrl = '${_baseUrl}auth/login';
  static const promoUrl = '${_baseUrl}promo/all';
  static const allMenuUrl = '${_baseUrl}menu/all';
  static const kategoriMenuUrl = '${_baseUrl}menu/kategori/';
  static const detailMenuUrl = '${_baseUrl}menu/detail/';
  static const diskonIdUserUrl = '${_baseUrl}diskon/user/';
  static const voucherAllUrl = '${_baseUrl}voucher/all';
  static const voucherIdUserUrl = '${_baseUrl}voucher/user/';
  static const orderAddUrl = '${_baseUrl}order/add';
  static const orderDetailUrl = '${_baseUrl}order/detail/';
  static const orderByUserUrl = '${_baseUrl}order/user/';

  static final dio = Dio();
}
