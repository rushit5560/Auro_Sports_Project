import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/pages/address_manager_page/address_manager_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_all_address_controller.dart';

class ProfilePage extends StatefulWidget {
  // const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserAllAddressController userAllAddressController =
      Get.put(UserAllAddressController());


  @override
  void initState() {
    userAllAddressController.getUserDetailsFromPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),
      body: Obx(
        () => userAllAddressController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: CustomColor.kOrangeColor,
                  backgroundColor: Colors.grey,
                ),
              )
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      profilePhoto(),
                      SizedBox(height: 25),
                      userDetails(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget profilePhoto() {
    return Container(
      width: Get.width,
      height: Get.height * 0.25,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: -15,
            right: 20,
            child: Material(
              elevation: 8,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: CustomColor.kOrangeColor),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      // print('Edit Profile');
                    },
                    icon: Icon(Icons.edit),
                    color: Colors.white,
                    iconSize: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget userDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'UserName',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Jonny Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 18),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Email Id',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '${userAllAddressController.billingEmail}'/*.isEmpty
                    ? 'user@gmail.com'
                    : '${userAllAddressController.billingInfo[2]}'*/,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 18),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Phone Number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '${userAllAddressController.billingPhone}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 18),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Billing Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '${userAllAddressController.billingAddress}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 18),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Shipping Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '${userAllAddressController.shippingAddress}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            Get.to(() => AddressManagerPage())!.then((value) {
              userAllAddressController.getUserDetailsFromPrefs();
            });
          },
          child: Text(
            'Address Manager',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
