import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:get/get.dart';
import 'collection_model.dart';
import 'package:http/http.dart' as http;

class CollectionController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  List<Datum> collectionLists = [];
  RxBool isClicked = false.obs;


  getCollectionData() async {
    isLoading(true);
    String url = ApiUrl.ProductApi;
    print('Url : $url');
    try{
      http.Response response = await http.get(Uri.parse(url));
      // print('Response1 : ${response.statusCode}');
      // print('Response2 : ${response.body}');

      ProductData productData = ProductData.fromJson(json.decode(response.body));
      isStatus = productData.success.obs;
      // print('Response Bool : ${productData.success}');
      // print('isStatus : $isStatus');

      if(isStatus.value){
        // print('True True');
        collectionLists = productData.data;
      } else {
        print('Product Details False False');
      }
    } catch(e) {
      print('Product Details Error : $e');
    }

    isLoading(false);
  }

  @override
  void onInit() {
    getCollectionData();
    super.onInit();
  }
}