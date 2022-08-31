import 'package:flutter/material.dart';
import 'package:train_venturo/config/themes/color.dart';

import '../../menu/view/ui/menu_view.dart';
import '../components/app_bar_home.dart';
import '../components/icon_navbar_home.dart';

class HomeMobileBody extends StatefulWidget {
  const HomeMobileBody({Key? key}) : super(key: key);

  @override
  State<HomeMobileBody> createState() => _HomeMobileBodyState();
}

class _HomeMobileBodyState extends State<HomeMobileBody> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ManuView(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarHome(),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
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
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: IconHomeBar(
                    icon: Icons.home_rounded,
                  ),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: IconHomeBar(
                    icon: Icons.fastfood_rounded,
                  ),
                  label: 'Pesanan',
                ),
                BottomNavigationBarItem(
                  icon: IconHomeBar(
                    icon: Icons.account_circle_rounded,
                  ),
                  label: 'Profil',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
