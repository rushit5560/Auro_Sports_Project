import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/common/common_function.dart';
import 'package:auro_sports_app/screens/index_screen/index_screen.dart';
import 'package:auro_sports_app/models/signin_screen_model/signin_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxBool isObsecure = true.obs;

  getSignInData(String email, String password) async {
    print('email : $email \npassword : $password');

    isLoading(true);
    String url = ApiUrl.LoginApi;
    print("Url : $url");

    try {
      Map data = {"email": email, "password": password};
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);

      print('Response1 : ${response.statusCode}');
      print('Response2 : ${response.body}');


      if (response.body.contains('Email')) {
        print('Email Don\'t Match');
        Get.snackbar('', 'Email Don\'t Match');
      }
      if(response.body.contains('password')) {
        print('Password Don\'t Match');
        Get.snackbar('', 'Password Don\'t Match');
      }

      SignInData signInData = signInDataFromJson(response.body);
      isStatus = signInData.success.obs;
      print("Response Bool : ${signInData.success}");
      print("isStatus : $isStatus");

      if(isStatus.value){
        print('True True');
        var id = signInData.data.id;
        var token = signInData.data.token;
        print('id : $id \nToken : $token');
        CommonFunctions().setUserDetailsInPrefs(id, token);
        Get.offAll(() => IndexScreen());
        Get.snackbar('User Login In Successfully.','');
      } else {
        print('False');
      }

    } catch (e) {
      print('Error1 : $e');
    } finally {
      isLoading(false);
    }
  }


}
