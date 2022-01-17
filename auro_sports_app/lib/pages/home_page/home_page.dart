import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/common_function.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/common/custom_drawer/custom_drawer.dart';
import 'package:auro_sports_app/common/shimmer_loader/shimmer_loader.dart';
import 'package:auro_sports_app/pages/cart_page/cart_page.dart';
import 'package:auro_sports_app/pages/collection_page/collection_page.dart';
import 'package:auro_sports_app/pages/home_page/home_controller.dart';
import 'package:auro_sports_app/pages/product_detail_page/product_detail_page.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  // int activeIndex1 = 0;
  HomeController homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CommonFunctions().hideKeyBoard(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColor.kOrangeColor,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => CartPage());
                },
                icon: Icon(Icons.shopping_cart_rounded))
          ],
        ),
        drawer: CustomDrawer(),

        body: Obx(() => homeController.isLoading.value
            ? ShimmerLoader().homePageLoader()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    searchBar(),
                    SizedBox(height: 20),
                    carouselSlider(),
                    SizedBox(height: 8),
                    carouselIndicator(),
                    SizedBox(height: 20),
                    newArrival(),
                    SizedBox(height: 25),
                    offerBanner(),
                    SizedBox(height: 25),
                    testimonials(),
                    SizedBox(height: 25),
                    featuredProducts(),
                    SizedBox(height: 10),
                  ],
                ),
              )),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 40,
          child: Center(
            child: TextFormField(
              cursorColor: CustomColor.kOrangeColor,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search_rounded,
                    color: CustomColor.kOrangeColor,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    // borderSide: BorderSide(width: 5),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget carouselSlider() {
    return Obx(() =>
        /*bannerController.isLoading.value
        ? Container(
            height: 150,
            child: Center(
              child: CircularProgressIndicator(
                color: CustomColor.kOrangeColor,
              ),
            ),
          )
        : */
        CarouselSlider.builder(
          itemCount: homeController.bannerLists.length,
          itemBuilder: (context, index, realIndex) {
            final imgUrl = ApiUrl.MainPath +
                '${homeController.bannerLists[index].imagePath}';
            return Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 12),
                ),
                Container(
                  width: Get.width * 0.65,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      homeController.bannerLists[index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
              height: 150,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                // setState(() {
                homeController.activeIndex.value = index;
                // activeIndex1 = int.parse('${bannerController.activeIndex}');
                // });
              }),
        ));
  }

  //Carousel Slider Indicator
  /*Widget carouselIndicator() {
    if (bannerController.bannerLists!.isEmpty) {
      return Container(
          height: 11,
      );
    } else {
      return AnimatedSmoothIndicator(
            activeIndex: int.parse(bannerController.activeIndex),
            count: bannerController.bannerLists!.length,
            effect: WormEffect(
              dotHeight: 11,
              dotWidth: 11,
              activeDotColor: CustomColor.kOrangeColor,
              dotColor: Colors.black,
            ),
      );
    }
  }*/

  Widget carouselIndicator() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          homeController.bannerLists.length,
          (index) => Container(
            margin: EdgeInsets.all(4),
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: homeController.activeIndex.value == index
                  ? CustomColor.kOrangeColor
                  : Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget newArrival() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Arrival',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // color: Colors.black,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Clicked On View All');
                  Get.to(() => CollectionPage());
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          Container(
            // height: 250,
            child: GridView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print(
                          '${homeController.featuredProductLists[index].id}');
                      print(
                          '${homeController.featuredProductLists[index].productname}');
                      Get.to(()=> ProductDetailPage(),
                        transition: Transition.rightToLeft,
                        arguments: homeController.featuredProductLists[index].id,
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
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image:
                                              NetworkImage(
                                                  '${ApiUrl.MainPath}${homeController.featuredProductLists[index].showimg}'
                                              ),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                /*Positioned(
                                  right: 20,
                                  bottom: 0,
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
                                ),*/
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              '${homeController.featuredProductLists[index].productname}',
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
                                  '\$${homeController.featuredProductLists[index].productcost}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '\$${homeController.featuredProductLists[index].productcost}',
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
        ],
      ),
    );
  }

  Widget offerBanner() {
    return Stack(
      children: [
        Container(
          height: 120,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: CustomColor.kOrangeColor,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage('assets/images/slider2.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 8,
          bottom: 5,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              '30% Off On Your First Order',
              textScaleFactor: 1.3,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget testimonials() {
    return CarouselSlider.builder(
      itemCount: homeController.testimonialLists.length,
      itemBuilder: (context, index, realIndex){
        return Container(
          child: Column(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      '${ApiUrl.MainPath}${homeController.testimonialLists[index].showimg}'
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                homeController.testimonialLists[index].name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Expanded(
                child: Html(
                  data: homeController.testimonialLists[index].description,
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
          height: 150,
          autoPlay: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            // bannerController.activeIndex.value = index;
          }),
    );
  }

Widget featuredProducts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // color: Colors.black,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Clicked On View All');
                  Get.to(()=> CollectionPage());
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          Container(
            // height: 250,
            child: Obx(
              () =>  /*featuredProductController.isLoading.value
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: CustomColor.kOrangeColor,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    )
                  :  */GridView.builder(
                      itemCount: homeController.featuredProductLists.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              print(
                                  '${homeController.featuredProductLists[index].id}');
                              print(
                                  '${homeController.featuredProductLists[index].productname}');
                              Get.to(()=> ProductDetailPage(),
                                  transition: Transition.rightToLeft,
                                  arguments: homeController.featuredProductLists[index].id,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CustomColor.kLightOrangeColor,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        height: 65,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  '${ApiUrl.MainPath}${homeController.featuredProductLists[index].showimg}'),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 8),
                                          child: Text(
                                            '${homeController.featuredProductLists[index].productname}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          margin: EdgeInsets.only(right: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                '\$${homeController.featuredProductLists[index].productcost}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Expanded(
                                                child: Text(
                                                  '\$${homeController.featuredProductLists[index].productcost}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
