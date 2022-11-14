import 'package:bbz/Components/BGImage.dart';
import 'package:bbz/Controller/SignUpController.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:flutter/material.dart';
import '../../Components/AppBarStyle.dart';
import '../../Components/TextFieldBase.dart';
import '../../Components/PasswordFieldBase.dart';
import '../../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import '../WelcomeScreen.dart';
import '../../Controller/LoginController.dart';
import '../Auth/SignUp.dart';
import '../Auth/ResetPassword.dart';
import '../../Styles/TextStyles.dart';
import '../../Components/TextFieldCustom.dart';
import '../../Components/TextRichCustom.dart';
import '../../Styles/ImageStyle.dart';
import '../../Styles/EffectStyle.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();
    return Scaffold(
      appBar: AppBarStyle(
        title: 'Log In',
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorStyle.primaryColor_1570A5,
          ),
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              decoration: boxDecorationAuthBox(),
              child: Column(
                children: [
                  // -----------------------Email Feild---------------------------->
                  const SizedBox(
                    height: 30,
                  ),

                  TextFieldOutline(
                    controller: controller.useremail.value,
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

                  // -----------------------Password Feild---------------------------->
                  TextFieldPWDOutline(
                    controller: controller.userPassword.value,
                    hintText: 'Password',
                    textStyle: TextStylesCustom.textStyles_14
                        .apply(fontWeightDelta: -1),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    colorBoder: ColorStyle.grey_DAE1E7,
                    radiusBorder: 4,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () => controller.RememberMe(),
                              child: Obx(
                                () => Icon(
                                  controller.check3.value
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: ColorStyle.primaryColor_1570A5,
                                ),
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Remember Me',
                            style: TextStylesCustom.textStyles_12,
                          ),
                        ],
                      ),
                      TextButton(
                        child: Text(
                          'Forgot Password ?',
                          textAlign: TextAlign.right,
                          style: TextStylesCustom.textStyles_12,
                        ),
                        onPressed: () => Get.to(const ResetPassword()),
                      ),
                    ],
                  ),

                  // -----------------------Login button---------------------------->

                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButtonCustom(
                    text: 'LOGIN',
                    size: Size(MediaQuery.of(context).size.width - 30, 50),
                    onTap: () {
                      controller.validation();
                      // Get.to(const Login());
                    },
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  TextRichCustom(
                    textFirst: 'Do not have an account? ',
                    textSecond: 'SignUp',
                    onTap: () {
                      Get.to(const SignUp());
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
                            style: TextStylesCustom.textStyles_14
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
                    onTap: () {},
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
