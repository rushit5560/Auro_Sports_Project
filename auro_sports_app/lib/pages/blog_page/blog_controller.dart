import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:get/get.dart';
import 'blog_model.dart';
import 'package:http/http.dart' as http;



class BlogController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Datum> blogDataLists = RxList();

  getBlogData() async {
    isLoading(true);
    String url = ApiUrl.AllBlogsApi;
    print('Url : $url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      // print('Blog Response1 : ${response.statusCode}');
      // print('Blog Response2 : ${response.body}');

      BlogData blogData = BlogData.fromJson(json.decode(response.body));
      isStatus = blogData.success.obs;
      // print('Response Bool : ${blogData.success}');
      // print('isStatus : $isStatus');

      if(isStatus.value){
        print('Blog True True');
        blogDataLists = blogData.data.obs;
        // print(blogDataLists);
      } else {
        print('Blog False False');
      }

    } catch(e){
      print('Blog Error : $e');
    }
    isLoading(false);
  }

  @override
  void onInit() {
    getBlogData();
    super.onInit();
  }
}