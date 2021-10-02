import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/pages/address_manager_page/model/user_shipping_address.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'model/user_billing_address.dart';

class UserBillingShippingAddressController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  var userId;

  getUserBillingAddress(address, mobileNumber, email) async {
    isLoading(true);
    String url = ApiUrl.AddUserBillingAddressApi;
    print('Url : $url');

    try{
      Map data = {
        "user_id": "$userId",
        "address": "$address",
        "mobile": "$mobileNumber",
        "email": "$email"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Response1 : ${response.statusCode}');
      print('Response1 : ${response.body}');

      BillingAddressData billingAddressData = BillingAddressData.fromJson(json.decode(response.body));
      isStatus = billingAddressData.success.obs;
      print('Response Bool : ${billingAddressData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        print('User Billing Address True True');
        Get.back();
        Get.snackbar(billingAddressData.message, '');
      } else {
        print('User Billing Address False False');
      }

    } catch(e) {
      print('User Billing Address Error : $e');
    }

    isLoading(false);
  }

  getUserShippingAddress(address, mobileNumber, email) async {
    isLoading(true);
    String url = ApiUrl.AddUserShippingAddressApi;
    print('Url : $url');

    try{
      Map data = {
        "user_id": "$userId",
        "address": "$address",
        "mobile": "$mobileNumber",
        "email": "$email"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Response1 : ${response.statusCode}');
      print('Response1 : ${response.body}');

      ShippingAddressData shippingAddressData = ShippingAddressData.fromJson(json.decode(response.body));
      isStatus = shippingAddressData.success.obs;
      print('Response Bool : ${shippingAddressData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        print('User Shipping Address True True');
        Get.back();
        Get.snackbar(shippingAddressData.message, '');
      } else {
        print('User Shipping Address False False');
      }

    } catch(e) {
      print('User Shipping Address Error : $e');
    }

    isLoading(false);
  }

  getUserDetailsFromPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id');
    print('UserId Add to Cart : $userId');
  }

  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }
}