import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'category_collection_model.dart';

class CategoryCollectionController extends GetxController {
  // var categoryId;
  // CategoryCollectionController(this.categoryId);

  int categoryId = Get.arguments[0];
  String categoryName = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  List<Datum> categoryCollectionLists = [];

  getCategoryCollectionData() async {
    isLoading(true);
    String url = ApiUrl.CategoryCollectionApi;
    print('url : $url');

    try{
      Map data = {
        "id": "$categoryId"
      };

      http.Response response = await http.post(Uri.parse(url), body: data);
      // print('Response1 : ${response.statusCode}');
      // print('Response1 : ${response.body}');

      CategoryCollectionData categoryCollectionData = CategoryCollectionData.fromJson(json.decode(response.body));
      isStatus = categoryCollectionData.success.obs;
      // print('Response Bool : ${categoryCollectionData.success}');
      // print('isStatus : $isStatus');

      if(isStatus.value){
        // print('True True');
        categoryCollectionLists = categoryCollectionData.data;
      } else {
        print('CategoryCollection False False');
      }
    } catch(e) {
      print('CategoryCollection Error : $e');
    }

    isLoading(false);
  }

  @override
  void onInit() {
    print('Category Controller -> Category Id : $categoryId');
    print('Category Controller -> Category Name : $categoryName');
    getCategoryCollectionData();
    super.onInit();
  }
}