import 'package:easy_localization/easy_localization.dart';

class AppLocalKey{

  static const up_lan_select_language = "up_lan_select_language";
  static const up_lan_language = "up_lan_language";

}

getTranslateVal(String key) {
  try {
    return key.tr();
  } catch (e, s) {
    return "Error";
  }
}