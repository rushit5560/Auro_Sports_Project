import 'dart:async';
import 'package:auro_sports_app/pages/index_page/index_page.dart';
import 'package:auro_sports_app/pages/onboarding_page/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  bool? onBoardingValue = false;
  BuildContext? context;

  @override
  void onInit() {
    super.onInit();
    print('Splash Controller Init Method');
    Timer(Duration(seconds: 3), () => getOnBoardingValue());
  }

  getOnBoardingValue() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    onBoardingValue = prefs.getBool("onboarding");
    print('Value : $onBoardingValue');

    if(onBoardingValue == true) {
      getUserDetails();
      Get.off(() => IndexPage());
      // Navigator.push(context!, MaterialPageRoute(builder: (context) => IndexPage()));
    }
    else/* if(onBoardingValue == false) */{
      Get.off(() => OnBoardingPage());
      // Navigator.push(context!, MaterialPageRoute(builder: (context) => OnBoardingPage()));
    }
  }

  // After Login & Register Get User Details
  getUserDetails() async{
    // print('----------Get userDetails Methods----------');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('id');
    var token = prefs.getString('token');
    // print('id : $id \ntoken : $token');
  }
}
