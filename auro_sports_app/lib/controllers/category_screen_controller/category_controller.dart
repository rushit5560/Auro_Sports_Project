import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/models/category_screen_model/category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  List<Datum> categoryLists = [];
  
  getCategoryData() async {
    isLoading(true);
    String url = ApiUrl.CategoryApi;
    print('Url : $url');
    
    try{
      http.Response response = await http.get(Uri.parse(url));
      // print('Response1 : ${response.statusCode}');
      // print('Response2 : ${response.body}');

      CategoryData categoryData = CategoryData.fromJson(json.decode(response.body));
      isStatus = categoryData.success.obs;
      // print('Response Bool : ${categoryData.success}');
      // print('isStatus : $isStatus');

      if(isStatus.value){
        // print('True True');
        categoryLists = categoryData.data;
      } else {
        print('Category False False');
      }
    } catch(e){
      print('Category Error: $e');
    }

    isLoading(false);
  }

  @override
  void onInit() {
    getCategoryData();
    super.onInit();
  }
}