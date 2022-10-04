import 'package:flutter/material.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/modules/models/voucher_model/voucher_response_model.dart';

class VoucherCard extends StatelessWidget {
  final Function onCheckFunction;
  final Function onImageFunction;
  final Data voucher;
  const VoucherCard({
    Key? key,
    required this.voucher,
    required this.onCheckFunction,
    required this.onImageFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthSized(context),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: kGreyColor,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: kSecondGreyColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              onCheckFunction();
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(voucher.nama ?? ""),
                  voucher.isSelected == true
                      ? const Icon(
                          Icons.check_box_outlined,
                          color: kSecondaryColor,
                        )
                      : const Icon(
                          Icons.check_box_outline_blank_rounded,
                          color: kBlackPrimaryColor,
                        ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onImageFunction();
            },
            child: Container(
                width: widthSized(context),
                height: 175,
                decoration: BoxDecoration(
                    color: kSecondGreyColor,
                    borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    voucher.infoVoucher ?? "",
                    fit: BoxFit.cover,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
