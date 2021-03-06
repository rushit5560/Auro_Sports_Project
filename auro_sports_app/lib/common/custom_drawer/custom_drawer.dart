import 'package:auro_sports_app/common/common_function.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/common/custom_drawer/drawer_controller.dart';
import 'package:auro_sports_app/screens/blog_screen/blog_screen.dart';
import 'package:auro_sports_app/screens/category_screen/category_screen.dart';
import 'package:auro_sports_app/screens/collection_screen/collection_screen.dart';
import 'package:auro_sports_app/screens/contact_us_screen/contactus_screen.dart';
import 'package:auro_sports_app/screens/index_screen/index_screen.dart';
import 'package:auro_sports_app/screens/notification_screen/notification_screen.dart';
import 'package:auro_sports_app/screens/order_screen/order_screen.dart';
import 'package:auro_sports_app/screens/profile_screen/profile_screen.dart';
import 'package:auro_sports_app/screens/settings_screen/settings_screen.dart';
import 'package:auro_sports_app/screens/signin_screen/signin_screen.dart';
import 'package:auro_sports_app/screens/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';


class CustomDrawer extends StatefulWidget {

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  CustomDrawerController customDrawerController = Get.put(CustomDrawerController());

  @override
  void initState() {
    customDrawerController.getUserDetailsFromPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> customDrawerController.isLoading.value
            ? Center(
        child: CircularProgressIndicator(
          color: CustomColor.kOrangeColor,
          backgroundColor: Colors.grey,
        ),
      )
            : Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        closeButton(),

                        SizedBox(height: 20),
                        profilePicAndName(),
                        SizedBox(height: 20),

                        Container(
                          child: Column(
                            children: [
                              homeButton(),
                              collectionButton(),
                              categoryProfile(),
                              customDrawerController.isLoggedIn.value ? profileButton() : Container(),
                              notificationButton(),
                              settingsButton(),
                              // loginButton(),
                              contactUsButton(),
                              customDrawerController.isLoggedIn.value ? ordersButton() : Container(),
                              customDrawerController.isLoggedIn.value ? wishlistButton() : Container(),
                              blogButton(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              customDrawerController.isLoggedIn.value
                  ? logoutButton()
                  : loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget closeButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(onTap: () {
            Get.back();
          },
              child: Icon(CupertinoIcons.clear,))
        ],
      ),
    );
  }

  Widget profilePicAndName() {
    return Container(
      child: Column(
        children: [
          Container(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: CustomColor.kOrangeColor,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
          Text(
            'Jenny Doe',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
          ),
          // Text(
          //   'jennydoe@gmail.com',
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
          // ),
        ],
      ),
    );
  }

  Widget homeButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => IndexScreen());
      },
      leading: Icon(Icons.home_outlined,/*color: Colors.black,*/),
      title: Text('Home',
        textScaleFactor: 1.2,
        // style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget collectionButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => CollectionScreen());
      },
      leading: Icon(Icons.storefront_outlined,/*color: Colors.black,*/),
      title: Text('Collection',
        textScaleFactor: 1.2,
        // style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget categoryProfile() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => CategoryScreen());
      },
      leading: Icon(Icons.category_outlined,/*color: Colors.black,*/),
      title: Text('Categories',
        textScaleFactor: 1.2,
        // style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget profileButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => ProfileScreen());
      },
      leading: Icon(Icons.person_outline_outlined,/*color: Colors.black,*/),
      title: Text('Profile',
        textScaleFactor: 1.2,
        // style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget notificationButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => NotificationScreen());
      },
      leading: Icon(Icons.notifications_on_outlined,/*color: Colors.black,*/),
      title: Text('Notification',
        textScaleFactor: 1.2,
        // style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget settingsButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => SettingsScreen());
      },
      leading: Icon(Icons.settings_outlined,/*color: Colors.black,*/),
      title: Text('Settings',
        textScaleFactor: 1.2,
        // style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      child: ListTile(
        onTap: () {
          Get.back();
          Get.to(() => SignInScreen());
        },
        leading: Icon(Icons.login_outlined,/*color: Colors.black,*/),
        title: Text('Login',
          textScaleFactor: 1.2,
          // style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget contactUsButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => ContactUsScreen());
      },
      leading: Icon(Icons.contact_phone_outlined,/*color: Colors.black,*/),
      title: Text('Contact Us',
        textScaleFactor: 1.2,
        // style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget ordersButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => OrderScreen());
      },
      leading: Icon(Icons.apps_outlined,/*color: Colors.black,*/),
      title: Text('Orders',
        textScaleFactor: 1.2,
        // style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget wishlistButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => WishListScreen());
      },
      leading: Icon(Icons.list_alt_rounded,/*color: Colors.black,*/),
      title: Text('Wishlist',
        textScaleFactor: 1.2,
        // style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget blogButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => BlogScreen());
      },
      leading: Icon(Icons.post_add_rounded,/*color: Colors.black,*/),
      title: Text('Blogs',
        textScaleFactor: 1.2,
        // style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget logoutButton() {
    return Container(
      child: ListTile(
        onTap: () {
          Get.back();
          // Get.to(() => SignInPage());
          CommonFunctions().clearUserDetailsFromPrefs();
          Get.snackbar('User LogOut Successfully', '');
        },
        leading: Icon(Icons.login_outlined,/*color: Colors.black,*/),
        title: Text('Logout',
          textScaleFactor: 1.2,
          // style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
