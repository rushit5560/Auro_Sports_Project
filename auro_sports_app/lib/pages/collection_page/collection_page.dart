import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/pages/collection_page/collection_controller.dart';
import 'package:auro_sports_app/pages/product_detail_page/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionPage extends StatefulWidget {
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> with SingleTickerProviderStateMixin {
  CollectionController collectionController = Get.put(CollectionController());

  List<String> tabsList = ['SEE ALL', 'BLAZERS', 'DRESSES', 'JACKETS', 'JEANS'];

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
            title: collectionController.isClicked.value ? Text('Filter') : Text('Collection'),
            centerTitle: true,
            backgroundColor: CustomColor.kOrangeColor,
            elevation: 0,

            // TabBar List
            bottom: collectionController.isClicked.value
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
                  collectionController.isClicked.value =
                  !collectionController.isClicked.value;

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
          // BackPanel Module - Call
          backPanelModule(),

          // FrontPanel Module - Call
          frontPanelModule(constraints),
        ],
      ),
    );
  }

  RangeValues _currentRangeValues = const RangeValues(0, 8000);

  // BackPanel Module
  Widget backPanelModule() {
    return collectionController.isClicked.value
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
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        collectionController.isViewSelected.value = index;
                        print('${collectionController.isViewSelected.value}');
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: CustomColor.kLightOrangeColor,
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
              },),
            SizedBox(height: 10),

            // Apply Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  print('Apply');
                  print('Start : ${_currentRangeValues.start}');
                  print('End : ${_currentRangeValues.end}');

                  collectionController.isClicked.value =
                  !collectionController.isClicked.value;

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
    : Container();
  }

  // FrontPanel Module
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
                  newArrival(),
                  newArrival(),
                  newArrival(),
                  newArrival(),
                  newArrival(),
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
      child: collectionController.isClicked.value
          ? Container()
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TabBar(
              tabs: tabsList
                  .map((title) => SizedBox(height: 30, child: Tab(text: title)))
                  .toList(),
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              // indicatorColor: Colors.white,
              // labelColor: Colors.white,
              // unselectedLabelColor: Colors.white,
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

  Widget newArrival() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  crossAxisCount: collectionController.isViewSelected.value == 0
                                  ? 2
                                  : collectionController.isViewSelected.value == 1
                                    ? 3
                                    : collectionController.isViewSelected.value == 2
                                      ? 1
                                      : 2,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        print(
                            'Product id : ${collectionController.collectionLists[index].id}');
                        Get.to(
                          () => ProductDetailPage(),
                          transition: Transition.rightToLeft,
                          arguments:
                              collectionController.collectionLists[index].id,
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
