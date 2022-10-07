import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:get/get.dart';
import 'package:train_venturo/config/routes/name_routes.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/modules/features/history/view/ui/history_view.dart';
import 'package:badges/badges.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';

import '../../login/controllers/login_controller.dart';
import '../../menu/controllers/menu_controller.dart';
import '../../menu/view/ui/menu_view.dart';
import '../../profile/view/ui/profile_view.dart';
import '../components/icon_navbar_home.dart';

class HomeMobileBody extends StatefulWidget {
  const HomeMobileBody({Key? key}) : super(key: key);

  @override
  State<HomeMobileBody> createState() => _HomeMobileBodyState();
}

class _HomeMobileBodyState extends State<HomeMobileBody> {
  final loginController = Get.find<LoginController>();
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const MenuView(),
    const HistoryView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<MenuController>(
      () => MenuController(),
    );
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 66,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed, // Fixed
            backgroundColor: kBlackSecondaryColor, // <-- This works for fixed
            selectedItemColor: kWhiteColor,
            unselectedItemColor: kGreyColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const IconHomeBar(
                  icon: Icons.home_rounded,
                ),
                label: 'home'.tr,
              ),
              BottomNavigationBarItem(
                icon: const IconHomeBar(
                  icon: Icons.fastfood_rounded,
                ),
                label: 'order'.tr,
              ),
              BottomNavigationBarItem(
                icon: const IconHomeBar(
                  icon: Icons.account_circle_rounded,
                ),
                label: 'profil'.tr,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GetBuilder<MenuController>(
        init: MenuController(),
        builder: (state) {
          return Conditional.single(
            context: context,
            conditionBuilder: (context) => state.newDataCount == 0,
            widgetBuilder: (context) => const SizedBox.shrink(),
            fallbackBuilder: (context) => Badge(
              position: BadgePosition.topEnd(end: 0),
              badgeColor: kWhiteColor,
              borderSide: const BorderSide(
                style: BorderStyle.solid,
                color: kSecondaryColor,
              ),
              badgeContent: PrimaryTextStyle(
                size: 12,
                content: "${state.newDataCount}",
                color: kSecondaryColor,
              ),
              child: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.orderView);
                },
                backgroundColor: kSecondaryColor,
                child: const Icon(
                  Icons.shopping_basket_rounded,
                  size: 30,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
