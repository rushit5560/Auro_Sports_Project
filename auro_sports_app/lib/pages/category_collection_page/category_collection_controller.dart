import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/pages/collection_page/model/color_attributes_model.dart';
import 'package:auro_sports_app/pages/collection_page/model/image_attributes_model.dart';
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
  RxBool isClicked = false.obs;
  RxBool isTabClicked = false.obs;
  RxInt isViewSelected = 0.obs;
  RxInt isAttributesSelected = 5.obs;
  RxBool isAttributesValueSelected = false.obs;
  RxInt isTagSelected = 10.obs;

  List<String> tabsList = [
    'SEE ALL', 'BLAZERS', 'DRESSES', 'JACKETS', 'JEANS'
  ];

  List<String> attributesList = ['COLOR', 'IMAGES', 'HEIGHT', 'SIZE', 'WIDTH'];

  List<ColorAttributeModel> colorAttributeList = [
    ColorAttributeModel(value: 'Black1', isChecked: false),
    ColorAttributeModel(value: 'Black2', isChecked: false),
    ColorAttributeModel(value: 'Black3', isChecked: false),
    ColorAttributeModel(value: 'Black4', isChecked: false),
    ColorAttributeModel(value: 'Black5', isChecked: false),
  ];

  List<ImageAttributeModel> imageAttributeList = [
    ImageAttributeModel(value: 'Image1', isChecked: false),
    ImageAttributeModel(value: 'Image2', isChecked: false),
    ImageAttributeModel(value: 'Image3', isChecked: false),
    ImageAttributeModel(value: 'Image4', isChecked: false),
  ];

  List<String> tagList = ['BLACK', 'FEATURE', 'GRAY', 'RED', 'RIPPED', 'T-SHIRT', 'WHITE'];

  getAttributesSelectedValue() {
    isAttributesValueSelected(true);
    isAttributesValueSelected(false);
  }

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