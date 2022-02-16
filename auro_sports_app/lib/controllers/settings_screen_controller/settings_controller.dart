import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsPageController extends GetxController {
  RxBool isDarkMode = false.obs;

  setIsDarkMode(darkModeValue) async {
    print('4th darkModeValue : $darkModeValue');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isDarkMode');
    bool darkMode = await prefs.setBool('isDarkMode', darkModeValue);
    print('5th darkMode : $darkMode');
    isDarkMode = darkMode.obs;
    print('6th setIsDarkMode : $isDarkMode');
  }

  getIsDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool darkMode = prefs.getBool('isDarkMode') ?? false;
    isDarkMode = darkMode.obs;
    print('init isDarkMode : $isDarkMode');
  }

  @override
  void onInit() {
    getIsDarkMode();
    super.onInit();
  }
}