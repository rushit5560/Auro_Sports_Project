import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/pages/collection_page/model/image_attributes_model.dart';
import 'package:get/get.dart';
import 'collection_model.dart';
import 'package:http/http.dart' as http;

import 'model/color_attributes_model.dart';

class CollectionController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  List<Datum> collectionLists = [];
  RxBool isTabClicked = false.obs;
  RxInt isViewSelected = 0.obs;
  RxInt isAttributesSelected = 5.obs;
  RxBool isAttributesValueSelected = false.obs;
  RxInt isTagSelected = 10.obs;

  List<String> tabsList = ['SEE ALL', 'BLAZERS', 'DRESSES', 'JACKETS', 'JEANS'];
  List<String> attributesList = ['COLOR', 'IMAGES', 'HEIGHT', 'SIZE', 'WIDTH'];
  List<String> tagList = ['BLACK', 'FEATURE', 'GRAY', 'RED', 'RIPPED', 'T-SHIRT', 'WHITE'];

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

  getAttributesSelectedValue() {
    isAttributesValueSelected(true);
    isAttributesValueSelected(false);
  }


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