import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/order_detail_screen_model/order_details_model.dart';

class OrderDetailController extends GetxController {
  int orderId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  List<Datum> orderDetailLists = [];

  getOrderDetail() async{
    print('orderId : $orderId');
    isLoading(true);
    String url = ApiUrl.OrderDetailsApi;
    print('Url : $url');
    
    try{

      Map data = {
        "id": "$orderId"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Response1 : ${response.statusCode}');
      print('Response1 : ${response.body}');

      OrderDetailsData orderDetailsData = OrderDetailsData.fromJson(json.decode(response.body));
      isStatus = orderDetailsData.success.obs;
      print('Response Bool : ${orderDetailsData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        orderDetailLists = orderDetailsData.data;
      } else {
        print('Order Details False False');
      }
    } catch(e){
      print('Order Details Error : $e');
    }
    isLoading(false);
  }


  @override
  void onInit() {
    getOrderDetail();
    super.onInit();
  }
}