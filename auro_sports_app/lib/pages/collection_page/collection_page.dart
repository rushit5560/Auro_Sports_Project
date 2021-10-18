import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/pages/collection_page/collection_controller.dart';
import 'package:auro_sports_app/pages/product_detail_page/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionPage extends StatelessWidget {

  CollectionController collectionController = Get.put(CollectionController());

  List<String> tabsList = [
    'SEE ALL', 'BLAZERS', 'DRESSES', 'JACKETS', 'JEANS'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsList.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Collection'),
          centerTitle: true,
          backgroundColor: CustomColor.kOrangeColor,
          elevation: 0,

          // TabBar List
          bottom: tabBarList(),
        ),


        body: TabBarView(
          children: [
            newArrival(),
            newArrival(),
            newArrival(),
            newArrival(),
            newArrival(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget tabBarList() {
    return PreferredSize(
      preferredSize: Size.fromHeight(40.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TabBar(
              tabs: tabsList.map((title) => SizedBox(height: 30,child: Tab(text: title))).toList(),
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              // indicatorColor: Colors.white,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white38,
              ),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget newArrival() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Obx(
        () => collectionController.isLoading.value
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
                itemCount: collectionController.collectionLists.length,
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
                        print('Product id : ${collectionController.collectionLists[index].id}');
                        Get.to(() => ProductDetailPage(),
                          transition: Transition.rightToLeft,
                          arguments: collectionController.collectionLists[index].id,
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
                                                '${ApiUrl.MainPath}${collectionController.collectionLists[index].showimg}'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  /*Positioned(
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
                                  ),*/
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                '${collectionController.collectionLists[index].productname}',
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
                                    '\$${collectionController.collectionLists[index].productcost}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '\$${collectionController.collectionLists[index].productcost}',
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
