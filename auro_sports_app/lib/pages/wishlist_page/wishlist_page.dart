import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'controller/delete_wishlist_controller.dart';
// import 'controller/wishlist_show_controller.dart';


class WishListPage extends StatefulWidget {

  // WishlistController wishlistController = Get.put(WishlistController());
  // DeleteWishlistController deleteWishlistController = Get.put(DeleteWishlistController());
  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {

  WishListController wishListController = Get.put(WishListController());


  @override
  void initState() {
    wishListController.getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),

      body: Obx(
        ()=> wishListController.isLoading.value
        // && deleteWishlistController.isLoading.value
            ? Center(
          child: CircularProgressIndicator(
            color: CustomColor.kOrangeColor,
            backgroundColor: Colors.grey,
          ),
        )
            : wishListController.userWishLists.length == 0
              ? Center(
          child: Text('No Product In Wish List'),
        )
              : Container(
          child: ListView.builder(
            itemCount: wishListController.userWishLists.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  elevation: 10,
                  child: Container(
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                child: Row(
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
                                                  '${ApiUrl.MainPath}${wishListController.userWishLists[index].showimg}'
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                wishListController.userWishLists[index].productname,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            /*Text(
                                              'Color : ${wishlistItems[index].productColor}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(height: 5),*/
                                            Row(
                                              children: [
                                                Text(
                                                  '\$${wishListController.userWishLists[index].productcost}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: CustomColor.kOrangeColor,
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '\$${wishListController.userWishLists[index].productcost}',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                      decoration: TextDecoration.lineThrough
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
                              ),
                            ),
                            /*Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 35, width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomColor.kOrangeColor,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.shopping_cart_rounded),
                                  color: Colors.white,
                                  iconSize: 20,
                                  onPressed: () {
                                    print(wishListController.userWishLists[index].productname);
                                  },
                                ),
                              ),
                            ),*/
                          ],
                        ),
                        Positioned(
                          right: 15,
                          top: -7,
                          child: GestureDetector(
                            onTap: () async{
                              // Todo : Delete Items From Wishlists
                              print('wishlistid : ${wishListController.userWishLists[index].wishlistid}');
                              await wishListController.getDeleteWishlistData(wishListController.userWishLists[index].wishlistid);
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Icon(
                                  Icons.close_rounded,
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
