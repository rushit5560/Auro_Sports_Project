import 'package:auro_sports_app/common/app_local_key.dart';
import 'package:auro_sports_app/common/custom_color.dart';

import 'settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:auro_sports_app/pages/language/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  SettingsPageController settingsPageController = Get.put(SettingsPageController());

  bool _notificationValue = false;
  bool _smsValue = false;
  bool _emailsValue = false;
  // bool _darkModeValue = false;
  bool _newDealsValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          allowNotification(),
          SizedBox(height: 10),
          allowSms(),
          SizedBox(height: 10),
          allowEmails(),
          SizedBox(height: 10),
          darkMode(),
          SizedBox(height: 10),
          newDeals(),
          SizedBox(height: 10),
          Languages(),
        ],
      ),
    );
  }

  Widget allowNotification() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Allow Notification',
                  style: TextStyle(
                    // color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Switch(
                value: _notificationValue,
                onChanged: (value) {
                  setState(() {
                    _notificationValue = value;
                    print(_notificationValue);
                  });
                },
                activeTrackColor: CustomColor.kLightOrangeColor,
                activeColor: CustomColor.kOrangeColor,
              )
            ],
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  Widget allowSms() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Allow SMS',
                  style: TextStyle(
                    // color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Switch(
                value: _smsValue,
                onChanged: (value) {
                  setState(() {
                    _smsValue = value;
                    print(_smsValue);
                  });
                },
                activeTrackColor: CustomColor.kLightOrangeColor,
                activeColor: CustomColor.kOrangeColor,
              )
            ],
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  Widget allowEmails() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Allow Emails',
                  style: TextStyle(
                    // color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Switch(
                value: _emailsValue,
                onChanged: (value) {
                  setState(() {
                    _emailsValue = value;
                    print(_emailsValue);
                  });
                },
                activeTrackColor: CustomColor.kLightOrangeColor,
                activeColor: CustomColor.kOrangeColor,
              )
            ],
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  Widget darkMode() {
    return Obx(
        ()=> Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Dark Mode',
                    style: TextStyle(
                      // color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Switch(
                  value: settingsPageController.isDarkMode.value,

                  onChanged: (value) {

                    setState(() {
                      settingsPageController.isDarkMode.value = value;
                      settingsPageController.isDarkMode.value
                      ? Get.changeTheme(ThemeData.dark())
                      : Get.changeTheme(ThemeData.light());
                      print(settingsPageController.isDarkMode.value);
                      settingsPageController.setIsDarkMode(value);
                    });

                  },
                  activeTrackColor: CustomColor.kLightOrangeColor,
                  activeColor: CustomColor.kOrangeColor,
                )
              ],
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }

  Widget newDeals() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'New Deals',
                  style: TextStyle(
                    // color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Switch(
                value: _newDealsValue,
                onChanged: (value) {
                  setState(() {
                    _newDealsValue = value;
                    print(_newDealsValue);
                  });
                },
                activeTrackColor: CustomColor.kLightOrangeColor,
                activeColor: CustomColor.kOrangeColor,
              )
            ],
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  Widget Languages() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LanguageScreen(gotoNext: "gotoNext")),
            );
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    getTranslateVal(AppLocalKey.up_lan_language),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),

          ),
        ),
      ),
    );
  }
}
