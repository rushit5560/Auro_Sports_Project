import 'package:shared_preferences/shared_preferences.dart';

class SharedPPreferences{
  //static SharedPreferences? prefs;
  static const String isReverseTextDir = "isReverseTextDir";

  static Future prefGetString1(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) != null) {
      return prefs.getString(SharedPPreferences.isReverseTextDir);
    }
  }

  static Future prefSetString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}