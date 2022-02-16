import 'dart:convert';
import 'package:auro_sports_app/common/api_url.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/contact_us_screen_model/contact_us_model.dart';

class ContactUsPageController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;

  getContactUsData(
      {required String fullName,
      required String emailId,
      required String phoneNo,
      required String subject,
      required String comment}) async {
    isLoading(true);
    String url = ApiUrl.ContactUsApi;
    print('Url : $url');

    try{
      Map data = {
        "name": "$fullName",
        "email": "$emailId",
        "subject": "$subject",
        "message": "$comment",
        "phone": "$phoneNo"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);

      ContactUsData contactUsData = ContactUsData.fromJson(json.decode(response.body));
      isStatus = contactUsData.success.obs;

      if(isStatus.value){
        Fluttertoast.showToast(msg: "${contactUsData.message.toString()}");
        // Get.back();
      } else {
        print('Contact Us False');
      }
    } catch(e){
      print('Contact Us Error : $e');
    } finally {
      isLoading(false);
    }
    Get.back();
  }


  clearAllTextFields() {
    fullNameController.clear();
    emailIdController.clear();
    subjectController.clear();
    phoneNoController.clear();
    commentController.clear();
  }
}