import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/pages/cart_page/controller/cart_controller.dart';
import 'package:auro_sports_app/pages/checkout_page/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/add_cart_qty_controller.dart';
import 'controller/delete_cart_product_controller.dart';


class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartController cartController = Get.put(CartController());
  AddCartQtyController addCartQtyController = Get.put(AddCartQtyController());
  DeleteCartProductController deleteCartProductController = Get.put(DeleteCartProductController());

  @override
  void initState() {
    cartController.getUserDetailsFromPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),

      body: Obx(
        () => cartController.isLoading.value || addCartQtyController.isLoading.value
              || deleteCartProductController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: CustomColor.kOrangeColor,
                  backgroundColor: Colors.grey,
                ),
              )
            : cartController.userCartProductLists.length == 0
                ? Center(
          child: Text('Cart Is Empty'),
        )
                : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    cartItemsList(),
                    SizedBox(height: 10),
                    couponCodeField(),
                    SizedBox(height: 10),
                    subTotal(),
                    tax(),
                    discount(),
                    total(),
                    SizedBox(height: 20),
                    proceedButton(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
      ),

    );
  }

  Widget cartItemsList() {
    return Obx(
      ()=> Container(
        child: ListView.builder(
          itemCount: cartController.userCartProductLists.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
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
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                                '${ApiUrl.MainPath}${cartController.userCartProductLists[index].showimg}'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartController
                                                .userCartProductLists[index].productname,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Qty : ${cartController.userCartProductLists[index].cquantity}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Text(
                                                '\$${cartController.userCartProductLists[index].productcost}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      CustomColor.kOrangeColor,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                '\$${cartController.userCartProductLists[index].totalcost}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    decoration: TextDecoration
                                                        .lineThrough),
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
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      if(cartController.userCartProductLists[index].cquantity > 1){
                                        int cartQty = cartController.userCartProductLists[index].cquantity;
                                        int cartQtyDec = cartQty - 1;
                                        print('cquantity -- : $cartQtyDec');
                                        addCartQtyController.getAddProductCartQty(cartQtyDec, cartController.userCartProductLists[index].cartDetailId);
                                        cartController.getUserDetailsFromPrefs();
                                      }
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 25,
                                    ),
                                  ),

                                  SizedBox(width: 5),

                                  Obx(
                                    ()=> Text(
                                      '${cartController.userCartProductLists[index].cquantity}',
                                      style: TextStyle(
                                        fontSize: 15
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: 5),

                                  GestureDetector(
                                    onTap: (){
                                      int cartQty = cartController.userCartProductLists[index].cquantity;
                                      int cartQtyInc = cartQty + 1;
                                      print('cquantity ++ : $cartQtyInc');
                                      addCartQtyController.getAddProductCartQty(cartQtyInc, cartController.userCartProductLists[index].cartDetailId);
                                      cartController.getUserDetailsFromPrefs();
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 15,
                        top: -12,
                        child: GestureDetector(
                          onTap: () {
                            // Todo
                            print('cartDetailId : ${cartController.userCartProductLists[index].cartDetailId}');
                            deleteCartProductController.getDeleteProductCart(cartController.userCartProductLists[index].cartDetailId);
                            cartController.getUserDetailsFromPrefs();
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
    );
  }

  Widget couponCodeField() {
    return Container(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: TextFormField(
          cursorColor: CustomColor.kOrangeColor,
          decoration: InputDecoration(
            fillColor: CustomColor.kOrangeColor,
            hintText: "Promo Code",
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: CustomColor.kOrangeColor,
                  width: 2,
                  style: BorderStyle.solid),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColor.kOrangeColor),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColor.kOrangeColor),
              borderRadius: BorderRadius.circular(20),
            ),
            suffixIcon: Container(
              width: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CustomColor.kOrangeColor,
              ),
              child: Center(
                child: Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget subTotal() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sub Total',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Text(
                '\$${cartController.userCartTotalAmount}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 2),
        ],
      ),
    );
  }

  Widget tax() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tax',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Text(
                '\$00.00',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 2),
        ],
      ),
    );
  }

  Widget discount() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Text(
                '\$00.00',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 2),
        ],
      ),
    );
  }

  Widget total() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  '\$${cartController.userCartTotalAmount}',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 2),
        ],
      ),
    );
  }

  Widget proceedButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          print('Proceed Button');
          Get.to(() => CheckOutPage(),
          arguments: cartController.userCartId);
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: CustomColor.kOrangeColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 11),
            child: Text(
              'Proceed To Checkout',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          )),
        ),
      ),
    );
  }
}

// Container(
// width: 50,
// height: 25,
// child: TextFormField(
// textAlign: TextAlign.center,
// cursorColor: Colors.grey,
// initialValue: '1',
// keyboardType: TextInputType.number,
// decoration: InputDecoration(
// isDense: true,
// contentPadding: EdgeInsets.symmetric(
// horizontal: 10, vertical: 5),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Colors.grey),
// borderRadius: BorderRadius.circular(6),
// ),
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Colors.grey),
// borderRadius: BorderRadius.circular(6),
// ),
// ),
// ),
// ),