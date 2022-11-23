import 'package:bbz/Components/BGImage.dart';
import 'package:bbz/Controller/SignUpController.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:flutter/material.dart';
import '../../Components/AppBarStyle.dart';
import '../../Components/TextFieldBase.dart';
import '../../Components/PasswordFieldBase.dart';
import '../../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import '../../Styles/ImageStyle.dart';
import '../Views/Exam.dart';
import '../Views/TabbarScreen.dart';
import '../Views/WelcomeScreen.dart';
import '../../Controller/LoginController.dart';
import '../Views/SignUp.dart';
import '../Views/ResetPassword.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/EffectStyle.dart';
import '../../Components/TextFieldCustom.dart';
import '../../Components/TextRichCustom.dart';
import '../../Utils/Global.dart';
import '../../Components/BottomNavBarCustom.dart';
import 'PersistentBottomNavBarCustom.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController();
    return Scaffold(
      appBar: AppBarStyle(
        title: 'Sign Up',
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorStyle.primaryColor_1570A5,
          ),
          onPressed: () {
            navigateToBack(context);
          },
        ),
        styleTitle: TextStylesCustom.textStyles_16.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 2,
        ),
        elevation: 2,
      ),
      // bottomNavigationBar: bottomNavBarCustom(),
      body: Stack(
        children: [
          const BGImage(),
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 60),
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              decoration: boxDecorationAuthBox(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),

                  Row(
                    children: [
                      Expanded(
                        // -----------------------First Name Feild---------------------------->
                        child: TextFieldOutline(
                          controller: controller.firstName.value,
                          hintText: 'First Name',
                          textStyle: TextStylesCustom.textStyles_14
                              .apply(fontWeightDelta: -1),
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          colorBoder: ColorStyle.grey_DAE1E7,
                          radiusBorder: 4,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      // -----------------------Last Name Feild---------------------------->
                      Expanded(
                        child: TextFieldOutline(
                          controller: controller.lastName.value,
                          hintText: 'Last Name',
                          textStyle: TextStylesCustom.textStyles_14
                              .apply(fontWeightDelta: -1),
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          colorBoder: ColorStyle.grey_DAE1E7,
                          radiusBorder: 4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // -----------------------Email Feild---------------------------->
                  TextFieldOutline(
                    controller: controller.email.value,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email address',
                    textStyle: TextStylesCustom.textStyles_14
                        .apply(fontWeightDelta: -1),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    colorBoder: ColorStyle.grey_DAE1E7,
                    radiusBorder: 4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // -----------------------Mobile Feild---------------------------->
                  TextFieldOutline(
                    controller: controller.mobile.value,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Mobile Number',
                    textStyle: TextStylesCustom.textStyles_14
                        .apply(fontWeightDelta: -1),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    colorBoder: ColorStyle.grey_DAE1E7,
                    radiusBorder: 4,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // -----------------------Password Feild---------------------------->
                  TextFieldPWDOutline(
                    controller: controller.password.value,
                    hintText: 'Password',
                    textStyle: TextStylesCustom.textStyles_14
                        .apply(fontWeightDelta: -1),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    colorBoder: ColorStyle.grey_DAE1E7,
                    radiusBorder: 4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // -----------------------Password Feild---------------------------->
                  TextFieldPWDOutline(
                    controller: controller.cPassword.value,
                    hintText: 'Confirm Password',
                    textStyle: TextStylesCustom.textStyles_14
                        .apply(fontWeightDelta: -1),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    colorBoder: ColorStyle.grey_DAE1E7,
                    radiusBorder: 4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () => controller.RememberMe(),
                          child: Obx(
                            () => Icon(
                              controller.check.value
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: controller.check.value ? ColorStyle.primaryColor_1570A5 : ColorStyle.grey_DAE1E7,
                            ),
                          )),
                      const SizedBox(
                        width: 8,
                      ),
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

                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButtonCustom(
                    text: 'SIGN UP',
                    styleText: TextStylesCustom.textStyles_15.apply(
                        fontWeightDelta: 4
                    ),
                    size: Size(MediaQuery.of(context).size.width - 30, 50),
                    onTap: () {
                      controller.userSignUp();
                      // Get.to(const Login());
                    },
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  TextRichCustom(
                    textFirst: 'Already have an account? ',
                    textSecond: 'Log in',
                    onTap: () {
                      navigateToBack(context);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Continue as a Guest',
                            style: TextStylesCustom.textStyles_15
                                .apply(color: ColorStyle.primaryColor_1570A5)),
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
            ),
          )
        ],
      ),
    );
  }
}
