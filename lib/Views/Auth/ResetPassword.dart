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

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBarStyless(
        title: 'Reset Your Password',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 30,
                  vertical: MediaQuery.of(context).size.width / 20,
                ),
                child: Text(
                    'Kindly enter your registered E-mail Address tocontinue to Reset your password.',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        // fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey))),
            // -----------------------Email Feild---------------------------->
            Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 30,
                ),
                child: TextFieldBase(
                  hintText: 'Email address',
                )),

            // -----------------------Login button---------------------------->
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 30,
                  vertical: MediaQuery.of(context).size.width / 10),
              child: ElevatedButtonCustom(
                onTap: () {},
                text: 'SEND PASSWORD RESET LINK',
                height: 50,
                width: MediaQuery.of(context).size.width,
                colorBG: Colors.blueAccent,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
