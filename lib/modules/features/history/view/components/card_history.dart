import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/modules/models/order_model/order_list_by_iduser_model.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';

import '../../../../../utils/functions/common_functions.dart';

class CardHistory extends StatelessWidget {
  final Order order;
  CardHistory({
    Key? key,
    required this.order,
  }) : super(key: key);

  final CommonFunctions commonFunctions = CommonFunctions();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: kSecondGreyColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 2,
            color: Colors.grey.withAlpha(70),
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(order.menu?[0].foto ??
                    "${AssetsUrl.imgUrl}ic_no_image.png"),
              ),
              color: kSecondGreyColor,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatusOrder(order),
                      PrimaryTextStyle(
                        size: 12,
                        content: commonFunctions.convertDate(
                            order.tanggal.toString(), 'dd MMM yyyy'),
                        color: kGreyColor,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                  Text(
                    commonFunctions.getListMenuName(order.menu!),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: AssetsUrl.fontMont,
                    ),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PrimaryTextStyle(
                        size: 18,
                        content:
                            commonFunctions.convertToIdr(order.totalBayar, 0),
                        fontWeight: FontWeight.w500,
                        color: kSecondaryColor,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: PrimaryTextStyle(
                          size: 12,
                          content: "(${order.menu?.length ?? 0} menu)",
                          fontWeight: FontWeight.w500,
                          color: kGreyColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildStatusOrder(Order menuHistory) {
    IconData icon;
    String teks;
    Color color;
    if (menuHistory.status == 0) {
      icon = Icons.access_time;
      color = const Color.fromRGBO(255, 172, 1, 1);
      teks = "in_queue".tr;
    } else if (menuHistory.status == 1) {
      icon = Icons.access_time;
      color = const Color.fromRGBO(255, 172, 1, 1);
      teks = "order_prepared".tr;
    } else if (menuHistory.status == 2) {
      icon = Icons.check;
      color = const Color.fromRGBO(0, 156, 72, 1);
      teks = "already_to_pick".tr;
    } else if (menuHistory.status == 3) {
      icon = Icons.check;
      color = const Color.fromRGBO(0, 156, 72, 1);
      teks = "done".tr;
    } else {
      icon = Icons.close;
      color = const Color.fromRGBO(230, 33, 41, 1);
      teks = "canceled".tr;
    }
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 16,
        ),
        Container(
          margin: const EdgeInsets.only(left: 4),
          child: Text(
            teks,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
