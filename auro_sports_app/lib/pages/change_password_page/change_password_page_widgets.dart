import 'package:auro_sports_app/common/common_function.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'change_password_page_controller.dart';

class OldPasswordFieldModule extends StatelessWidget {
  final cpController = Get.find<ChangePasswordPageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          obscureText: cpController.isOldPassObsecure.value,
          cursorColor: CustomColor.kOrangeColor,
          decoration: InputDecoration(
            hintText: "Old Password",
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orangeAccent),
                borderRadius: BorderRadius.circular(25)),
            suffixIcon: IconButton(
              onPressed: (){
                cpController.isOldPassObsecure.value = !cpController.isOldPassObsecure.value;
              },
              icon: cpController.isOldPassObsecure.value
                  ? Icon(Icons.visibility_off_rounded,color: CustomColor.kOrangeColor)
                  : Icon(Icons.visibility_rounded,color: CustomColor.kOrangeColor),
            ),
          ),
          controller: cpController.oldPassFieldController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Password cannot be empty";
            } else if(value.length <= 5){
              return "Length at least 5 Character!";
            }
          },
        ),
      ),
    );
  }
}

class NewPasswordFieldModule extends StatelessWidget {
  final cpController = Get.find<ChangePasswordPageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          obscureText: cpController.isNewPassObsecure.value,
          cursorColor: CustomColor.kOrangeColor,
          decoration: InputDecoration(
            hintText: "New Password",
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orangeAccent),
                borderRadius: BorderRadius.circular(25)),
            suffixIcon: IconButton(
              onPressed: (){
                cpController.isNewPassObsecure.value = !cpController.isNewPassObsecure.value;
              },
              icon: cpController.isNewPassObsecure.value
                  ? Icon(Icons.visibility_off_rounded,color: CustomColor.kOrangeColor)
                  : Icon(Icons.visibility_rounded,color: CustomColor.kOrangeColor),
            ),
          ),
          controller: cpController.newPassFieldController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Password cannot be empty";
            } else if(value.length <= 5){
              return "Length at least 5 Character!";
            }
          },
        ),
      ),
    );
  }
}

class NewCPasswordFieldModule extends StatelessWidget {
  final cpController = Get.find<ChangePasswordPageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          obscureText: cpController.isNewCPassObsecure.value,
          cursorColor: CustomColor.kOrangeColor,
          decoration: InputDecoration(
            hintText: "New Password",
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orangeAccent),
                borderRadius: BorderRadius.circular(25)),
            suffixIcon: IconButton(
              onPressed: (){
                cpController.isNewCPassObsecure.value = !cpController.isNewCPassObsecure.value;
              },
              icon: cpController.isNewCPassObsecure.value
                  ? Icon(Icons.visibility_off_rounded,color: CustomColor.kOrangeColor)
                  : Icon(Icons.visibility_rounded,color: CustomColor.kOrangeColor),
            ),
          ),
          controller: cpController.newCPassFieldController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Password cannot be empty";
            } else if(value.length <= 5){
              return "Length at least 5 Character!";
            }
          },
        ),
      ),
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  final cpController = Get.find<ChangePasswordPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: GestureDetector(
        onTap: () async {
          CommonFunctions().hideKeyBoard();
          if (cpController.formKey.currentState!.validate()) {
            if(cpController.newPassFieldController.text == cpController.newCPassFieldController.text) {
              cpController.getForgotPasswordData(
                "${cpController.oldPassFieldController.text.trim()}",
                "${cpController.newPassFieldController.text.trim()}",
                "${cpController.newCPassFieldController.text.trim()}",
              );
            } else {
              Fluttertoast.showToast(msg: 'Password Not Same!');
            }
          }
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: CustomColor.kOrangeColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Submit',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
