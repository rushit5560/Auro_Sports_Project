import 'package:auro_sports_app/common/common_function.dart';

class AppState {
  static final AppState _singleton = AppState._internal();
 // static CommonFunctions prefs;
  factory AppState() {
    return _singleton;
  }

  AppState._internal();

  String isReverseTextDir = "en";
}