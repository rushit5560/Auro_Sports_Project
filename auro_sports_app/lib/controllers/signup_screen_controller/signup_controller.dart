import 'dart:convert';
import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/common_function.dart';
import 'package:auro_sports_app/screens/index_screen/index_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/signup_screen_model/signup_model.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxBool isObsecure = true.obs;

  getRegisterData(String userName, String emailId, String password) async {
    print('userName : $userName \nemailId : $emailId \npassword : $password');
    isLoading(true);
    String url = ApiUrl.RegisterApi;
    print('Url : $url');

    try {
      Map data = {
        "name": userName,
        "email": emailId,
        "password": password,
        "c_password": password,
      };
      print('getRegisterData data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);

      print('Response1 : ${response.statusCode}');
      print('Response2 : ${response.body}');

      if (response.body.contains('The email has already been taken')) {
        print('Email Already Registered');
        Get.snackbar('Error!', 'Email Already Registered');
      }

      SignUpData signUpData = SignUpData.fromJson(json.decode(response.body));
      isStatus = signUpData.success.obs;
      print("Response Bool : ${signUpData.success}");
      print("isStatus : $isStatus");


      if (isStatus.value) {
        print('True True');
        var id = signUpData.data[0].id;
        var token = signUpData.data[0].rememberToken;
        print('id : $id \nToken : $token');
        CommonFunctions().setUserDetailsInPrefs(id, token);
        Get.offAll(() => IndexScreen());
        Get.snackbar('User Login In Successfully.', '');
      } else {
        print('False False');
      }
    } catch (e) {
      print('Sign Up Error : $e');
    } finally {
      isLoading(false);
    }
  }
}
