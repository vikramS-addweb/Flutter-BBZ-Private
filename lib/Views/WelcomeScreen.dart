import 'package:flutter/material.dart';
import '../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import '../Views/Auth/Login.dart';
import '../Components/BackgroundImg.dart';
import '../Views/Auth/Singup.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.only(top: 50),
        child: Center(
            child: BgImage(
          Column(
            children: [
              Container(
                  // margin: EdgeInsets.symmetric(
                  //     horizontal: MediaQuery.of(context).size.width / 8),
                  child: Text('Welcome To BBZ!',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.blueAccent,
                          fontSize: 35))),
              Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width / 30),
                  child: Text(
                      textAlign: TextAlign.center,
                      'Login/Sign Up to get your profile and stayupdated with the upcoming exams and news.',
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                          fontSize: 15))),
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
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextButton(
                      onPressed: () => Get.to(SignUp()),
                      child: Text('Sign Up',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              color: Colors.blueAccent))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.blue.shade400,
                  ),
                  TextButton(
                      onPressed: () => {},
                      child: Text('Continue as a Guest',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.blueAccent))),
                ],
              )
            ],
          ),
        )));
  }
}
