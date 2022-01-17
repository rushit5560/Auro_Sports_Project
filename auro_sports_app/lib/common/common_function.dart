import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class CommonFunctions {
  //static SharedPreferences prefs;
  static const String isReverseTextDir = "isReverseTextDir";

  setUserDetailsInPrefs(id, token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Remove Old Id & Token
    prefs.remove('id');
    prefs.remove('token');

    // Add New Id & Token
    prefs.setBool('userLoggedInStatus', true);
    prefs.setInt('id', id);
    prefs.setString('token', token);

  }

  clearUserDetailsFromPrefs() async {
    print('----------ClearUserDetails Method Call----------');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('userLoggedInStatus', false);
    prefs.remove('id');
    prefs.remove('token');
    print('----------ClearUserDetails Method Finish----------');
  }

  static Future prefGetString1(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   // prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) != null) {
      return prefs.getString(key);
    }
    //prefs.getString(key);
  }

  static Future prefSetString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  hideKeyBoard() {
    FocusManager.instance.primaryFocus!.unfocus();
  }

}
