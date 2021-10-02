import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/pages/cart_page/cart_page.dart';
import 'package:auro_sports_app/pages/home_page/home_page.dart';
import 'package:auro_sports_app/pages/profile_page/profile_page.dart';
import 'package:auro_sports_app/pages/search_page/search_page.dart';
import 'package:auro_sports_app/pages/wishlist_page/wishlist_page.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 2;

  final tabs = [
    ProfilePage(),
    CartPage(),
    HomePage(),
    SearchPage(),
    WishListPage()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        iconSize: 20,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // print(_currentIndex);
          });
        },

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: '',
              tooltip: 'Profile',
              backgroundColor: CustomColor.kOrangeColor,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: '',
            tooltip: 'Cart',
            backgroundColor: CustomColor.kOrangeColor,
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: '',
              tooltip: 'Home',
              backgroundColor: CustomColor.kOrangeColor),

          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: '',
              tooltip: 'Search',
              backgroundColor: CustomColor.kOrangeColor),

          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined),
              label: '',
              tooltip: 'Wishlist',
              backgroundColor: CustomColor.kOrangeColor),



        ],
      ),
    );
  }
}
