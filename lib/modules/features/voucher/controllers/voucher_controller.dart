import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:train_venturo/modules/features/voucher/repository/voucher_service.dart';

import '../../../models/voucher_model/voucher_response_model.dart' as voucher;

class VoucherController extends GetxController with StateMixin {
  static VoucherController get to => Get.find();

  VoucherService voucherService = VoucherService();

  voucher.Data? selectedVoucher;

  final RxList<voucher.Data> _dataVoucher = <voucher.Data>[].obs;
  RxList<voucher.Data> get dataVoucher => _dataVoucher;

  @override
  void onInit() {
    getVoucher();
    super.onInit();
  }

  Future<void> getVoucher() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await voucherService.getVoucherById();
      if (response!.data != null) {
        _dataVoucher.value = response.data!;
      }
    } on DioError {
      _dataVoucher.value = [];
    }
    change(null, status: RxStatus.success());
  }

  setSelectedVoucher(int index) {
    if (_dataVoucher[index].isSelected == true) {
      _dataVoucher[index].isSelected = false;
      selectedVoucher = null;
    } else {
      for (var element in _dataVoucher) {
        element.isSelected = false;
      }
      _dataVoucher[index].isSelected =
          !(_dataVoucher[index].isSelected ?? false);
      selectedVoucher = _dataVoucher[index];
    }
    update();
  }
}
