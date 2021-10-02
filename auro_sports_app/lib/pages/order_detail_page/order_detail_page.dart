import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/pages/order_detail_page/order_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderDetailPage extends StatelessWidget {
  // const OrderDetailPage({Key? key}) : super(key: key);
  OrderDetailController orderDetailController = Get.put(OrderDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),

      body: Obx(
          () => orderDetailController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: CustomColor.kOrangeColor,
                    backgroundColor: Colors.grey,
                  ),
                )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      "Product Name",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "${orderDetailController.orderDetailLists[0].productname}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      "Order Quantity",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "${orderDetailController.orderDetailLists[0].quantity}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      "Product Amount",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "${orderDetailController.orderDetailLists[0].totalCost}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      "Total Amount",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "${orderDetailController.orderDetailLists[0].totalCost}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      "Order Date",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "${orderDetailController.orderDetailLists[0].createdDate}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          )
      ),

    );
  }
}
