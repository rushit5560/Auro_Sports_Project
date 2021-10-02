import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/testimonial_model.dart';
class TestimonialController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Data> testimonialLists = RxList();



  getTestimonialData() async {
    isLoading(true);
    String url = ApiUrl.TestimonialApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));
      // print('Response1 : ${response.statusCode}');
      // print('Testimonial Response2 : ${response.body}');

      TestimonialData testimonialData = TestimonialData.fromJson(json.decode(response.body));
      isStatus = testimonialData.success.obs;
      // print('Response Bool : ${testimonialData.success}');
      // print('isStatus : $isStatus');

      if(isStatus.value){
        // print('True True');
        testimonialLists = testimonialData.data.obs;

      } else {
        print('Testimonial False False');
      }
    } catch(e) {
      print('Testimonial Error : $e');
    }

    isLoading(false);
  }

  @override
  void onInit() {
    getTestimonialData();
    super.onInit();
  }
}