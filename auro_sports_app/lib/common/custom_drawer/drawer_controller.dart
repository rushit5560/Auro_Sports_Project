import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawerController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;


  getUserDetailsFromPrefs() async{
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLoggedIn1 = prefs.getBool('userLoggedInStatus') ?? false;
    isLoggedIn = isLoggedIn1.obs;
    isLoading(false);
  }

  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }
}