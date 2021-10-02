import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'model/delete_wishlist_model.dart';
import 'model/wishlist_model.dart';

class WishListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Datum> userWishLists = RxList();
  RxString? deleteMsg;
  String? userId1;


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
        print('User Wish list New Length: ${userWishLists.length}');
      } else {
        print('User WishList False');
      }

    } catch(e){
      print('User Wishlist Error : $e');
    }
    isLoading(false);
  }

  getDeleteWishlistData(wishListId) async{
    isLoading(true);
    String url = ApiUrl.DeleteWishListApi;
    print('Url : $url');

    try{
      Map data = {
        "delId" : "$wishListId"
      };

      http.Response response = await http.post(Uri.parse(url), body: data);
      print('Delete Wishlist Response1 : ${response.statusCode}');
      print('Delete Wishlist Response2 " ${response.body}');

      DeleteWishlistData deleteWishlistData = DeleteWishlistData.fromJson(json.decode(response.body));
      isStatus = deleteWishlistData.success.obs;
      print('Response Bool : ${deleteWishlistData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        print('Delete Wishlist True');
        deleteMsg = deleteWishlistData.message.obs;

        userWishLists.clear();
        print('User Wish list Delete Length: ${userWishLists.length}');

        // await getUserWishlistData(userId1);
        await getUserDetails();
      } else {
        print('Delete Wishlist False');
      }

    } catch(e){
      print('Delete Wishlist Error : $e');
    }
    isLoading(false);
  }


  getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('id');
    await getUserWishlistData(userId);
  }

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }
}