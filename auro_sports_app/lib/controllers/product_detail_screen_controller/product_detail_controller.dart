import 'dart:convert';
import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/models/product_detail_screen/add_review_model.dart';
import 'package:auro_sports_app/models/product_detail_screen/product_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailController extends GetxController {
  int productId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Datum> productDetailLists = RxList();
  var activeIndex = 0.obs;
  var activeColor = 0.obs;
  RxBool viewMoreValue = false.obs;
  RxBool isReview = false.obs;

  final userReviewController = TextEditingController();

  var userId;
  var token;

  getProductDetailData() async {
    isLoading(true);
    String url = ApiUrl.ProductDetailApi;
    print('Url : $url');

    try{
      Map data = {
        "id": "$productId"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Response1 : ${response.statusCode}');
      print('Response2 : ${response.body}');

      ProductDetailsData productDetailsData = ProductDetailsData.fromJson(json.decode(response.body));
      isStatus = productDetailsData.success.obs;
      print('Response Bool : ${productDetailsData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        print('True True');
        productDetailLists = productDetailsData.data.obs;
      } else {
        print('False False');
      }
    } catch (e) {
      print('Error1 : $e');
    }

    isLoading(false);
  }

  getAddProductReview(ratings, comment) async{
    isLoading(true);
    String url = ApiUrl.AddProductReview;
    print('Url : $url');

    try{
      Map data = {
        "userid": "$userId",
        "product_id": "$productId",
        "ratings": "$ratings",
        "comment": "$comment"
      };
      print('data : $data');
      http.Response response = await http.post(Uri.parse(url),body: data);
      print('AddProduct Response1 : ${response.statusCode}');
      print('AddProduct Response2 : ${response.body}');

      ReviewAddData reviewAddData = ReviewAddData.fromJson(json.decode(response.body));
      isStatus = reviewAddData.success.obs;
      print('Response Bool : ${reviewAddData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        print('AddProduct True True');
        Get.snackbar(reviewAddData.message, '');
        userReviewController.clear();
      } else {
        print('AddProduct False False');
      }
    } catch(e){
      print('Add Product Review Error : $e');
    }

    isLoading(false);
  }


  @override
  void onInit() {
    print('Product Detail Controller productId : $productId');
    getProductDetailData();
    getUserDetailFromPrefs();
    super.onInit();
  }

  getUserDetailFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id').toString();
    token = prefs.getString('token');

    print('UserId : $userId & Token : $token');
    // Get.snackbar("UserId", userId);
  }
}