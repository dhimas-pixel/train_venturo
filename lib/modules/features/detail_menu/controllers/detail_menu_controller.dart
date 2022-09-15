import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:train_venturo/modules/features/detail_menu/repository/detail_menu_service.dart';
import 'package:train_venturo/modules/models/detail_menu_model/detail_menu_response_model.dart'
    as detail_menu;

class DetailMenuController extends GetxController with StateMixin {
  DetailMenuService detailService = DetailMenuService();

  late detail_menu.Data _dataDetailMenu;
  detail_menu.Data get dataDetailMenu => _dataDetailMenu;

  int idMenu = Get.arguments;

  Rx<int> optionLevel = 0.obs;
  Rx<int> optionToping = 0.obs;

  Rx<String> itemLevel = "".obs;
  Rx<String> itemToping = "".obs;

  Future<void> getDetailMenu(int idMenu) async {
    change(null, status: RxStatus.loading());
    try {
      final response = await detailService.getDetailMenu(idMenu);
      _dataDetailMenu = response!.data!;
    } on DioError catch (e) {
      throw Exception(e);
    }
    change(null, status: RxStatus.success());
  }

  void checkOptionLevel(int index) {
    optionLevel.value = index;
    itemLevel.value = _dataDetailMenu.level?[index - 1].keterangan ?? "";
  }

  void checkOptionToping(int index) {
    optionToping.value = index;
    itemToping.value = _dataDetailMenu.topping?[index - 1].keterangan ?? "";
  }

  @override
  void onInit() {
    getDetailMenu(idMenu);
    super.onInit();
  }
}
