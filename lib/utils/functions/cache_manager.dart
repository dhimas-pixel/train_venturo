import 'package:get_storage/get_storage.dart';

class CacheManager {
  static Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.token.toString(), token);
    return true;
  }

  static String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.token.toString());
  }

  static Future<void> removeToken() async {
    final box = GetStorage();
    await box.erase();
  }
}

enum CacheManagerKey { token }
