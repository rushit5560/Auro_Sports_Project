import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/cart_screen_model/add_cart_qty.dart';

class AddCartQtyController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;

  getAddProductCartQty(quantity, cartDetailId) async {
    isLoading(true);
    String url = ApiUrl.AddCartQtyApi;
    print('Url : $url');

    try{
      Map data = {
        "qty": "$quantity",
        "cid": "$cartDetailId"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Response1 : ${response.statusCode}');
      print('Response1 : ${response.body}');

      AddCartQtyData addCartQtyData = AddCartQtyData.fromJson(json.decode(response.body));
      isStatus = addCartQtyData.success.obs;
      print('Response Bool : ${addCartQtyData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        Get.snackbar(addCartQtyData.message, '');
      } else {
        print('Add Cart Qty ');
      }

    } catch(e) {
      print('Add Product Cart Error : $e');
    }

    isLoading(false);
  }
}