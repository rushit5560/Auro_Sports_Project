import 'package:auro_sports_app/common/app_local_key.dart';
import 'package:auro_sports_app/common/common_function.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/common/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageScreen extends StatefulWidget {
  String gotoNext;
  LanguageScreen({required this.gotoNext});
  //const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  Language ? lan;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPPreferences.prefGetString1(SharedPPreferences.isReverseTextDir ?? "").then((value) {
          print("value====$value");
      appState.isReverseTextDir = value;
      setState(() {});
      if (appState.isReverseTextDir == "ar") {
        lan = Language.ar;
        print("lan==$lan");
      } else if (appState.isReverseTextDir == "hi") {
        lan = Language.hi;
        print("lan==$lan");
      } else {
        appState.isReverseTextDir = "en";
        lan = Language.en;
        print("lan==$lan");
      }
    });
    print(appState.isReverseTextDir);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslateVal(AppLocalKey.up_lan_language)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 30),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey[800], borderRadius: BorderRadius.circular(5)),

            child: ExpansionTile(
              key: GlobalKey(),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  getTranslateVal(AppLocalKey.up_lan_language),
                    style: TextStyle(color: Colors.grey, fontFamily: "Ubuntu"),
                  ),
                  Text(
                     appState.isReverseTextDir == "en"
                        ? "English"
                        : appState.isReverseTextDir == "ar"
                        ? "عربى"
                    //"Arabic"
                        : appState.isReverseTextDir == "hi"
                        ? "हिंदी"
                    //"Chinese"

                        : getTranslateVal(
                        AppLocalKey.up_lan_select_language),
                    style: TextStyle(color: Colors.white, fontFamily: "Ubuntu"),
                  ),
                ],
              ),
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RadioListTile(
                        title: Text('English'),
                        value: Language.en,
                        groupValue: lan,
                        onChanged: (Language? value) {
                          print("language===$value");
                          lan = value!;
                          context.locale = context.supportedLocales[0];
                          //context.setLocale(context.supportedLocales[0]);
                          widget.gotoNext != null ? null : Navigator.pop(context);
                          SharedPPreferences.prefSetString(
                              SharedPPreferences.isReverseTextDir, "en");
                          appState.isReverseTextDir = "en";
                          print(appState.isReverseTextDir);
                          setState(() {});
                        },
                      ),
                      RadioListTile(
                        title: Text('عربى'),
                        value: Language.ar,
                        groupValue: lan,
                        onChanged: (Language ?value) {
                          print("language===$value");
                          lan = value!;
                          context.locale = context.supportedLocales[1];
                         // context.setLocale(context.supportedLocales[1]);
                          widget.gotoNext != null ? null : Navigator.pop(context);
                          SharedPPreferences.prefSetString(
                              SharedPPreferences.isReverseTextDir, "ar");
                          appState.isReverseTextDir = "ar";
                          print(appState.isReverseTextDir);
                          setState(() {});
                        },
                      ),
                      RadioListTile(
                        title: Text('हिंदी'),
                        value: Language.hi,
                        groupValue: lan,
                        onChanged: (Language ? value) {
                          print("language===$value");
                          lan = value!;
                          context.locale = context.supportedLocales[2];
                         // context.setLocale(context.supportedLocales[2]);
                          widget.gotoNext != null ? null : Navigator.pop(context);
                          SharedPPreferences.prefSetString(
                              SharedPPreferences.isReverseTextDir, "hi");
                          appState.isReverseTextDir = "hi";
                          print(appState.isReverseTextDir);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}

enum Language { en, ar, hi }
