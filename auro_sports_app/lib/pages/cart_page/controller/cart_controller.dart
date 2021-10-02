import 'dart:convert';
import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/pages/cart_page/model/cart_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class CartController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Cartditeil> userCartProductLists = RxList();
  RxInt userCartTotalAmount = 0.obs;
  RxInt userCartId = 0.obs;


  getUserCartData(userId) async {

    isLoading(true);
    String url = ApiUrl.UserCartApi;
    print('Url : $url');
    print('Show User Cart - UserId : $userId');

    try{

      Map data = {
        "user_id" : "$userId"
      };
      print("data : $data");

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Cart Response1 : ${response.statusCode}');
      print('Cart Response2 : ${response.body}');

      UserCartData userCartData = UserCartData.fromJson(json.decode(response.body));
      isStatus = userCartData.success.obs;
      print('Response Bool : ${userCartData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        userCartProductLists.clear();
        print('Cart True True');
        userCartProductLists = userCartData.data.cartditeil.obs;
        userCartTotalAmount = userCartData.data.cart.totalprice.obs;
        userCartId = userCartData.data.cart.cartId.obs;
        print(userCartProductLists);
      } else {
        print('Cart False False');
      }
    } catch(e){
      print('CartController Error : $e');
    }
    isLoading(false);
  }

  getUserDetailsFromPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId1 = prefs.getInt('id');
    print('UserId Add to Cart : $userId1');
    getUserCartData(userId1);
  }

  @override
  void onInit() {
    userCartProductLists.clear();
    userCartTotalAmount = 0.obs;
    print('OnInit : $userCartProductLists');

    getUserDetailsFromPrefs();
    super.onInit();
  }

}