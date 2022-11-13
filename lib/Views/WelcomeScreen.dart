import 'package:bbz/Styles/ColorStyle.dart';
import 'package:bbz/Styles/ImageStyle.dart';
import 'package:flutter/material.dart';
import '../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import '../Views/Auth/Login.dart';
import '../Components/BGImage.dart';
import '../Views/Auth/SignUp.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/TextRichCustom.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        title: 'Log In/Sign Up',
        styleTitle: TextStylesCustom.textStyles_14.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
        ),
        elevation: 2,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Text('Welcome To BBZ!',
                  style: TextStylesCustom.textStyles_26.apply(
                      color: ColorStyle.primaryColor_1570A5,
                      fontWeightDelta: 1
                  )
              ),
              const SizedBox(height: 10,),
              Text(
                  textAlign: TextAlign.center,
                  'Login/Sign Up to get your profile and stayupdated with the upcoming exams and news.',
                  style: TextStylesCustom.textStyles_13.apply(
                      color: ColorStyle.grey_5E6D77,
                  )
              ),
              const SizedBox(height: 50,),
              ElevatedButtonCustom(
                text: 'LOGIN',
                size: Size(MediaQuery.of(context).size.width - 30, 50),
                onTap: () {
                  Get.to(const Login());
                },
              ),
              const SizedBox(height: 16,),
              TextRichCustom(
                textFirst: 'Do not have an account? ',
                textSecond: 'SignUp',
                onTap: () {
                  Get.to(const SignUp());
                },
              ),
              const SizedBox(height: 10,),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageStyle.left_Arrow, width: 20,),
                    const SizedBox(width: 10,),
                    Text(
                        'Continue as a Guest',
                        style: TextStylesCustom.textStyles_14.apply(
                            color: ColorStyle.primaryColor_1570A5
                        )
                    ),
                  ],
                ),
                onTap: () {

                },
              )
            ],
          )),
    );
  }
}
