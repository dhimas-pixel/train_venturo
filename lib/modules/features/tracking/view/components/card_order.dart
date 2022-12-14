import 'package:flutter/material.dart';

import '../../../../../config/themes/color.dart';
import '../../../../../shared/customs/primary_text_style.dart';

class CardOrder extends StatelessWidget {
  final Widget image;
  final String name, cost;
  final int quantity;
  const CardOrder({
    Key? key,
    required this.image,
    required this.name,
    required this.cost,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Container(
                      width: 100,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: image,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryTextStyle(
                        size: 18,
                        content: name,
                      ),
                      PrimaryTextStyle(
                        size: 15,
                        content: "Rp. $cost",
                        color: kSecondaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.edit_note_rounded,
                            color: kSecondaryColor,
                          ),
                          PrimaryTextStyle(
                            size: 12,
                            content: "Catatan",
                            color: kGreyColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 40,
                bottom: 30,
                child: Row(
                  children: [
                    PrimaryTextStyle(
                      size: 15,
                      content: quantity.toString(),
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
