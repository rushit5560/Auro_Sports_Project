import 'package:auro_sports_app/common/custom_drawer/drawer_controller.dart';
import 'package:auro_sports_app/pages/signin_page/signin_page.dart';
import 'package:auro_sports_app/pages/signup_page/signup_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUpController signUpController = Get.put(SignUpController());
  CustomDrawerController customDrawerController = Get.put(CustomDrawerController());

  @override
  Widget build(BuildContext context) {
    print('==========SignUp Page On==========');
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Obx(
        ()=> Scaffold(
          body: signUpController.isLoading.value
              ? Container(
                  width: Get.width,
                  height: Get.height,
                  color: Colors.transparent,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: CustomColor.kOrangeColor,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                )
              : SafeArea(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          signUpImage(),
                          SizedBox(height: 30),
                          signUpText(),
                          SizedBox(height: 20),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                userNameField(),
                                SizedBox(height: 10),
                                emailIdField(),
                                SizedBox(height: 10),
                                passwordField(),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          signUpButton(context),
                          SizedBox(height: 30),
                          signInText(context),
                          SizedBox(height: 20),
                          orText(),
                          SizedBox(height: 25),
                          socialButton(),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget signUpImage() {
    return Image(
      image: AssetImage('assets/images/signin_signup.png'),
      // fit: BoxFit.cover,
    );
  }

  Widget signUpText() {
    return Text(
      "Sign Up",
      style: TextStyle(
        color: CustomColor.kOrangeColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      // textScaleFactor: 1.5,
    );
  }

  Widget userNameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        cursorColor: CustomColor.kOrangeColor,
        decoration: InputDecoration(
          hintText: "UserName",
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orangeAccent),
              borderRadius: BorderRadius.circular(25)),
        ),
        controller: usernameController,
        validator: (value) {
          if (value!.isEmpty /* || value.length == null*/) {
            return "UserName cannot be empty";
          } else if (value.length < 6) {
            return "UserName Atleast 6 Character";
          }
        },
      ),
    );
  }

  Widget emailIdField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        cursorColor: CustomColor.kOrangeColor,
        decoration: InputDecoration(
          hintText: "Email Id",
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orangeAccent),
              borderRadius: BorderRadius.circular(25)),
        ),
        controller: emailController,
        validator: (value) {
          if (value!.isEmpty /* || value.length == null*/) {
            return "Email cannot be empty";
          } else if (!value.contains('@')) {
            return "Email Not valid";
          }
        },
      ),
    );
  }

  Widget passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        obscureText: signUpController.isObsecure.value,
        cursorColor: CustomColor.kOrangeColor,
        decoration: InputDecoration(
          hintText: "Password",
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orangeAccent),
              borderRadius: BorderRadius.circular(25)),
          suffixIcon: IconButton(
            onPressed: (){
              signUpController.isObsecure.value = !signUpController.isObsecure.value;
            },
            icon: signUpController.isObsecure.value
                ? Icon(Icons.visibility_off_rounded,color: CustomColor.kOrangeColor)
                : Icon(Icons.visibility_rounded,color: CustomColor.kOrangeColor),
          ),
        ),
        controller: passwordController,
        validator: (value) {
          if (value!.isEmpty /* || value.length == null*/) {
            return "Password cannot be empty";
          }
        },
      ),
    );
  }

  Widget signUpButton(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            FocusScope.of(context).requestFocus(new FocusNode());
            signUpController.getRegisterData(
              usernameController.text.trim(),
              emailController.text.trim(),
              passwordController.text.trim(),
            );
            customDrawerController.getUserDetailsFromPrefs();
            usernameController.clear();
            emailController.clear();
            passwordController.clear();

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
              'Sign Up',
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

  /*getRegisterData() async {
    setState(() => isLoading = true);

    String url = ApiUrl.RegisterApi;
    print('Url : $url');

    try {
      Map data = {
        "name": usernameController.text.trim(),
        "email": emailController.text.trim().toLowerCase(),
        "password": passwordController.text.trim(),
        "c_password": passwordController.text.trim(),
      };

      http.Response response = await http.post(
          Uri.parse(url),
          body: data,
      );
      print('Response1 : ${response.statusCode}');
      print('Response2 : ${response.body}');

      if(response.body == '{"success":false,"data":["The email has already been taken."]}') {
        print('Email Already Registered');
        Get.snackbar('Error!', 'Email Already Registered');
      }

      SignUpData signUpData = SignUpData.fromJson(json.decode(response.body));
      isStatus = signUpData.success;
      print('Response Bool : ${signUpData.success}');
      print('Status : $isStatus');

      if(isStatus){
        print('True True');
        var id = signUpData.data[0].id;
        var token = signUpData.data[0].rememberToken;
        print('id : $id \nToken : $token');
        CommonFunctions().setUserDetailsInPrefs(id, token);
        Get.offAll(() => IndexPage());
      } else {
        print('False False');
      }

    } catch(e) {
      print('Error1 : $e');
    }

    setState(() => isLoading = false);
  }*/

  Widget signInText(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already Account?',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Get.off(SignInPage());
            },
            child: Text(
              'Sign In',
              style: TextStyle(
                  color: CustomColor.kOrangeColor,
                  fontSize: 17,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }

  Widget orText() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Divider(
            thickness: 1,
            color: Colors.black,
            endIndent: 15,
            indent: 40,
          )),
          Text(
            'OR',
            style: TextStyle(color: CustomColor.kOrangeColor, fontSize: 17),
          ),
          Expanded(
              child: Divider(
            thickness: 1,
            color: Colors.black,
            indent: 15,
            endIndent: 40,
          )),
        ],
      ),
    );
  }

  Widget socialButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            print('Clicked On Facebook');
          },
          child: Image.asset(
            'assets/images/facebook.png',
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            print('Clicked On Twitter');
          },
          child: Image.asset(
            'assets/images/twitter.png',
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            print('Clicked On Google');
          },
          child: Image.asset(
            'assets/images/google.png',
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
      ],
    );
  }
}
