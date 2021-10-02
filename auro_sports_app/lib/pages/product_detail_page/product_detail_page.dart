import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/pages/product_detail_page/controller/add_product_wishlist_controller.dart';
import 'package:auro_sports_app/pages/product_detail_page/controller/addtocart_controller.dart';
import 'package:auro_sports_app/pages/product_detail_page/model/review_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_html/flutter_html.dart';
import 'controller/product_detail_controller.dart';

class ProductDetailPage extends StatelessWidget {
  // const ProductDetailPage({Key? key}) : super(key: key);

  ProductDetailController productDetailController =
                                            Get.put(ProductDetailController());
  AddToCartController addToCartController = Get.put(AddToCartController());
  AddProductWishlistController addProductWishlistController = Get.put(AddProductWishlistController());

  var productId;
  var userRating;
  TextEditingController userReviewController = TextEditingController();


  List<Color> colorList = [
    Colors.blue,
    Colors.red,
    Colors.lightGreenAccent,
    Colors.orangeAccent,
  ];

  List<ReviewInfo> reviewList = [
    ReviewInfo(
      imgUrl: 'assets/images/contactus.png',
      userName: 'Tokyo',
      stars: '4',
      description:
          'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: 'assets/images/contactus.png',
      userName: 'Arturito',
      stars: '4.5',
      description:
          'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: 'assets/images/contactus.png',
      userName: 'Berline',
      stars: '4.5',
      description:
          'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: 'assets/images/contactus.png',
      userName: 'Neirobi',
      stars: '4.5',
      description:
          'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),
      body: Obx(
        () => productDetailController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: CustomColor.kOrangeColor,
                  backgroundColor: Colors.grey,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    carouselSlider(),
                    SizedBox(height: 8),
                    carouselIndicator(),
                    SizedBox(height: 20),
                    productDetails(),
                    SizedBox(height: 10),
                    cartAndBuyButtons(),
                    SizedBox(height: 20),
                    giveReview(),
                    SizedBox(height: 20),
                    showReview(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget carouselSlider() {
    return CarouselSlider.builder(
      itemCount: productDetailController.productDetailLists[0].images.length,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = '${ApiUrl.MainPath}${productDetailController.productDetailLists[0].images[index]}';
        return buildImage(imgUrl, index);
      },
      options: CarouselOptions(
          height: Get.height * 0.30,
          autoPlay: true,
          // autoPlayInterval: Duration(seconds: 3),
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            // setState(() {
              productDetailController.activeIndex.value = index;
            // });
          }),
    );
  }

  //Carousel Slider Image
  Widget buildImage(String urlImage, int index) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColor.kLightOrangeColor,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(urlImage),
                fit: BoxFit.cover,
              ),
            ),
            // margin: EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        Positioned(
          right: 20,
          top: 5,
          child: Container(
            child: IconButton(
              icon: Icon(Icons.favorite_rounded),
              color: Colors.red,
              onPressed: () {
                // Todo : Add in Wishlist Button
                if(productDetailController.userId == null){
                  print('asasasasaasa');
                  Get.snackbar('Title', 'Login Required');
                } else {
                  print('zzzzzzzzzzzzzz');
                  var productId = productDetailController.productId;
                  addProductWishlistController.getAddProductWishlistData(productId);
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget carouselIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: productDetailController.activeIndex.value,
      count: productDetailController.productDetailLists[0].images.length,
      effect: WormEffect(
        dotHeight: 11,
        dotWidth: 11,
        activeDotColor: CustomColor.kOrangeColor,
        dotColor: Colors.black,
      ),
    );
  }

  Widget productDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productDetailController.productDetailLists[0].productname,
            textScaleFactor: 1.1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          RatingBar.builder(
            itemCount: 5,
            // ignoreGestures: true,
            unratedColor: CustomColor.kLightOrangeColor,
            allowHalfRating: true,
            itemSize: 22,
            minRating: 1,
            glow: false,
            initialRating: 3,
            itemBuilder: (context, _) {
              return Icon(
                Icons.star_rounded,
                color: CustomColor.kOrangeColor,
              );
            },
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Text(
                '\$${productDetailController.productDetailLists[0].productcost}',
                textScaleFactor: 1.1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CustomColor.kOrangeColor,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '\$${productDetailController.productDetailLists[0].productcost}',
                textScaleFactor: 1.1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Container(
            child: Html(
              data: productDetailController.productDetailLists[0].fullText,
            ),
          ),
          /*Container(
            child: ReadMoreText(
              // desText,
              productDetailController.productDetailLists[0].fullText!,
              trimLines: 4,
              colorClickableText: CustomColor().kOrangeColor,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...More',
              trimExpandedText: 'Less',
              textAlign: TextAlign.justify,
            ),
          ),*/
          SizedBox(height: 10),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Color',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 27,
                  child: ListView.builder(
                    itemCount: colorList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          productDetailController.activeColor.value = index;
                          print(productDetailController.activeColor.value);
                        },
                        child: Obx(
                          ()=> Container(
                            margin: EdgeInsets.only(right: 3),
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorList[index],
                            ),
                            child: Center(
                              child: productDetailController.activeColor.value == index
                                  ? Icon(
                                      Icons.done_rounded,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  : Container(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cartAndBuyButtons() {
    return Row(
      children: [
        // Cart Button
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () {
              //Todo : Add Product In Cart Button
              if(productDetailController.userId == null){
                Get.snackbar('Title', 'Login Required');
              } else {
                // Get.snackbar('title', 'Login Done');
                var productId = productDetailController.productId;
                print('productId : $productId');
                addToCartController.addToCartProduct(productId);
              }
            },
            child: Container(
              width: Get.width * 0.30,
              decoration: BoxDecoration(
                  color: CustomColor.kOrangeColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )),
            ),
          ),
        ),
        // Buy Button
        Container(
          // padding: EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () {
              print('Clicked On Add To Cart Button');
            },
            child: Container(
              width: Get.width * 0.30,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(25)),
              child: Center(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )),
            ),
          ),
        )
      ],
    );
  }

  Widget giveReview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Obx(
        ()=> Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Review',
              textScaleFactor: 1.1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              // Todo : Add Review
              onTap: () {
                productDetailController.isReview.value =
                    !productDetailController.isReview.value;
                print('isReview : ${productDetailController.isReview.value}');
              },
              child: Text(
                'Write Review',
                // textScaleFactor: 1.1,
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),

            // Add Review Here
            productDetailController.isReview.value
                ? Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        RatingBar.builder(
                          itemCount: 5,
                          unratedColor: CustomColor.kLightOrangeColor,
                          allowHalfRating: true,
                          itemSize: 22,
                          minRating: 1,
                          glow: false,
                          initialRating: 0,
                          itemBuilder: (context, _) {
                            return Icon(
                              Icons.star_rounded,
                              color: CustomColor.kOrangeColor,
                            );
                          },
                          onRatingUpdate: (rating) {
                            userRating = rating;
                            print(userRating);
                          },
                        ),

                        TextFormField(
                          controller: userReviewController,
                          maxLines: 1,
                          cursorColor: CustomColor.kOrangeColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            isDense: true,
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 8),

                        Row(
                           children: [
                             GestureDetector(
                               onTap: () {
                                 productDetailController.isReview.value =
                                 !productDetailController.isReview.value;
                                 print('isReview cancel::${productDetailController.isReview.value}');
                               },
                               child: Container(
                                 width: Get.width * 0.20,
                                 decoration: BoxDecoration(
                                   color: Colors.grey,
                                   borderRadius: BorderRadius.circular(15)
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(vertical: 8),
                                   child: Center(
                                     child: Text(
                                         'Cancel',
                                       style: TextStyle(
                                         fontSize: 15, fontWeight: FontWeight.bold
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                             SizedBox(width: 15),
                             GestureDetector(
                               onTap: () {
                                 productDetailController.
                                 getAddProductReview(
                                     userRating,
                                     userReviewController.text.trim(),
                                 );
                                 productDetailController.isReview.value =
                                 !productDetailController.isReview.value;
                               },
                               child: Container(
                                 width: Get.width * 0.20,
                                 decoration: BoxDecoration(
                                     color: Colors.black,
                                     borderRadius: BorderRadius.circular(15)
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(vertical: 8),
                                   child: Center(
                                     child: Text(
                                       'Done',
                                       style: TextStyle(
                                           fontSize: 15,
                                           fontWeight: FontWeight.bold,
                                         color: Colors.white
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ],
                        ),


                      ],
                    ),
                )
                : Container(),

          ],
        ),
      ),
    );
  }

  Widget showReview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Obx(
              ()=> ListView.builder(
                itemCount: productDetailController.viewMoreValue.value ? reviewList.length : 2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 25,
                              child: Image(
                                image: AssetImage(reviewList[index].imgUrl),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(reviewList[index].userName),
                                SizedBox(height: 2),
                                Container(
                                  child: RatingBar.builder(
                                    itemCount: 5,
                                    ignoreGestures: true,
                                    unratedColor: CustomColor.kLightOrangeColor,
                                    allowHalfRating: true,
                                    itemSize: 15,
                                    minRating: 1,
                                    glow: false,
                                    // initialRating: 3,
                                    itemBuilder: (context, _) {
                                      return Icon(
                                        Icons.star_rounded,
                                        color: CustomColor.kOrangeColor,
                                      );
                                    },
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  reviewList[index].description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ]),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              productDetailController.viewMoreValue.value = !productDetailController.viewMoreValue.value;
              print(productDetailController.viewMoreValue.value);
            },
            child: Text(
              productDetailController.viewMoreValue.value ? 'View Less' : 'View More',
              textScaleFactor: 1.1,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
