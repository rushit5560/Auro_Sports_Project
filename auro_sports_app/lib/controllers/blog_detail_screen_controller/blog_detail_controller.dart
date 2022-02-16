import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/models/blog_detail_screen_model/blog_detail_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class BlogDetailController extends GetxController {
  int blogId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxString? blogImage;
  RxString? blogTitle;
  RxString? blogContent;


  getBlogDetailData() async{
    print('BlogId : $blogId');
    isLoading(true);
    String url = ApiUrl.BlogDetailApi;
    print('Url : $url');

    try{
      Map data = {
        "id" : "$blogId"
      };
      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Blog Detail Response1 : ${response.statusCode}');
      print('Blog Detail Response2 : ${response.body}');

      BlogDetailsData blogDetailsData = BlogDetailsData.fromJson(json.decode(response.body));
      isStatus = blogDetailsData.success.obs;
      print('Response Bool : ${blogDetailsData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        blogImage = blogDetailsData.data.image.obs;
        blogTitle = blogDetailsData.data.title.obs;
        blogContent = blogDetailsData.data.content.obs;
      } else {
        print('Blog False False');
      }

    } catch(e) {
      print('Blog Detail Error : $e');
    }
    isLoading(false);
  }

  @override
  void onInit() async {
    getBlogDetailData();
    super.onInit();
  }
}