import 'package:auro_sports_app/common/image_url.dart';
import 'package:auro_sports_app/controllers/splash_screen_controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {

  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        ImageUrl.splash_img,
        // height: double.infinity,
        fit: BoxFit.cover,
        height: Get.height,
      ),
    );
  }
}
