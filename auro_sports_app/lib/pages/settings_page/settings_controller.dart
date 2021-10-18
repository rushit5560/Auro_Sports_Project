import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsPageController extends GetxController {
  RxBool isDarkMode = false.obs;

  setIsDarkMode(darkModeValue) async {
    print('darkModeValue : $darkModeValue');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isDarkMode');
    bool darkMode = await prefs.setBool('isDarkMode', darkModeValue);
    print('darkMode : $darkMode');
    isDarkMode = darkMode.obs;
    print('setIsDarkMode : $isDarkMode');
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