import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/screens/order_detail_screen/order_detail_screen.dart';
import 'package:auro_sports_app/controllers/order_screen_controller/user_total_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class OrderScreen extends StatelessWidget {
  UserTotalOrderController userTotalOrderController =
      Get.put(UserTotalOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),
      body: Obx(
          ()=> userTotalOrderController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                  )
              : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  showOrderList(),
                ],
              ),
            ),
          )
      ),
    );
  }

  /*Widget dateShow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '10 Aug 2021',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(height: 10),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }*/

  Widget showOrderList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: userTotalOrderController.totalOrdersLists.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GestureDetector(
            onTap: () {
              Get.to(() => OrderDetailScreen(),
                arguments: userTotalOrderController.totalOrdersLists[index].orderId
              );
              print('Order Id : ${userTotalOrderController.totalOrdersLists[index].orderId}');
            },
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 10,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  'Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "${userTotalOrderController.totalOrdersLists[index].userFname} "
                                    ),
                                    Expanded(
                                      child: Text(
                                        userTotalOrderController.totalOrdersLists[index].userLname,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5),

                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Text(
                              userTotalOrderController.totalOrdersLists[index].userStreetAddress,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                        ],
                      ),

                      SizedBox(width: 5),

                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'City',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Text(
                              userTotalOrderController.totalOrdersLists[index].userFname,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'State',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Text(
                              userTotalOrderController.totalOrdersLists[index].userLname,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Order Type',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Text(
                              userTotalOrderController.totalOrdersLists[index].orderType,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Total Qty',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Text(
                              userTotalOrderController.totalOrdersLists[index].totalqty,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Total Amount',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Text(
                              userTotalOrderController.totalOrdersLists[index].totalprice,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: 5),

                      MaterialButton(
                        onPressed: () {
                          String invoiceLink = "${ApiUrl.InvoicePdfPrefix}${userTotalOrderController.totalOrdersLists[index].orderPdf}${ApiUrl.InvoicePdfSuffix}";
                          print('invoiceLink : $invoiceLink');
                          print('invoiceLink');
                          openBrowserTab(invoiceLink);
                        },
                        child: Text('Order Invoice'),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  openBrowserTab(url) async {
    await FlutterWebBrowser.openWebPage(url: url);
  }

}
