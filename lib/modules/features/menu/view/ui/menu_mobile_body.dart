import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/modules/features/menu/controllers/menu_controller.dart';
import 'package:train_venturo/modules/features/promo/view/ui/promo_view.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';
import 'package:train_venturo/shared/widgets/scroll_behaviour.dart';
import 'package:train_venturo/shared/widgets/shimmer_effect.dart';

import '../../../../../shared/customs/card_promo.dart';
import '../../../home/components/app_bar_home.dart';

class MenuMobileBody extends StatefulWidget {
  const MenuMobileBody({Key? key}) : super(key: key);

  @override
  State<MenuMobileBody> createState() => _MenuMobileBodyState();
}

class _MenuMobileBodyState extends State<MenuMobileBody> {
  final menuController = Get.put(MenuController());
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      menuController.getPromo();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarHome(),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: SizedBox(
              width: double.infinity,
              height: heightSized(context),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: SizedBox(
                      height: 240,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "${AssetsUrl.svgUrl}ic_voucher.svg",
                                width: 27,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: PrimaryTextStyle(
                                  size: 20,
                                  content: "Promo yang Tersedia",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 158,
                                    child: menuController.obx(
                                      (_) => ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (ctx, i) {
                                          return GestureDetector(
                                            onTap: () => Get.to(
                                              () => PromoView(
                                                type: menuController
                                                        .data[i].type
                                                        ?.toUpperCase() ??
                                                    "Null type",
                                                name: menuController
                                                        .data[i].nama ??
                                                    "Null name",
                                                nominal: menuController
                                                            .data[i].type ==
                                                        'diskon'
                                                    ? "${menuController.data[i].nominal.toString()} %"
                                                    : "Rp. ${menuController.data[i].nominal.toString()}",
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: CardPromo(
                                                width: 282,
                                                height: 158,
                                                type: menuController
                                                        .data[i].type
                                                        ?.toUpperCase() ??
                                                    "Null type",
                                                name: menuController
                                                        .data[i].nama ??
                                                    "Null name",
                                                nominal: menuController
                                                            .data[i].type ==
                                                        'diskon'
                                                    ? "${menuController.data[i].nominal.toString()} %"
                                                    : "Rp. ${menuController.data[i].nominal.toString()}",
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount: menuController.data.length,
                                      ),
                                      onLoading: ShimmerEffect(
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (ctx, i) {
                                            return const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              child: CardPromo(
                                                width: 282,
                                                height: 158,
                                                type: "Load type",
                                                name: "Load name",
                                                nominal: "nominal",
                                              ),
                                            );
                                          },
                                          itemCount: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 4,
                      child: Column(
                        children: [
                          ButtonsTabBar(
                            backgroundColor: kBlackSecondaryColor,
                            unselectedBackgroundColor: kSecondaryColor,
                            unselectedLabelStyle: const TextStyle(
                              color: kWhiteColor,
                              fontSize: 20,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                            ),
                            radius: 30,
                            height: 40,
                            buttonMargin:
                                const EdgeInsets.symmetric(horizontal: 6),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            labelSpacing: 10,
                            tabs: const [
                              Tab(
                                icon: Icon(
                                  Icons.menu_rounded,
                                ),
                                text: "Semua Menu",
                              ),
                              Tab(
                                icon: Icon(Icons.rice_bowl_rounded),
                                text: "Makanan",
                              ),
                              Tab(
                                icon: Icon(Icons.local_drink_rounded),
                                text: "Minuman",
                              ),
                              Tab(
                                icon: Icon(Icons.breakfast_dining),
                                text: "Snack",
                              ),
                            ],
                          ),
                          const Expanded(
                            child: TabBarView(
                              children: <Widget>[
                                Center(
                                  child: Icon(Icons.directions_car),
                                ),
                                Center(
                                  child: Icon(Icons.directions_transit),
                                ),
                                Center(
                                  child: Icon(Icons.directions_bike),
                                ),
                                Center(
                                  child: Icon(Icons.directions_car),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
