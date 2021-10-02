import 'package:auro_sports_app/common/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsPage extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            contactImg(),
            SizedBox(height: 20),

            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          fullNameField(),
                          SizedBox(height: 20),
                          emailIdField(),
                          SizedBox(height: 20),
                          subjectField(),
                          SizedBox(height: 20),
                          commentField(),
                          SizedBox(height: 30),
                          submitButton(context),
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
    );
  }

  Widget contactImg() {
    return Container(
      height: Get.height * 0.25,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/contactus.png'))),
    );
  }

  Widget fullNameField() {
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
            controller: fullNameController,
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

  Widget emailIdField() {
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
            controller: emailIdController,
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

  Widget subjectField() {
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
            controller: subjectController,
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

  Widget commentField() {
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
            controller: commentController,
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

  Widget submitButton(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            print('Inside formkey');
          }
        },
        child: Container(
          width: deviceWidth,
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
