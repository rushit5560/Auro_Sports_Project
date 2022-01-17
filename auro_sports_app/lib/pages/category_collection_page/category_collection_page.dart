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
      length: categoryCollectionController.tabsList.length,
      child: Obx(
        ()=> Scaffold(

          appBar: AppBar(
            title: categoryCollectionController.isClicked.value
                ? Text('Filter')
                : Text('${categoryCollectionController.categoryName.toString()}'),
            centerTitle: true,
            backgroundColor: CustomColor.kOrangeColor,
            elevation: 0,

            leading: categoryCollectionController.isTabClicked.value ? Container() : null,

            // TabBar List
            bottom: categoryCollectionController.isTabClicked.value
                    ? tabBarHide()
                    : tabBarList(),

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
                  categoryCollectionController.isTabClicked.value =
                  !categoryCollectionController.isTabClicked.value;
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

  RangeValues _currentRangeValues = const RangeValues(0, 8000);


  // BackPanel Module
  Widget backPanelModule() {
    return categoryCollectionController.isTabClicked.value
        ? Container(
            color: CustomColor.kOrangeColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  // Layouts Module
                  Text(
                    'LAYOUTS',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 30,
                    child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: GestureDetector(
                            onTap: () {
                              categoryCollectionController.isViewSelected.value = index;
                              print(
                                  '${categoryCollectionController.isViewSelected.value}');
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Obx(
                                    () => Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: categoryCollectionController
                                        .isViewSelected.value ==
                                        index
                                        ? Colors.black
                                        : CustomColor.kLightOrangeColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),

                  // Price Module
                  Text(
                    'BY PRICE',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$ ${_currentRangeValues.start}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '\$ ${_currentRangeValues.end}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  RangeSlider(
                    values: _currentRangeValues,
                    min: 0,
                    max: 8000,
                    divisions: 10,
                    inactiveColor: Colors.white54,
                    activeColor: Colors.white,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues value) {
                      setState(() {
                        _currentRangeValues = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),

                  // Attributes Module
                  Text(
                    'ATTRIBUTES',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 30,
                    child: ListView.builder(
                      itemCount: categoryCollectionController.attributesList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: GestureDetector(
                            onTap: () {
                              print('$index');
                              categoryCollectionController.isAttributesSelected.value =
                                  index;
                            },
                            child: Obx(
                                  () => Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: categoryCollectionController
                                      .isAttributesSelected.value ==
                                      index
                                      ? CustomColor.kOrangeColor
                                      : CustomColor.kLightOrangeColor,
                                ),
                                child: Text(
                                  '${categoryCollectionController.attributesList[index]}',
                                  style: TextStyle(
                                      color: categoryCollectionController
                                          .isAttributesSelected.value ==
                                          index
                                          ? Colors.white
                                          : null,
                                      fontWeight: categoryCollectionController
                                          .isAttributesSelected.value ==
                                          index
                                          ? FontWeight.bold
                                          : null),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Obx(
                        () => Container(
                      child: categoryCollectionController.isAttributesSelected.value == 0
                          ? colorAttributes()
                          : categoryCollectionController.isAttributesSelected.value == 1
                          ? imagesAttributes()
                          : categoryCollectionController.isAttributesSelected.value == 2
                          ? colorAttributes()
                          : categoryCollectionController.isAttributesSelected.value == 3
                          ? colorAttributes()
                          : categoryCollectionController.isAttributesSelected.value == 4
                          ? colorAttributes()
                          : Container(),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Tag Module
                  Text(
                    'BY TAG',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 30,
                    child: ListView.builder(
                      itemCount: categoryCollectionController.tagList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: GestureDetector(
                            onTap: () {
                              categoryCollectionController.isTagSelected.value =
                                  index;
                            },
                            child: Obx(
                                  ()=> Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: categoryCollectionController
                                      .isTagSelected.value ==
                                      index
                                      ? CustomColor.kOrangeColor
                                      : CustomColor.kLightOrangeColor,
                                ),
                                child: Text(
                                  '${categoryCollectionController.tagList[index]}',
                                  style: TextStyle(
                                      color: categoryCollectionController
                                          .isTagSelected.value ==
                                          index
                                          ? Colors.white
                                          : null,
                                      fontWeight: categoryCollectionController
                                          .isTagSelected.value ==
                                          index
                                          ? FontWeight.bold
                                          : null
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 20),
                  // Apply Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        print('Apply');
                        print('Start : ${_currentRangeValues.start}');
                        print('End : ${_currentRangeValues.end}');

                        categoryCollectionController.isTabClicked.value =
                        !categoryCollectionController.isTabClicked.value;

                        controller.fling(velocity: isPanelVisible ? -1.0 : 1.0);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: CustomColor.kLightOrangeColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'APPLY',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )
        : Container(color: CustomColor.kOrangeColor);
  }

  // Color Attributes Module
  Widget colorAttributes() {
    return Obx(
          ()=> Container(
        height: 30,
        child: categoryCollectionController.isAttributesValueSelected.value
            ? Container()
            : ListView.builder(
          itemCount: categoryCollectionController.colorAttributeList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3),
              child: GestureDetector(
                onTap: () {
                  categoryCollectionController.colorAttributeList[index].isChecked =
                  !categoryCollectionController.colorAttributeList[index].isChecked;
                  categoryCollectionController.getAttributesSelectedValue();
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: categoryCollectionController.colorAttributeList[index].isChecked
                        ? Colors.grey.shade300
                        : CustomColor.kLightOrangeColor,
                  ),
                  child: Text('${categoryCollectionController.colorAttributeList[index].value}'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Image Attributes Module
  Widget imagesAttributes() {
    return Obx(
          ()=> Container(
        height: 30,
        child: categoryCollectionController.isAttributesValueSelected.value
            ? Container()
            : ListView.builder(
          itemCount: categoryCollectionController.imageAttributeList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3),
              child: GestureDetector(
                onTap: () {
                  categoryCollectionController.imageAttributeList[index].isChecked =
                  !categoryCollectionController.imageAttributeList[index].isChecked;
                  categoryCollectionController.getAttributesSelectedValue();
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: categoryCollectionController.imageAttributeList[index].isChecked
                        ? Colors.grey.shade300
                        : CustomColor.kLightOrangeColor,
                  ),
                  child: Text('${categoryCollectionController.imageAttributeList[index].value}'),
                ),
              ),
            );
          },
        ),
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
              tabs: categoryCollectionController.tabsList.map((title) => SizedBox(height: 30,child: Tab(text: title))).toList(),
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

  PreferredSizeWidget tabBarHide() {
    return PreferredSize(
      preferredSize: Size.fromHeight(0.0),
      child: Container(),
    );
  }

  Widget categoryCollection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            : categoryCollectionController.isViewSelected.value == 0
              ? twoLineGridViewModule()
              : categoryCollectionController.isViewSelected.value == 1
                ? threeLineGridViewModule()
                : categoryCollectionController.isViewSelected.value == 2
                  ? singleLineGridViewModule()
                  : categoryCollectionController.isViewSelected.value == 3
                    ? listViewModule()
                    : twoLineGridViewModule(),
      ),
    );
  }

  Widget twoLineGridViewModule() {
    return GridView.builder(
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
                        // Positioned(
                        //   right: 20,
                        //   bottom: 0,
                        //   child: GestureDetector(
                        //     onTap: () =>
                        //         print('Clicked On Cart Button'),
                        //     child: Container(
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(5),
                        //         child: Icon(
                        //           Icons.shopping_cart_rounded,
                        //           size: 20,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //       decoration: BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         color: CustomColor.kOrangeColor,
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
    );
  }

  Widget threeLineGridViewModule() {
    return GridView.builder(
      itemCount: categoryCollectionController.categoryCollectionLists.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 0.7),
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: CustomColor.kLightOrangeColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(
                            '${ApiUrl.MainPath}${categoryCollectionController.categoryCollectionLists[index].showimg}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 5, left: 5, top: 0, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${categoryCollectionController.categoryCollectionLists[index].productname}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '\$${categoryCollectionController.categoryCollectionLists[index].productcost}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '\$${categoryCollectionController.categoryCollectionLists[index].productcost}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget singleLineGridViewModule() {
    return GridView.builder(
      itemCount: categoryCollectionController.categoryCollectionLists.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        childAspectRatio: Get.width / (Get.height / 2.5),
      ),
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: CustomColor.kLightOrangeColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(
                            '${ApiUrl.MainPath}${categoryCollectionController.categoryCollectionLists[index].showimg}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 5, left: 5, top: 0, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${categoryCollectionController.categoryCollectionLists[index].productname}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '\$${categoryCollectionController.categoryCollectionLists[index].productcost}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '\$${categoryCollectionController.categoryCollectionLists[index].productcost}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget listViewModule() {
    return ListView.builder(
      itemCount: categoryCollectionController.categoryCollectionLists.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CustomColor.kLightOrangeColor),
            child: Row(
              children: [
                Expanded(
                  flex: 30,
                  child: Container(
                    height: Get.width * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            '${ApiUrl.MainPath}${categoryCollectionController.categoryCollectionLists[index].showimg}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${categoryCollectionController.categoryCollectionLists[index].productname}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '\$${categoryCollectionController.categoryCollectionLists[index].productcost}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '\$${categoryCollectionController.categoryCollectionLists[index].productcost}',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        );
      },
    );
  }

}
