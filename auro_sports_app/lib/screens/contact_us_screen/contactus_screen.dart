import 'package:auro_sports_app/common/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/contact_us_screen_controller/contactus_page_controller.dart';
import 'contact_us_screen_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  final contactUsPageController = Get.put(ContactUsPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),
      body: Obx(
        ()=> contactUsPageController.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContactImg(),
              SizedBox(height: 20),

              Form(
                key: contactUsPageController.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            FullNameField(),
                            SizedBox(height: 20),
                            EmailIdField(),
                            SizedBox(height: 20),
                            SubjectField(),
                            SizedBox(height: 20),
                            PhoneNoModule(),
                            SizedBox(height: 20),
                            CommentField(),
                            SizedBox(height: 30),
                            SubmitButtonModule(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
