import 'package:get/get.dart';
import 'package:train_venturo/modules/features/order/repository/order_service.dart';
import 'package:train_venturo/modules/models/order_model.dart/order_detail_response_model.dart'
    as order;

class DetailPesananController extends GetxController with StateMixin {
  OrderService orderService = OrderService();
  DetailPesananController({required this.idOrder});

  int idOrder;

  // OrderDetailResModel? orderDetailResModel;
  order.Data? orderDetail;

  @override
  void onInit() {
    super.onInit();
    getDetailPesanan();
  }

  void getDetailPesanan() async {
    // isLoading = true.obs;
    // update();
    change(null, status: RxStatus.loading());
    final response = await orderService.getDetailOrder(idOrder);

    if (response != null) {
      orderDetail = response.data!;
    }
    change(null, status: RxStatus.success());
    // isLoading = false.obs;
    update();
  }
}
