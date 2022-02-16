import 'dart:convert';
import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/models/product_detail_screen/addproduct_wishlist_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddProductWishlistController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  int? userId;
  RxString? wishListData;


  getAddProductWishlistData(int productId) async{
    isLoading(true);
    String url = ApiUrl.AddProductWishlistApi;
    print('Url : $url');

    try{
      Map data = {
        "id" : "$userId",
        "product_id" : "$productId"
      };

      print('wishlist data : $data');
      http.Response response = await http.post(Uri.parse(url),body: data);
      print('AddWishlist Response1 : ${response.statusCode}');
      print('AddWishlist Response2 : ${response.body}');

      AddProductWishlistData addProductWishlistData = AddProductWishlistData.fromJson(json.decode(response.body));
      isStatus = addProductWishlistData.success.obs;
      print('Response Bool : ${addProductWishlistData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        print('AddWishlist True True');
        wishListData = addProductWishlistData.data.obs;
        Get.snackbar('title', "${wishListData.toString()}");

        if(addProductWishlistData.data.contains('already added in wishlist')){
          Get.snackbar('', 'Product Already Added in Wishlist.');
        } else {
          Get.snackbar('', 'Product Added in Wishlist.');
        }

        // Get.to(() => WishListPage());
      } else {
        print('AddWishlist False False');
      }

    } catch(e) {
      print('Add WishList Error : $e');
    }

    isLoading(false);
  }

  getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id');
  }

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }
}