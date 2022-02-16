import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/common/custom_drawer/drawer_controller.dart';
import 'package:auro_sports_app/controllers/signin_screen_controller/signin_controller.dart';
import 'package:auro_sports_app/screens/signup_screen/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  SignInController signInController = Get.put(SignInController());
  CustomDrawerController customDrawerController = Get.put(CustomDrawerController());

  @override
  Widget build(BuildContext context) {
    print('SignIn Page On');
    return Scaffold(
      body: Obx(
        ()=> signInController.isLoading.value ? Container(
          child: Center(
            child: CircularProgressIndicator(color: CustomColor.kOrangeColor),
          ),
        ) : SafeArea(
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                signInImage(),
                SizedBox(height: 30),

                signInText(),
                SizedBox(height: 20),

                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      emailIdField(),
                      SizedBox(height: 10),

                      passwordField(),
                      SizedBox(height: 10),

                    ],
                  ),
                ),
                SizedBox(height: 10),

                rememberPass(),
                SizedBox(height: 10),

                loginButton(context),
                SizedBox(height: 30),

                signUpText(context),
                SizedBox(height: 20),

                orText(),
                SizedBox(height: 25),

                socialButton(),
              ],
            ),
          )),
        ),
      ),
    );
  }

  Widget signInImage() {
    return Image(
      image: AssetImage('assets/images/signin_signup.png'),
      // fit: BoxFit.cover,
    );
  }

  Widget signInText() {
    return Text(
      "Sign In",
      style: TextStyle(
        color: CustomColor.kOrangeColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      // textScaleFactor: 1.5,
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
    return Obx(
      ()=> Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          obscureText: signInController.isObsecure.value,
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
                signInController.isObsecure.value = !signInController.isObsecure.value;
              },
              icon: signInController.isObsecure.value
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
      ),
    );
  }

  Widget rememberPass() {
    // bool isChecked = false;

    return Padding(
      padding: const EdgeInsets.only(left: 6,right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Checkbox(
                  activeColor: CustomColor.kOrangeColor,
                  checkColor: Colors.white,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                      print(isChecked);
                    });
                  },
                ),
                Text('Remember Password?'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {print('Clicked On Forgot Password?');},
            child: Text('Forgot Password?',
            style: TextStyle(
              decoration: TextDecoration.underline,
              // fontSize: 17
            ),),
          ),
        ],
      ),
    );
  }

  Widget loginButton(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () async {
          if (formKey.currentState!.validate()) {
            FocusScope.of(context).requestFocus(new FocusNode());

            signInController.getSignInData(
                emailController.text.trim(),
                passwordController.text.trim(),
            );
            await customDrawerController.getUserDetailsFromPrefs();
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
                  'Login',
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

  Widget signUpText(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'have Not Account?',
            style: TextStyle(/*color: Colors.black,*/ fontSize: 17),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
              Get.off(SignUpScreen());
            },
            child: Text(
              'Sign Up',
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
          onTap: () {print('Clicked On Facebook');},
          child: Image.asset(
            'assets/images/facebook.png',
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {print('Clicked On Twitter');},
          child: Image.asset(
            'assets/images/twitter.png',
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {print('Clicked On Google');},
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
