import 'package:auro_sports_app/common/custom_color.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationValue = false;
  bool _smsValue = false;
  bool _emailsValue = false;
  bool _darkModeValue = false;
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
                    color: Colors.black,
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
                    color: Colors.black,
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
                    color: Colors.black,
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
                  'Dark Mode',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Switch(
                value: _darkModeValue,
                onChanged: (value) {
                  setState(() {
                    _darkModeValue = value;
                    print(_darkModeValue);
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
                    color: Colors.black,
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
}
