import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/pages/blog_detail_page/blog_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogDetailPage extends StatelessWidget {
  // const BlogDetailPage({Key? key}) : super(key: key);
  BlogDetailController blogDetailController = Get.put(BlogDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Blog Details'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: CustomColor.kOrangeColor,
      ),

      body: blogDetailView(),
    );
  }

  Widget blogDetailView() {
    return Obx(
      ()=> blogDetailController.isLoading.value
          ? Center(
        child: CircularProgressIndicator(
          color: CustomColor.kOrangeColor,
          backgroundColor: Colors.grey,
        ),
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * 0.25,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    '${ApiUrl.MainPath}${blogDetailController.blogImage}',
                ),
                fit: BoxFit.fill
              ),
            ),
          ),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              blogDetailController.blogTitle!.value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
                blogDetailController.blogContent!.value
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
