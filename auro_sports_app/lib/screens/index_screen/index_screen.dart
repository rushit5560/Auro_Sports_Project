import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/screens/cart_screen/cart_screen.dart';
import 'package:auro_sports_app/screens/home_screen/home_screen.dart';
import 'package:auro_sports_app/screens/profile_screen/profile_screen.dart';
import 'package:auro_sports_app/screens/search_screen/search_screen.dart';
import 'package:auro_sports_app/screens/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _currentIndex = 2;

  final tabs = [
    ProfileScreen(),
    CartScreen(),
    HomeScreen(),
    SearchScreen(),
    WishListScreen()
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
