import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/pages/wishlist_page/model/delete_wishlist_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class DeleteWishlistController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxString? deleteMsg;

  getDeleteWishlistData(String wishListId) async{
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
      } else {
        print('Delete Wishlist False');
      }

    } catch(e){
      print('Delete Wishlist Error : $e');
    }
    isLoading(false);
  }
}