import 'dart:convert';
import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/pages/home_page/model/featured_product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'model/banner_model.dart';
import 'model/testimonial_model.dart';


class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Datum> bannerLists = RxList();
  RxList<Data> testimonialLists = RxList();
  RxList<Datum1> featuredProductLists = RxList();
  var activeIndex = 0.obs;


  getBannerData() async {
    isLoading(true);
    String url = ApiUrl.BannerApi;
    print('Url : $url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      // print('Response1 : ${response.statusCode}');
      // print('Response2 : ${response.body}');

      BannerData bannerList = BannerData.fromJson(json.decode(response.body));
      isStatus = bannerList.success.obs;
      // print('Response Bool : ${bannerList.success}');
      // print('isStatus : $isStatus');

      if(isStatus.value){
        bannerLists = bannerList.data.obs;

      } else {
        print('Banner False False');
      }
    } catch (e){
      print('Banner Error : $e');
    }

    // New Line Added
    getTestimonialData();

    // isLoading(false);
  }


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

    // New Line Added
    getFeaturedProductData();

    // isLoading(false);
  }


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
    getBannerData();
    // getTestimonialData();
    // getFeaturedProductData();
    super.onInit();
  }
}