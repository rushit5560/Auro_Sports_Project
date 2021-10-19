import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/pages/product_detail_page/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_collection_controller.dart';

class CategoryCollectionPage extends StatefulWidget {
  // const CategoryCollectionPage({Key? key}) : super(key: key);
  @override
  _CategoryCollectionPageState createState() => _CategoryCollectionPageState();
}

class _CategoryCollectionPageState extends State<CategoryCollectionPage> with SingleTickerProviderStateMixin {
  CategoryCollectionController categoryCollectionController = Get.put(CategoryCollectionController());

  List<String> tabsList = [
    'SEE ALL', 'BLAZERS', 'DRESSES', 'JACKETS', 'JEANS'
  ];

  late AnimationController controller;
  static const header_height = 32.0;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 100), value: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final backPanelHeight = height - header_height;
    final frontPanelHeight = -header_height;

    return RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, backPanelHeight, 0.0, frontPanelHeight),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
  }

  bool get isPanelVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print('Date Selected');
        break;
      case 1:
        print('Featured Selected');
        break;
      case 2:
        print('On Sale Selected');
    }
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsList.length,
      child: Obx(
        ()=> Scaffold(

          appBar: AppBar(
            title: categoryCollectionController.isClicked.value
                ? Text('Filter')
                : Text('${categoryCollectionController.categoryName.toString()}'),
            centerTitle: true,
            backgroundColor: CustomColor.kOrangeColor,
            elevation: 0,

            // TabBar List
            bottom: tabBarList(),

            actions: [
              PopupMenuButton<int>(
                // child: Icon(Icons.arrow_drop_down_circle_rounded),
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context)=> [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.date_range_rounded,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text('Date'),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text('Featured'),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text('On Sale'),
                      ],
                    ),
                  ),
                ],
              ),

              IconButton(
                onPressed: () {
                  categoryCollectionController.isClicked.value =
                  !categoryCollectionController.isClicked.value;
                  controller.fling(velocity: isPanelVisible ? -1.0 : 1.0);
                },
                icon: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: controller.view,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),

          body: LayoutBuilder(
            builder: bothPanels,
          ),
        ),
      ),
    );
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {

    return Container(
      child: Stack(
        children: [
          // BackPanel Module
          backPanelModule(),

          // FrontPanel Module
          frontPanelModule(constraints),
        ],
      ),
    );
  }

  // BackPanel Module
  Widget backPanelModule() {
    return Container(
      color: CustomColor.kOrangeColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'LAYOUTS',
            style: TextStyle(
                color: Colors.white
            ),
          ),

        ],
      ),
    );
  }

  // Front Panel Module
  Widget frontPanelModule(constraints) {
    return PositionedTransition(
      rect: getPanelAnimation(constraints),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  categoryCollection(),
                  categoryCollection(),
                  categoryCollection(),
                  categoryCollection(),
                  categoryCollection(),
                ],
              ),
            ),
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
