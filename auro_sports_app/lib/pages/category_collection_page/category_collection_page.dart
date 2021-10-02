import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/pages/product_detail_page/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_collection_controller.dart';

class CategoryCollectionPage extends StatelessWidget {
  // const CategoryCollectionPage({Key? key}) : super(key: key);

  CategoryCollectionController categoryCollectionController = Get.put(CategoryCollectionController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('${categoryCollectionController.categoryName.toString()}'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),

      body: categoryCollection(),
    );
  }

  Widget categoryCollection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Obx(
            () => categoryCollectionController.isLoading.value
            ? Container(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: CircularProgressIndicator(
              color: CustomColor.kOrangeColor,
              backgroundColor: Colors.grey,
            ),
          ),
        )
            : GridView.builder(
          itemCount: categoryCollectionController.categoryCollectionLists.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print('Product Id : ${categoryCollectionController.categoryCollectionLists[index].id}');
                  Get.to(()=> ProductDetailPage(),
                    transition: Transition.rightToLeft,
                    arguments: categoryCollectionController.categoryCollectionLists[index].id,
                  );

                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColor.kLightOrangeColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '${ApiUrl.MainPath}${categoryCollectionController.categoryCollectionLists[index].showimg}'),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            Positioned(
                              right: 20,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () =>
                                    print('Clicked On Cart Button'),
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.shopping_cart_rounded,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColor.kOrangeColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '${categoryCollectionController.categoryCollectionLists[index].productname}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              '\$${categoryCollectionController.categoryCollectionLists[index].productcost}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '\$${categoryCollectionController.categoryCollectionLists[index].productcost}',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
