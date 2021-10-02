import 'package:auro_sports_app/common/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_billing_shipping_address_controller.dart';

class AddressManagerPage extends StatelessWidget {
  // const AddressManagerPage({Key? key}) : super(key: key);

  UserBillingShippingAddressController userBillingShippingAddressController =
                            Get.put(UserBillingShippingAddressController());

  TextEditingController shippingAddressController = TextEditingController();
  TextEditingController shippingMobileController = TextEditingController();
  TextEditingController shippingEmailController = TextEditingController();
  GlobalKey<FormState> shippingKey = GlobalKey();

  TextEditingController billingAddressController = TextEditingController();
  TextEditingController billingMobileController = TextEditingController();
  TextEditingController billingEmailController = TextEditingController();
  GlobalKey<FormState> billingKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Address Manager'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),

      body: Obx(
        ()=> userBillingShippingAddressController.isLoading.value
            ?  Center(
          child: CircularProgressIndicator(
            color: CustomColor.kOrangeColor,
            backgroundColor: Colors.grey,
          ),
        )
            : SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              shippingAddressFields(),
              SizedBox(height: 20),
              billingAddressFields(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }


  Widget shippingAddressFields() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Form(
        key: shippingKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Shipping Address',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),

            TextFormField(
              controller: shippingAddressController,
              maxLines: 3,
              keyboardType: TextInputType.text,
              validator: (value){
                if(value!.isEmpty){
                  return "Shipping Address should not be Empty";
                }
              },
              decoration: InputDecoration(
                hintText: 'Shipping Address',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                focusedErrorBorder: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextFormField(
              controller: shippingMobileController,
              maxLines: 1,
              keyboardType: TextInputType.number,
              maxLength: 10,
              validator: (value){
                if(value!.isEmpty){
                  return "Mobile No. should not be Empty";
                }
                if(value.length > 10 || value.length < 10){
                  return "Mobile No. Should be 10 Digit.";
                }
              },
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                counterText: '',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                focusedErrorBorder: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextFormField(
              controller: shippingEmailController,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if(value!.isEmpty){
                  return "EmailId should not be Empty";
                }
                if(!value.contains('@')){
                  return "EmailId Should be Valid.";
                }
              },
              decoration: InputDecoration(
                hintText: 'Email',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                focusedErrorBorder: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),

            GestureDetector(
              onTap: () {

                if(shippingKey.currentState!.validate()){
                  print('Shipping Address: ${shippingAddressController.text.trim()}');
                  print('Shipping Mobile: ${shippingMobileController.text.trim()}');
                  print('Shipping Email: ${shippingEmailController.text.toLowerCase().trim()}');

                  userBillingShippingAddressController.getUserShippingAddress(
                      shippingAddressController.text.trim(),
                      shippingMobileController.text.trim(),
                      shippingEmailController.text.toLowerCase().trim()
                  );

                  shippingAddressController.clear();
                  shippingMobileController.clear();
                  shippingEmailController.clear();

                  billingAddressController.clear();
                  billingMobileController.clear();
                  billingEmailController.clear();
                }
              },
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget billingAddressFields() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Form(
        key: billingKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Billing Address',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),

            TextFormField(
              controller: billingAddressController,
              maxLines: 3,
              keyboardType: TextInputType.text,
              validator: (value){
                if(value!.isEmpty){
                  return "Billing Address should not be Empty";
                }
              },
              decoration: InputDecoration(
                hintText: 'Billing Address',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                focusedErrorBorder: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextFormField(
              controller: billingMobileController,
              maxLines: 1,
              keyboardType: TextInputType.number,
              maxLength: 10,
              validator: (value){
                if(value!.isEmpty){
                  return "Mobile No. should not be Empty";
                }
                if(value.length > 10 || value.length < 10){
                  return "Mobile No. Should be 10 Digit.";
                }
              },
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                counterText: '',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                focusedErrorBorder: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextFormField(
              controller: billingEmailController,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if(value!.isEmpty){
                  return "EmailId should not be Empty";
                }
                if(!value.contains('@')){
                  return "EmailId Should be Valid.";
                }
              },
              decoration: InputDecoration(
                hintText: 'Email',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                focusedErrorBorder: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),

            GestureDetector(
              onTap: () {

                if(billingKey.currentState!.validate()){
                  print('Shipping Address: ${billingAddressController.text.trim()}');
                  print('Shipping Mobile: ${billingMobileController.text.trim()}');
                  print('Shipping Email: ${billingEmailController.text.toLowerCase().trim()}');

                  userBillingShippingAddressController.getUserBillingAddress(
                      billingAddressController.text.trim(),
                      billingMobileController.text.trim(),
                      billingEmailController.text.toLowerCase().trim()
                  );

                  shippingAddressController.clear();
                  shippingMobileController.clear();
                  shippingEmailController.clear();

                  billingAddressController.clear();
                  billingMobileController.clear();
                  billingEmailController.clear();


                }
              },
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                  ),
                ),
              ),
            ),


            // MaterialButton(
            //   onPressed: (){},
            //   color: Colors.grey,
            //   child: Text(
            //       'Submit',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}
