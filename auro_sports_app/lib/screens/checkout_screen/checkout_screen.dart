import 'package:auro_sports_app/common/custom_color.dart';

// import 'package:auro_sports_app/pages/order_tracking_page/order_tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/checkout_screen_controller/checkout_controller.dart';

// Old UI
/*class CheckOutPage extends StatelessWidget {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cardNoController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            paymentMethod(),
            SizedBox(height: 20),
            paymentDetails(),
            SizedBox(height: 25),
            paymentButton(),
          ],
        ),
      ),
    );
  }

  Widget paymentMethod() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('Clicked On Paypal');
                    },
                    child: Image(
                      image: AssetImage('assets/images/paypal.png'),

                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('Clicked On Visa');
                    },
                    child: Image(
                      image: AssetImage('assets/images/visa.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('Clicked On Master Card');
                    },
                    child: Image(
                      image: AssetImage('assets/images/mastercard.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('Clicked On Cash On Delivery');
                    },
                    child: Image(
                      image: AssetImage('assets/images/cod.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key:  formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Method',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 15),
            cardNoField(),
            SizedBox(height: 15),
            expAndCvv(),
            SizedBox(height: 15),
            cardHolderNameField(),
          ],
        ),
      ),
    );
  }

  Widget cardNoField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Card No.',
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
            maxLength: 16,
            decoration: InputDecoration(
              // hintText: "Full Name",
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              counterText: '',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.circular(25)),
            ),
            controllers: cardNoController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Card No. cannot be empty";
              }
              if(value.length < 16 || value.length > 16){
                return "Card Should be valid.";
              }
            },
          ),
        ),
      ],
    );
  }

  Widget expAndCvv() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Exp. Date',
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
                    hintText: 'MM/YY',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orangeAccent),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  controllers: expDateController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Date cannot be empty";
                    } else if(!value.contains('/')) {
                      return 'Date Format is Not valid';
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'CVV',
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
                  maxLength: 3,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: '000',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    counterText: '',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orangeAccent),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  controllers: cvvController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "CVV cannot be empty";
                    } else if(value.length != 3) {
                      return 'CVV Must be in 3 Digit';
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget cardHolderNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Card Holder Name',
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
            controllers: cardHolderNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Card Holder Name cannot be empty";
              }
            },
          ),
        ),
      ],
    );
  }

  Widget paymentButton() {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            print('Inside formkey');
            Get.to(OrderTrackingPage());
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
                  'Payment',
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
}*/

// New UI
enum PaymentMethod { COD, Prepaid }

class CheckOutScreen extends StatefulWidget {
  // const CheckOutPage({Key? key}) : super(key: key);
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  CheckOutController checkOutController = Get.put(CheckOutController());

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController orderNoteController = TextEditingController();

  PaymentMethod pMethod = PaymentMethod.COD;
  String pMethod1 = 'COD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),
      body: Obx(
        () => checkOutController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: CustomColor.kOrangeColor,
                  backgroundColor: Colors.grey,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // FName & LName
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: fNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "First Name can not be Empty";
                                  }
                                },
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'First Name',
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  errorBorder: OutlineInputBorder(),
                                  focusedErrorBorder: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: lNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Last Name can not be Empty";
                                  }
                                },
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'Last Name',
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  errorBorder: OutlineInputBorder(),
                                  focusedErrorBorder: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),

                        // Address Field
                        TextFormField(
                          controller: addressController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Address can not be Empty";
                            }
                          },
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.grey,
                          maxLines: 3,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(12),
                            hintText: 'Address',
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(),
                            focusedErrorBorder: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 15),

                        // City & State Field
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: cityController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "City can not be Empty";
                                  }
                                },
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'City',
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  errorBorder: OutlineInputBorder(),
                                  focusedErrorBorder: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: stateController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "State can not be Empty";
                                  }
                                },
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'State',
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  errorBorder: OutlineInputBorder(),
                                  focusedErrorBorder: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),

                        // Phone No Field
                        TextFormField(
                          controller: phoneNoController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Phone No. can not be Empty";
                            }
                            if (value.length != 10) {
                              return "Phone No. should be Valid";
                            }
                          },
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(12),
                            hintText: 'Phone no.',
                            counterText: '',
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(),
                            focusedErrorBorder: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 15),

                        // Email Field
                        TextFormField(
                          controller: emailIdController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email can not be Empty";
                            }
                            if (!value.contains('@')) {
                              return "Email should be valid";
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(12),
                            hintText: 'Email Id',
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(),
                            focusedErrorBorder: OutlineInputBorder(),
                          ),
                        ),

                        // Cod OR Prepaid Select
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(
                                      activeColor: CustomColor.kOrangeColor,
                                      value: PaymentMethod.COD,
                                      groupValue: pMethod,
                                      onChanged: (PaymentMethod? value) {
                                        setState(() {
                                          pMethod = value!;
                                          pMethod1 = 'COD';
                                        });
                                        print('$pMethod1');
                                      },
                                    ),
                                    Text('Cash On Delivery',
                                        textScaleFactor: 1.1),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(
                                      activeColor: CustomColor.kOrangeColor,
                                      value: PaymentMethod.Prepaid,
                                      groupValue: pMethod,
                                      onChanged: (PaymentMethod? value) {
                                        setState(() {
                                          pMethod = value!;
                                          pMethod1 = 'PREPAID';
                                        });
                                        print('$pMethod1');
                                      },
                                    ),
                                    Text('Prepaid', textScaleFactor: 1.1),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ),

                        // orderNote Field
                        TextFormField(
                          controller: orderNoteController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Order Note can not be Empty";
                            }
                          },
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.grey,
                          maxLines: 3,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(12),
                            hintText: 'Order Note',
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(),
                            focusedErrorBorder: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 30),

                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              print('${fNameController.text.trim()}\n'
                                  '${lNameController.text.trim()}\n'
                                  '${addressController.text.trim()}\n'
                                  '${cityController.text.trim()}\n'
                                  '${stateController.text.trim()}\n'
                                  '${phoneNoController.text.trim()}\n'
                                  '${emailIdController.text.trim()}\n'
                                  '$pMethod1\n'
                                  '${orderNoteController.text.trim()}');

                              checkOutController.getAddOrder(
                                  fName: fNameController.text.trim(),
                                  lName: lNameController.text.trim(),
                                  address: addressController.text.trim(),
                                  city: cityController.text.trim(),
                                  state: stateController.text.trim(),
                                  phoneNo: phoneNoController.text.trim(),
                                  email: emailIdController.text.trim(),
                                  orderNote: pMethod1,
                                  orderType: orderNoteController.text.trim());
                            }
                          },
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CustomColor.kOrangeColor),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  'Place Order',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
