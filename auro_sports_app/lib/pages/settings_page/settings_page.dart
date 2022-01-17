import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/pages/change_password_page/change_password_page.dart';
import 'settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auro_sports_app/pages/language/language_screen.dart';


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
          changePassword(),
          // languages(),
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

                    print('1st Value : $value');

                    setState(() {
                      settingsPageController.isDarkMode.value = value;
                      print('2nd Value : ${settingsPageController.isDarkMode.value}');
                      settingsPageController.isDarkMode.value
                      ? Get.changeTheme(ThemeData.dark())
                      : Get.changeTheme(ThemeData.light());
                      print('3rd Switch Value : ${settingsPageController.isDarkMode.value}');
                      settingsPageController.setIsDarkMode(settingsPageController.isDarkMode.value);
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

  Widget languages() {
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
            padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Languages',
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

  Widget changePassword() {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChangePasswordPage());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
            child: Container(
              width: Get.width,
              child: Text(
                'Change Password',
                // textScaleFactor: 1.3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
