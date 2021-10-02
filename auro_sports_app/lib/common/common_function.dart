import 'package:shared_preferences/shared_preferences.dart';



class CommonFunctions {

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

}
