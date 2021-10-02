import 'dart:convert';
import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/pages/home_page/model/banner_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BannerController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Datum> bannerLists = RxList();

  var activeIndex = 0.obs;


  Future getBannerData() async {
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

    isLoading(false);
  }


  @override
  void onInit() {
    getBannerData();
    super.onInit();
  }

}