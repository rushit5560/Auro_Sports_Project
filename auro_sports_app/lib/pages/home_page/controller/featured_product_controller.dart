import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/featured_product_model.dart';

class FeaturedProductController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Datum1> featuredProductLists = RxList();

  getFeaturedProductData() async{
    isLoading(true);
    String url = ApiUrl.FeaturedProductApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));
      // print('Response1 : ${response.statusCode}');
      // print('Response2 : ${response.body}');

      FeaturedProductData featuredProductData = FeaturedProductData.fromJson(json.decode(response.body));
      isStatus = featuredProductData.success.obs;
      // print('Response Bool : ${featuredProductData.success}');
      // print('isStatus : $isStatus}');

      if(isStatus.value){
        // print('True True');
        featuredProductLists = featuredProductData.data.obs;
      } else {
        print('FeaturedProduct False False');
      }
    } catch(e){
      print('FeaturedProduct Error : $e');
    }

    isLoading(false);
  }

  @override
  void onInit() {
    getFeaturedProductData();
    super.onInit();
  }
}