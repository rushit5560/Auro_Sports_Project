import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'model/user_all_address.dart';

class UserAllAddressController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  var billingAddress;
  var billingPhone;
  var billingEmail;

  var shippingAddress;
  var shippingPhone;
  var shippingEmail;


  getUserAllAddress(userId) async{
    isLoading(true);
    String url = ApiUrl.UserAllAddressApi;
    print('Url : $url');

    try{
      Map data = {
        "user_id": "$userId"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Response1 : ${response.statusCode}');
      print('Response1 : ${response.body}');

      UserAllAddressData userAllAddressData = UserAllAddressData.fromJson(json.decode(response.body));
      isStatus = userAllAddressData.success.obs;
      print('Response Bool : ${userAllAddressData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        billingAddress = userAllAddressData.data.billinginfo.address;
        billingPhone = userAllAddressData.data.billinginfo.mobile;
        billingEmail = userAllAddressData.data.billinginfo.email;

        shippingAddress = userAllAddressData.data.shippinginfo.address;
        shippingPhone = userAllAddressData.data.shippinginfo.mobile;
        shippingEmail = userAllAddressData.data.shippinginfo.email;
        print('User All Address True True');
      } else {
        print('User All Address False False');
      }
    } catch(e) {
      print('User All Address Error : $e');
    }
    isLoading(false);
  }

  getUserDetailsFromPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('id');
    print('UserId Add to Cart : $userId');
    getUserAllAddress(userId);
  }

  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }

}