import 'package:auro_sports_app/common/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'contactus_page_controller.dart';

class FullNameField extends StatelessWidget {
  final controller = Get.find<ContactUsPageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Full Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            cursorColor: CustomColor.kOrangeColor,
            decoration: InputDecoration(
              // hintText: "Full Name",
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.circular(25)),
            ),
            controller: controller.fullNameController,
            validator: (value) {
              if (value!.isEmpty /* || value.length == null*/) {
                return "Name cannot be empty";
              }
            },
          ),
        ),
      ],
    );
  }
}

class EmailIdField extends StatelessWidget {
  final controller = Get.find<ContactUsPageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Email Id',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            cursorColor: CustomColor.kOrangeColor,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.circular(25)),
            ),
            controller: controller.emailIdController,
            validator: (value) {
              if (value!.isEmpty /* || value.length == null*/) {
                return "Email cannot be empty";
              } else if (!value.contains('@')) {
                return "Email Not valid";
              }
            },
          ),
        ),
      ],
    );
  }
}

class SubjectField extends StatelessWidget {
  final controller = Get.find<ContactUsPageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Subject',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            cursorColor: CustomColor.kOrangeColor,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.circular(25)),
            ),
            controller: controller.subjectController,
            validator: (value) {
              if (value!.isEmpty /* || value.length == null*/) {
                return "Subject cannot be empty";
              }
            },
          ),
        ),
      ],
    );
  }
}

class PhoneNoModule extends StatelessWidget {
  final controller = Get.find<ContactUsPageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Phone No',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            cursorColor: CustomColor.kOrangeColor,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            decoration: InputDecoration(
              isDense: true,
              counterText: '',
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.circular(25)),
            ),
            controller: controller.phoneNoController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Phone No cannot be empty";
              } else if(value.length != 10){
                return "Phone No not valid.";
              }
            },
          ),
        ),
      ],
    );
  }
}

class CommentField extends StatelessWidget {
  final controller = Get.find<ContactUsPageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Comment',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            maxLines: 3,
            cursorColor: CustomColor.kOrangeColor,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.circular(15)),
            ),
            controller: controller.commentController,
            validator: (value) {
              if (value!.isEmpty /* || value.length == null*/) {
                return "Comment cannot be empty";
              }
            },
          ),
        ),
      ],
    );
  }
}

class ContactImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.25,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/contactus.png'))),
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  final controller = Get.find<ContactUsPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          if (controller.formKey.currentState!.validate()) {
            controller.getContactUsData(
              fullName: '${controller.fullNameController.text}',
              emailId: '${controller.emailIdController.text}',
              subject: '${controller.subjectController.text}',
              phoneNo: '${controller.phoneNoController.text}',
              comment: '${controller.commentController.text}'
            );
            controller.clearAllTextFields();
          }
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: CustomColor.kOrangeColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )),
        ),
      ),
    );
  }
}
