import 'dart:convert';
import 'package:auro_sports_app/common/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/order_screen_model/user_total_order_model.dart';

class UserTotalOrderController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  List<Datum> totalOrdersLists = [];


  getUserTotalOrders(userId) async {
    print('userId : $userId');
    isLoading(true);
    String url = ApiUrl.UserTotalOrderApi;
    print('Url : $url');

    try{
      Map data = {
        "user_id": "$userId"
      };
      print('data : $data');
      http.Response response = await http.post(Uri.parse(url),body: data);

      TotalOrdersData totalOrdersData = TotalOrdersData.fromJson(json.decode(response.body));
      isStatus = totalOrdersData.success.obs;
      print('Response Bool : ${totalOrdersData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        totalOrdersLists = totalOrdersData.data;
      } else {
        print('Total Orders False False');
      }
    } catch(e){
      print('User Total Orders Error :$e');
    }
    isLoading(false);
  }

  getUserDetailsFromPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId1 = prefs.getInt('id');
    print('UserId Add to Cart : $userId1');
    getUserTotalOrders(userId1);
  }


  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }
}