import 'package:auro_sports_app/pages/language/localization_service.dart';
import 'package:auro_sports_app/pages/splash_screen/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main(){
  runApp(MyApp());
  /*Get.testMode = true;
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', ''),
        Locale('ar', ''),
        Locale('hi', ''),
        // Locale('id', ''),
        // Locale('zh', ''),
        // Locale('tr', '')
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en', ''),
      child: MyApp()));*/
}

// class MyApp extends StatefulWidget {
//  // const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }

class MyApp extends StatelessWidget {
  // GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //navigatorKey: navigatorKey,
      title: "Auro Sports App",
      debugShowCheckedModeBanner: false,
      // navigatorKey: Get.navigatorKey,

      /*localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ar', ''),
        const Locale('hi', ''),
      ],*/
      /*localizationsDelegates: context.localizationDelegates,
       supportedLocales: context.supportedLocales,
       locale: context.locale,*/
      /*getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
      ],*/
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      home: SplashScreen(),

      darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.white
      ),
    );
  }
}