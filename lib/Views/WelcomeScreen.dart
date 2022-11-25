import 'package:bbz/Styles/ColorStyle.dart';
import 'package:bbz/Styles/ImageStyle.dart';
import 'package:bbz/Views/BookingHistory.dart';
import 'package:bbz/Views/Exam.dart';
import 'package:flutter/material.dart';
import '../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import 'Login.dart';
import '../Components/BGImage.dart';
import '../Views/SignUp.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/TextRichCustom.dart';
import 'TabbarScreen.dart';
import '../Utils/Global.dart';
import '../Utils/Constant.dart';
import '../Components/BottomNavBarCustom.dart';
import '../Views/PersistentBottomNavBarCustom.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        title: 'Log In/Sign Up',
        styleTitle: TextStylesCustom.textStyles_14.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 2,
        ),
        elevation: 2,
      ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // Add your onPressed code here!
        //   },
        //   backgroundColor: ColorStyle.white,
        //   child: SvgPicture.asset(ImageStyle.language, fit: BoxFit.fill,),
        // ),
      // bottomNavigationBar: bottomNavBarCustom(),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.g_translate_outlined,
                      size: 40,
                      color: ColorStyle.primaryColor_1570A5,
                    ),
                    onPressed: () {

                    },
                  ),
                ),
                Text(
                    'Welcome To BBZ!',
                    style: TextStylesCustom.textStyles_26.apply(
                        color: ColorStyle.primaryColor_1570A5,
                        fontWeightDelta: 1)
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    textAlign: TextAlign.center,
                    'Login/Sign Up to get your profile and stayupdated with the upcoming exams and news.',
                    style: TextStylesCustom.textStyles_13.apply(
                      color: ColorStyle.grey_5E6D77,
                    )),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButtonCustom(
                  text: 'LOGIN',
                  styleText: TextStylesCustom.textStyles_15.apply(
                    fontWeightDelta: 4
                  ),
                  size: Size(MediaQuery.of(context).size.width, 50),
                  onTap: () {
                    const Login().navigateToCustom(context);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextRichCustom(
                  textFirst: 'Do not have an account? ',
                  textSecond: 'Sign Up',
                  fontWeightdelta: 0,
                  onTap: () {
                    const SignUp().navigateToCustom(context);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                          'Continue as a Guest',
                          style: TextStylesCustom.textStyles_14
                              .apply(color: ColorStyle.primaryColor_1570A5)
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        ImageStyle.right_Arrow,
                        width: 20,
                      ),
                    ],
                  ),
                  onTap: () {
                    PersistentBottomNavBarCustom().navigateToCustom(context, withNavBar: false);
                  },
                )
              ],
            ),
          )
      ),
    );
  }
}


