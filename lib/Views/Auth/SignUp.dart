import 'package:bbz/Components/BGImage.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:flutter/material.dart';
import '../../Components/AppBarStyle.dart';
import '../../Components/TextFieldBase.dart';
import '../../Components/PasswordFieldBase.dart';
import '../../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import '../../Styles/ImageStyle.dart';
import '../WelcomeScreen.dart';
import '../../Controller/LoginController.dart';
import '../Auth/SignUp.dart';
import '../Auth/ResetPassword.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/EffectStyle.dart';
import '../../Components/TextFieldCustom.dart';
import '../../Components/TextRichCustom.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarStyle(
        title: 'Sign Up',
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorStyle.primaryColor_1570A5,),
          onPressed: () {
            Get.back();
          },
        ),
        styleTitle: TextStylesCustom.textStyles_16.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
        ),
        elevation: 2,
      ),
      body: Stack(
        children: [
          const BGImage(),
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                left: 20, right: 20
            ),
            child: Container(
              margin: const EdgeInsets.only(
                  top: 30
              ),
              padding:  const EdgeInsets.only(
                  left: 20, right: 20, bottom: 30
              ),
              decoration: boxDecorationAuthBox(),
              child: Column(
                children: [
                  // -----------------------Email Feild---------------------------->
                  const SizedBox(height: 30,),

                  Row(
                    children: [
                      Expanded(
                        child: TextFieldOutline(
                          hintText: 'First Name',
                          textStyle: TextStylesCustom.textStyles_14.apply(
                              fontWeightDelta: -1
                          ),
                          padding: const EdgeInsets.only(
                              left: 16, right: 16
                          ),
                          colorBoder: ColorStyle.grey_DAE1E7,
                          radiusBorder: 4,
                        ),
                      ),
                      SizedBox(width: 16,),
                      Expanded(
                        child: TextFieldOutline(
                          hintText: 'Last Name',
                          textStyle: TextStylesCustom.textStyles_14.apply(
                              fontWeightDelta: -1
                          ),
                          padding: const EdgeInsets.only(
                              left: 16, right: 16
                          ),
                          colorBoder: ColorStyle.grey_DAE1E7,
                          radiusBorder: 4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  TextFieldOutline(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email address',
                    textStyle: TextStylesCustom.textStyles_14.apply(
                        fontWeightDelta: -1
                    ),
                    padding: const EdgeInsets.only(
                        left: 16, right: 16
                    ),
                    colorBoder: ColorStyle.grey_DAE1E7,
                    radiusBorder: 4,
                  ),

                  const SizedBox(height: 20,),

                  // -----------------------Password Feild---------------------------->
                  TextFieldPWDOutline(
                    hintText: 'Password',
                    textStyle: TextStylesCustom.textStyles_14.apply(
                        fontWeightDelta: -1
                    ),
                    padding: const EdgeInsets.only(
                        left: 16, right: 16
                    ),
                    colorBoder: ColorStyle.grey_DAE1E7,
                    radiusBorder: 4,
                  ),
                  const SizedBox(height: 20,),

                  // -----------------------Password Feild---------------------------->
                  TextFieldPWDOutline(
                    hintText: 'Confirm Password',
                    textStyle: TextStylesCustom.textStyles_14.apply(
                        fontWeightDelta: -1
                    ),
                    padding: const EdgeInsets.only(
                        left: 16, right: 16
                    ),
                    colorBoder: ColorStyle.grey_DAE1E7,
                    radiusBorder: 4,
                  ),
                  const SizedBox(height: 20,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_box, color: ColorStyle.primaryColor_1570A5,),
                      const SizedBox(width: 8,),
                      Expanded(
                        child: TextRichCustom(
                          textFirst: 'I have read and accept the ',
                          textSecond: 'Terms and Privacy Policy',
                          onTap: () {
                            // Get.to(const SignUp());
                          },
                        ),
                      ),
                    ],
                  ),

                  // -----------------------Login button---------------------------->



                  const SizedBox(height: 30,),
                  ElevatedButtonCustom(
                    text: 'SIGN UP',
                    onTap: () {
                      // Get.to(const Login());
                    },
                  ),

                  const SizedBox(height: 16,),

                  TextRichCustom(
                    textFirst: 'Already have an account? ',
                    textSecond: 'Log in',
                    onTap: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Continue as a Guest',
                            style: TextStylesCustom.textStyles_14.apply(
                                color: ColorStyle.primaryColor_1570A5
                            )
                        ),
                        const SizedBox(width: 10,),
                        Image.asset(ImageStyle.right_Arrow, width: 20,),
                      ],
                    ),
                    onTap: () {

                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
