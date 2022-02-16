import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/screens/blog_detail_screen/blog_detail_screen.dart';
import 'package:auro_sports_app/controllers/blog_screen_controller/blog_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class BlogScreen extends StatelessWidget {
  // const BlogPage({Key? key}) : super(key: key);

  BlogController blogController = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: CustomColor.kOrangeColor,
      ),
      body: blogListView(),
    );
  }

  Widget blogListView() {
    return Obx(
      () => blogController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: CustomColor.kOrangeColor,
                backgroundColor: Colors.grey,
              ),
            )
          : ListView.builder(
              itemCount: blogController.blogDataLists.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onTap: () {
                              print('id : ${blogController.blogDataLists[index].id}');
                              Get.to(() => BlogDetailScreen(),
                                arguments: blogController.blogDataLists[index].id,
                              );
                            },
                            child: Image(
                              height: Get.height * 0.23,
                              width: Get.width,
                              image: NetworkImage(
                                  '${ApiUrl.MainPath}${blogController.blogDataLists[index].showimg}'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            blogController.blogDataLists[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Html(
                          data: blogController.blogDataLists[index].content,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
