import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/models/cart_screen_model/delete_cart_product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// import 'cart_controller.dart';



class DeleteCartProductController extends GetxController {
  // CartController cartController = Get.put(CartController());
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;

  getDeleteProductCart(cartDetailId) async {
    isLoading(true);
    String url = ApiUrl.DeleteCartProductApi;
    print('Url : $url');


    try{
      Map data = {
        "id": "$cartDetailId"
      };

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Response1 : ${response.statusCode}');
      print('Response1 : ${response.body}');

      DeleteCartProductData deleteCartProductData = DeleteCartProductData.fromJson(json.decode(response.body));
      isStatus = deleteCartProductData.success.obs;
      print('Response Bool : ${deleteCartProductData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        Get.snackbar('Successfully Deleted Cart Item', '');
      } else {
        print('DeleteCartProductData False False');
      }
    } catch(e){
      print('Delete Product From Cart False False');
    }
    isLoading(false);
  }
}