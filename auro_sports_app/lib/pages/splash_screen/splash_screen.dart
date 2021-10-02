import 'package:auro_sports_app/pages/splash_screen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {

  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    print('Splash Screen On');
    return Scaffold(
      body: Image.asset(
        'assets/images/splash.jpg',
        // height: double.infinity,
        fit: BoxFit.cover,
        height: Get.height,
      ),
    );
  }
}
