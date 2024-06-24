import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/src/screens/home_screen/screens/home_page.dart';
import 'package:stylish_ecommerce_app/src/screens/setting_screen/settings_page.dart';
import 'package:stylish_ecommerce_app/src/screens/wishlist_screen/screens/wishlist_page.dart';

import '../../screens/basket_screen/screens/basket_page.dart';

class HomeScreenBottomNavigationBar extends StatefulWidget {
  const HomeScreenBottomNavigationBar({super.key});

  @override
  State<HomeScreenBottomNavigationBar> createState() =>
      _HomeScreenBottomNavigationBarState();
}

class _HomeScreenBottomNavigationBarState
    extends State<HomeScreenBottomNavigationBar> {
  List<Widget> pages = [
    HomePage(),
    const WishlistPage(),
    const BasketPage(),
    const SettingsPage(),
  ];
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: _onTabTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: themeData.primaryColor,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),  label: "Home",),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "WishList"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
