import 'package:bbz/Components/BackgroundImg.dart';
import 'package:flutter/material.dart';
import '../../Components/AppBarStyle.dart';
import '../../Components/TextFieldBase.dart';
import '../../Components/PasswordFieldBase.dart';
import '../../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import '../WelcomeScreen.dart';
import '../../Controller/Login_controller.dart';
import '../Auth/Singup.dart';
import '../Auth/ResetPassword.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBarStyless(
        title: 'Log In',
        titleColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: BgImage(Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 40,
        ),
        // color: Colors.white,
        child: Column(
          children: [
            // -----------------------Email Feild---------------------------->
            Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 30,
                ),
                child: TextFieldBase(
                  hintText: 'Email address',
                )),

            // -----------------------Password Feild---------------------------->
            Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 30,
                    vertical: MediaQuery.of(context).size.width / 20),
                child: PasswordFieldBase(
                  hintText: 'Password',
                )),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: controller.check3.value,
                      onChanged: (value) {
                        controller.check3.value = !controller.check3.value;
                      },
                    ),
                    Text(
                      "Remember Me",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () => Get.to(ResetPassword()),
                    child: Text('Forgot Password?',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            // fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.blueAccent))),
              ],
            ),

            // -----------------------Login button---------------------------->
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 30,
                  vertical: MediaQuery.of(context).size.width / 30),
              child: ElevatedButtonCustom(
                onTap: () {
                  Get.to(Login());
                },
                text: 'LOGIN',
                height: 50,
                width: MediaQuery.of(context).size.width,
                colorBG: Colors.blueAccent,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Do not have an account?',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                    onPressed: () => Get.to(SignUp()),
                    child: Text('Sign Up',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.blueAccent))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => {},
                    child: Text('Continue as a Guest',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.blueAccent))),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.blue.shade400,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
