import 'package:flutter/material.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/shared/customs/appbar_primary.dart';
import 'package:train_venturo/shared/customs/card_promo.dart';

class PromoMobileBody extends StatelessWidget {
  final String type, name, nominal;
  const PromoMobileBody({
    Key? key,
    required this.type,
    required this.name,
    required this.nominal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPrimary(
        name: 'Promo',
      ),
      body: SafeArea(
        child: Container(
          height: heightSized(context),
          width: double.infinity,
          color: Colors.transparent,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: SizedBox(
                    width: double.infinity,
                    child: CardPromo(
                      width: double.infinity,
                      height: 185,
                      type: type,
                      name: name,
                      nominal: nominal,
                    ),
                  ),
                ),
                Container(
                  height: heightSized(context),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
