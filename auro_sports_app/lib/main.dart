import 'package:auro_sports_app/pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Auro Sports App",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white
      ),
    );
  }
}