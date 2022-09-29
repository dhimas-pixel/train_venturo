import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/modules/features/order/controller/order_controller.dart';
import 'package:train_venturo/modules/features/voucher/controllers/voucher_controller.dart';
import 'package:train_venturo/modules/features/voucher/view/components/voucher_card.dart';
import 'package:train_venturo/modules/features/voucher/view/ui/detail_voucher_view.dart';
import 'package:train_venturo/shared/customs/appbar_primary.dart';
import 'package:train_venturo/shared/widgets/shimmer_effect.dart';

class VoucherView extends GetView<VoucherController> {
  const VoucherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        name: "Pilih Voucher",
        back: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: controller.obx(
          (_) => Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView.builder(
                  itemCount: controller.dataVoucher.length,
                  itemBuilder: (context, index) {
                    return VoucherCard(
                      onCheckFunction: () {
                        controller.setSelectedVoucher(index);
                      },
                      onImageFunction: () {
                        // value.getDetailVoucher(index);
                        Get.to(
                          () => DetailVoucherView(
                            imgUrl:
                                controller.dataVoucher[index].infoVoucher ?? "",
                            name: controller.dataVoucher[index].nama ?? "",
                            desc: controller.dataVoucher[index].catatan ?? "",
                            firstDate:
                                controller.dataVoucher[index].periodeMulai ??
                                    "",
                            lastDate:
                                controller.dataVoucher[index].periodeSelesai ??
                                    "",
                          ),
                          arguments: index,
                        );
                      },
                      voucher: controller.dataVoucher[index],
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: widthSized(context),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.check_circle_outline_rounded,
                                color: kSecondaryColor,
                                size: 12,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text.rich(
                                TextSpan(
                                  text:
                                      'Pengunaan voucher tidak dapat digabung dengan',
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text:
                                          '\ndiscount employee reward program',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kSecondaryColor,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              OrderController.to.selectedVoucher =
                                  controller.selectedVoucher;
                              OrderController.to.update();
                              OrderController.to.totalHarga();
                              Get.back();
                            },
                            child: Container(
                              width: widthSized(context),
                              height: 42,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: kSecondaryColor,
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "Oke",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          onLoading: ShimmerEffect(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Container(
                    width: widthSized(context),
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                ),
                itemCount: 4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
