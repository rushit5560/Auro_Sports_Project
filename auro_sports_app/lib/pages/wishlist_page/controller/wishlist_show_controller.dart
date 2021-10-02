import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/wishlist_model.dart';


class WishlistShowController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Datum> userWishLists = RxList();



  getUserWishlistData(userId) async {
    isLoading(true);
    String url = ApiUrl.UserWishListApi;
    print('Url : $url');

    try{
      Map data = {
        "id" : "$userId"
      };
      http.Response response = await http.post(Uri.parse(url),body: data);
      print('User Wishlist Response1 : ${response.statusCode}');
      print('User Wishlist Response2 : ${response.body}');

      UserWishlistData userWishlistData = UserWishlistData.fromJson(json.decode(response.body));
      isStatus = userWishlistData.success.obs;
      print('Response Bool : ${userWishlistData.success}');
      print('isStatus : $isStatus}');

      if(isStatus.value){
        print('User Wishlist True');
        userWishLists = userWishlistData.data.obs;
      } else {
        print('User WishList False');
      }

    } catch(e){
      print('User Wishlist Error : $e');
    }
    isLoading(false);
  }



  getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('id');
    getUserWishlistData(userId);
  }

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }


}