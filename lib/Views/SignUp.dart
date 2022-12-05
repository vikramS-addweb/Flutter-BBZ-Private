import 'package:bbz/Components/BGImage.dart';
import 'package:bbz/Controller/SignUpController.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:bbz/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
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
  SignUp({super.key});

  final controller = SignUpController();
  final fromkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

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
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              decoration: boxDecorationAuthBox(),
              child: Form(
                key: fromkey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          // -----------------------First Name Feild---------------------------->
                          child: TextFormFieldOutline(
                            controller: controller.firstName.value,
                            hintText: 'First Name',
                            textStyle: TextStylesCustom.textStyles_14.apply(fontWeightDelta: -1),
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            colorBoder: ColorStyle.grey_DAE1E7,
                            radiusBorder: 4,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "First name is required";
                              } else if (!GetUtils.isAlphabetOnly(value)){
                                return " The first name must only contain letters";
                              }
                              else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        // -----------------------Last Name Feild---------------------------->
                        Expanded(
                          child: TextFormFieldOutline(
                            controller: controller.lastName.value,
                            hintText: 'Last Name',
                            textStyle: TextStylesCustom.textStyles_14
                                .apply(fontWeightDelta: -1),
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            colorBoder: ColorStyle.grey_DAE1E7,
                            radiusBorder: 4,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Last name is required";
                              } else if (!GetUtils.isAlphabetOnly(value)){
                                return " The last name must only contain letters";
                              }
                              else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // -----------------------Email Feild---------------------------->
                    TextFormFieldOutline(
                      controller: controller.email.value,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Email address',
                      textStyle: TextStylesCustom.textStyles_14
                          .apply(fontWeightDelta: -1),
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      colorBoder: ColorStyle.grey_DAE1E7,
                      radiusBorder: 4,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        } if (!GetUtils.isEmail(value)) {
                          return "Email is invalid";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // -----------------------Mobile Feild---------------------------->
                    TextFormFieldOutline(
                      controller: controller.mobile.value,
                      keyboardType: TextInputType.phone,
                      hintText: 'Mobile Number',
                      textStyle: TextStylesCustom.textStyles_14
                          .apply(fontWeightDelta: -1),
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      colorBoder: ColorStyle.grey_DAE1E7,
                      radiusBorder: 4,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mobile number is required";
                        } else if (value.length < 9 || value.length >13) {
                          return "Phone must be between 9 and 13 digits";
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // -----------------------Password Feild---------------------------->
                    TextFormFieldPWDOutline(
                      controller: controller.password.value,
                      hintText: 'Password',
                      textStyle: TextStylesCustom.textStyles_14
                          .apply(fontWeightDelta: -1),
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      colorBoder: ColorStyle.grey_DAE1E7,
                      radiusBorder: 4,
                      validator: (value) {
                        RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

                        if (value!.isEmpty) {
                          return "Password is required.";
                        } else if (value.length < 8){
                          return "Password should have atleast 8 characters";
                        }
                        // else if (!regex.hasMatch(value)) {
                        //   return "Password should have atleast 8 characters.";
                        // }
                        else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // -----------------------Password Feild---------------------------->
                    TextFormFieldPWDOutline(
                      controller: controller.cPassword.value,
                      hintText: 'Confirm Password',
                      textStyle: TextStylesCustom.textStyles_14
                          .apply(fontWeightDelta: -1),
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      colorBoder: ColorStyle.grey_DAE1E7,
                      radiusBorder: 4,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm password is required.";
                        } else if (controller.password.value.text != controller.cPassword.value.text) {
                          return "Password and confirm password must be same.";
                        } else {
                          return null;
                        }
                      },
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
                            fontWeightdelta: 0,
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
                        debugPrint('Save is clicking ...');

                        if (fromkey.currentState!.validate()) {
                          if(controller.check.value) {
                            controller.userSignUp();
                            // debugPrint('validation done');
                          }else{
                            'Terms and Privacy Policy is Required'.showError();
                          }
                        }

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
                        indexSelectedTab.value = 0;
                        PersistentBottomNavBarCustom(initialIndex: 0,).navigateToCustom(context, withNavBar: false);
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
