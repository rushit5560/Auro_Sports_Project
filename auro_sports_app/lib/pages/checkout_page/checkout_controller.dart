import 'dart:convert';
import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/pages/index_page/index_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'order_add_model.dart';


class CheckOutController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxInt userCartId = Get.arguments;
  RxInt userId = 0.obs;


  getAddOrder({fName, lName, address, city, state, phoneNo, email, orderNote, orderType}) async {
    isLoading(true);
    String url = ApiUrl.AddOrderApi;
    print('Url : $url');

    try{
      Map data = {
        "user_id": "$userId",
        "cartID": "$userCartId",
        "userFname": "$fName",
        "userLname": "$lName",
        "userStreet_address": "$address",
        "userCity": "$city",
        "usersState": "$state",
        "userPhone": "$phoneNo",
        "userEmail": "$email",
        "userOrderNote": "$orderNote",
        "order_type": "$orderType"
      };
      print('asasasasasssas data : $data');
      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Cart Response1 : ${response.statusCode}');
      print('Cart Response2 : ${response.body}');

      OrderAddData orderAddData = OrderAddData.fromJson(json.decode(response.body));
      isStatus = orderAddData.success.obs;
      print('Response Bool : ${orderAddData.success}');
      print('isStatus : $isStatus');
      
      if(isStatus.value){
        Get.offAll(()=> IndexPage());
        Get.snackbar('Order Placed Successfully.', 'Check You Email');
      }
      else {
        print('OrderAddData False False');
      }

    } catch(e){
      print('Add Order Error : $e');
    }
    isLoading(false);
  }

  getUserDetailsFromPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id')!.obs;
    print('UserId Add to Cart : $userId');
  }

  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }
}