import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsPageController extends GetxController {
  RxBool isDarkMode = false.obs;


  setIsDarkMode(darkModeValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool darkMode = await prefs.setBool('isDarkMode', darkModeValue);
    isDarkMode = darkMode.obs;
  }

  getIsDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool darkMode = prefs.getBool('isDarkMode') ?? false;
    isDarkMode = darkMode.obs;
    print('isDarkMode : $isDarkMode');
  }

  @override
  void onInit() {
    getIsDarkMode();
    super.onInit();
  }
}