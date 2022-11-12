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
import '../Auth/Login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBarStyless(
        title: 'Sing Up',
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
            // --------------user first name feild--------------------------->
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 30,
                    ),
                    child: TextFieldBase(
                      hintText: 'First Name',
                      feildwidth: MediaQuery.of(context).size.width / 2.5,
                    )),
                Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 30,
                    ),
                    child: TextFieldBase(
                      hintText: 'Last Name',
                      feildwidth: MediaQuery.of(context).size.width / 2.5,
                    )),
              ],
            ),
            // -----------------------Email Feild---------------------------->
            Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 30,
                    vertical: MediaQuery.of(context).size.width / 20),
                child: TextFieldBase(
                  hintText: 'Email address',
                )),

            // -----------------------Password Feild---------------------------->
            Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 30,
                    vertical: MediaQuery.of(context).size.width / 40),
                child: PasswordFieldBase(
                  hintText: 'Password',
                )),

            // -----------------------Confirm Password Feild---------------------------->
            Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 30,
                    vertical: MediaQuery.of(context).size.width / 40),
                child: PasswordFieldBase(
                  hintText: 'Confirm password',
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
                      "I have read and accept the Terms andPrivacy Policy",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                // TextButton(
                //     onPressed: () => {},
                //     child: Text('Forgot Password?',
                //         style: TextStyle(
                //             fontFamily: 'Poppins',
                //             // fontSize: 20,
                //             fontWeight: FontWeight.normal,
                //             color: Colors.blueAccent))),
              ],
            ),

            // -----------------------Login button---------------------------->
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 30,
                  vertical: MediaQuery.of(context).size.width / 30),
              child: ElevatedButtonCustom(
                onTap: () {},
                text: 'SIGN UP',
                height: 50,
                width: MediaQuery.of(context).size.width,
                colorBG: Colors.blueAccent,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                    onPressed: () => Get.to(Login()),
                    child: Text('Log in',
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
