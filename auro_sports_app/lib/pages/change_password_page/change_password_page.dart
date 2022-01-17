import 'package:auro_sports_app/common/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'change_password_page_controller.dart';
import 'change_password_page_widgets.dart';

class ChangePasswordPage extends StatelessWidget {
  final cpController = Get.put(ChangePasswordPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),

      body: Obx(
        ()=> cpController.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: cpController.formKey,
            child: Column(
              children: [
                OldPasswordFieldModule(),
                const SizedBox(height: 10),
                NewPasswordFieldModule(),
                const SizedBox(height: 10),
                NewCPasswordFieldModule(),
                const SizedBox(height: 20),
                SubmitButtonModule(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
