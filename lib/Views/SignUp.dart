import 'package:bbz/Components/BGImage.dart';
import 'package:bbz/Controller/SignUpController.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:bbz/Utils/Constant.dart';
import 'package:bbz/Views/Login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../Components/AppBarStyle.dart';
import '../../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import '../../Styles/ImageStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/EffectStyle.dart';
import '../../Components/TextFieldCustom.dart';
import '../../Components/TextRichCustom.dart';
import '../../Utils/Global.dart';
import '../Controller/ExamScreenController.dart';
import '../Controller/PersistentNavBarController.dart';
import 'PersistentBottomNavBarCustom.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final controller = SignUpController();

  final fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        title: 'Sign Up'.tr,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorStyle.primaryColor_1570A5,
          ),
          onPressed: () {
            final navbarController = Get.find<PersistentNavBarController>();
            navbarController.isNavBarActive.value = true;
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
                            hintText: 'First Name'.tr,
                            textStyle: TextStylesCustom.textStyles_14
                                .apply(fontWeightDelta: -1),
                            padding: const EdgeInsets.only(right: 16),
                            colorBoder: ColorStyle.grey_DAE1E7,
                            radiusBorder: 4,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "First name is required".tr;
                              } else if (!alphaSpace.hasMatch(value)) {
                                return "First name should have letters".tr;
                              } else if (value![0] == ' ') {
                                // controller.userMessage.value.text = '';
                                return "Can't start with space".tr;
                              } else {
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
                            hintText: 'Last Name'.tr,
                            textStyle: TextStylesCustom.textStyles_14
                                .apply(fontWeightDelta: -1),
                            padding: const EdgeInsets.only(right: 16),
                            colorBoder: ColorStyle.grey_DAE1E7,
                            radiusBorder: 4,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Last name is required".tr;
                              } else if (!alphaSpace.hasMatch(value)) {
                                return "Last name should have letters".tr;
                              } else if (value![0] == ' ') {
                                // controller.userMessage.value.text = '';
                                return "Can't start with space".tr;
                              } else {
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
                      hintText: 'Email address'.tr,
                      formatInput: true,
                      textStyle: TextStylesCustom.textStyles_14
                          .apply(fontWeightDelta: -1),
                      padding: const EdgeInsets.only(right: 16),
                      colorBoder: ColorStyle.grey_DAE1E7,
                      radiusBorder: 4,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required".tr;
                        } else if (!GetUtils.isEmail(value)) {
                          return "Email is invalid".tr;
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
                      keyboardType: TextInputType.number,
                      hintText: 'Mobile Number'.tr,
                      textStyle: TextStylesCustom.textStyles_14
                          .apply(fontWeightDelta: -1),
                      padding: const EdgeInsets.only(right: 16),
                      colorBoder: ColorStyle.grey_DAE1E7,
                      radiusBorder: 4,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mobile number is required".tr;
                        } else if (!value.isNum) {
                          return "Phone must contain number only".tr;
                        } else if (value.length < 9) {
                          return "Min digit should be 9".tr;
                        } else if (value.length > 14) {
                          return "Max digit should be 14".tr;
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
                      hintText: 'Password'.tr,
                      textStyle: TextStylesCustom.textStyles_14
                          .apply(fontWeightDelta: -1),
                      padding: const EdgeInsets.only(right: 16),
                      colorBoder: ColorStyle.grey_DAE1E7,
                      radiusBorder: 4,
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

                        if (value!.isEmpty) {
                          return "Password is required".tr;
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters".tr;
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
                      hintText: 'Confirm Password'.tr,
                      textStyle: TextStylesCustom.textStyles_14
                          .apply(fontWeightDelta: -1),
                      padding: const EdgeInsets.only(right: 16),
                      colorBoder: ColorStyle.grey_DAE1E7,
                      radiusBorder: 4,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm password is required".tr;
                        } else if (controller.password.value.text !=
                            controller.cPassword.value.text) {
                          return "Password and confirm password must be same"
                              .tr;
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
                            onTap: () => controller.isTermsConditions(),
                            child: Obx(
                              () => Icon(
                                controller.check.value
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color: controller.check.value
                                    ? ColorStyle.primaryColor_1570A5
                                    : ColorStyle.grey_DAE1E7,
                              ),
                            )),
                        const SizedBox(
                          width: 8,
                        ),
                        // Expanded(
                        //   child: TextRichCustom(
                        //     textFirst: 'I have read and accept the ',
                        //     textSecond: 'Terms and Conditions',
                        //     fontWeightdelta: 0,
                        //     onTap: () {
                        //       // Get.to(const SignUp());
                        //     },
                        //   ),
                        // ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              // text: 'I have read the ',
                              // style: TextStylesCustom.textStyles_12,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'I have read and accept the '.tr + ' ',
                                    style: TextStylesCustom.textStyles_15
                                        .apply(color: Colors.black)),
                                TextSpan(
                                    text: 'Terms and Conditions'.tr,
                                    style: TextStylesCustom.textStyles_15.apply(
                                      color: ColorStyle.primaryColor_1570A5,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async => {
                                            if (Get.locale
                                                .toString()
                                                .contains('de'))
                                              {
                                                await launchUrl(Uri.parse(
                                                    'https://www.sprachtestcenter.de/de/page/terms-and-conditions'))
                                              }
                                            else
                                              {
                                                await launchUrl(Uri.parse(
                                                    'https://www.sprachtestcenter.de/page/terms-and-conditions'))
                                              }
                                          }),
                                TextSpan(
                                    text: ' ' + 'and'.tr + ' ',
                                    style: TextStylesCustom.textStyles_15
                                        .apply(color: Colors.black)),
                                TextSpan(
                                    text: 'Privacy Policy'.tr,
                                    style: TextStylesCustom.textStyles_15.apply(
                                        color: ColorStyle.primaryColor_1570A5),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async => {
                                            if (Get.locale
                                                .toString()
                                                .contains('de'))
                                              {
                                                await launchUrl(Uri.parse(
                                                    'https://www.sprachtestcenter.de/de/page/privacy-policy'))
                                              }
                                            else
                                              {
                                                await launchUrl(Uri.parse(
                                                    'https://www.sprachtestcenter.de/page/privacy-policy'))
                                              }
                                          }),
                                // TextSpan(text: ' and agree to the storage of the above data. ', style: TextStylesCustom.textStyles_15.apply(color: Colors.black)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                    // -----------------------Login button---------------------------->

                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButtonCustom(
                      text: 'SIGN UP'.tr,
                      styleText: TextStylesCustom.textStyles_15
                          .apply(fontWeightDelta: 4),
                      size: Size(MediaQuery.of(context).size.width - 30, 50),
                      onTap: () {
                        debugPrint('Save is clicking ...');
                        // controller.userSignUp();

                        if (fromkey.currentState!.validate()) {
                          if (controller.check.value) {
                            controller.userSignUp();
                          } else {
                            'The terms and conditions field is required'
                                .tr
                                .showError();
                          }
                        }
                        return;
                      },
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    FittedBox(
                      child: TextRichCustom(
                        textFirst: 'Already have an account?'.tr + ' ',
                        textSecond: 'Log in'.tr,
                        onTap: () {
                          Login().navigateToCustom(context);
                          // navigateToBack(context);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Continue as a Guest'.tr,
                              style: TextStylesCustom.textStyles_15.apply(
                                  color: ColorStyle.primaryColor_1570A5)),
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
                        PersistentBottomNavBarCustom(
                          initialIndex: 0,
                        ).navigateToCustom(context, withNavBar: false);
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
