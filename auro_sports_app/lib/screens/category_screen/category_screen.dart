import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/screens/category_collection_screen/category_collection_screen.dart';
import 'package:auro_sports_app/controllers/category_screen_controller/category_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {

  CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_rounded))
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          categoryListView(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget categoryListView() {
    return Expanded(
      child: Container(
        child: Obx(
          ()=> categoryController.isLoading.value
              ?  Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: CustomColor.kOrangeColor,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  )
              : ListView.builder(
            itemCount: categoryController.categoryLists.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  elevation: 10,
                  child: GestureDetector(
                    onTap: () {
                      print('Category Id : ${categoryController.categoryLists[index].categoryId}');
                      Get.to(() =>
                          CategoryCollectionScreen(),
                          transition: Transition.rightToLeft,
                          arguments: [
                            categoryController.categoryLists[index].categoryId,
                            categoryController.categoryLists[index].categoryName
                          ]
                      );
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                '${ApiUrl.MainPath}${categoryController.categoryLists[index].showimg}'),
                                            fit: BoxFit.cover,
                                          ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        categoryController.categoryLists[index].categoryName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                                Icons.arrow_forward_ios_outlined,
                              color: Colors.black,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
