import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../models/change_password_screen_model/change_password_model.dart';

class ChangePasswordPageController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  int? userId;

  RxBool isOldPassObsecure = true.obs;
  RxBool isNewPassObsecure = true.obs;
  RxBool isNewCPassObsecure = true.obs;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController oldPassFieldController = TextEditingController();
  TextEditingController newPassFieldController = TextEditingController();
  TextEditingController newCPassFieldController = TextEditingController();

  getForgotPasswordData(oldPass, newPass, cNewPass) async {
    isLoading(true);
    String url = ApiUrl.ChangePasswordApi;
    print('Url : $url');

    try{
      Map data = {
        "id": "$userId",
        "oldpassword": "$oldPass",
        "password": "$newPass",
        "password_confirmation": "$cNewPass"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);

      ChangePasswordData changePasswordData = ChangePasswordData.fromJson(json.decode(response.body));
      isStatus = changePasswordData.success.obs;

      if(isStatus.value){
        Fluttertoast.showToast(msg: "Password Change Successfully.");
        clearTextFields();
        Get.back();
      } else {
        Fluttertoast.showToast(msg: "${changePasswordData.message}");
      }
    } catch(e) {
      print('Change Pass Error : $e');
    } finally {
      isLoading(false);
    }
  }

  getUserDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id');
    print('UserId Add to Cart : $userId');
  }

  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }

  clearTextFields() {
    oldPassFieldController.clear();
    newPassFieldController.clear();
    newCPassFieldController.clear();
  }


}