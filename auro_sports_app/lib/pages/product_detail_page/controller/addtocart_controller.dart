import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/pages/product_detail_page/model/addtocart_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddToCartController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  var userId;
  // var token;

  addToCartProduct(int productId) async {
    isLoading(true);
    String url = ApiUrl.AddToCartApi;
    print('Url : $url');
    print('productId : $productId');

    try{
      int productQty = 1;
      Map data = {
        "product_id": "$productId",
        "user_id": "$userId",
        "quantity": "$productQty"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Response1 : ${response.statusCode}');
      print('Response2 : ${response.body}');

      AddToCartData addToCartData = AddToCartData.fromJson(json.decode(response.body));
      isStatus = addToCartData.success.obs;
      print('Response Bool : ${addToCartData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        print('True True');
        Get.snackbar('', 'Product Add in Cart Successfully');
      } else {
        print('False False');
      }

    } catch(e){
      print('Error1 : $e');
    }
    isLoading(false);
  }


  getUserDetailsFromPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id');
    // token = prefs.getString('token');
    print('UserId Add to Cart : $userId');
  }

  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }
}