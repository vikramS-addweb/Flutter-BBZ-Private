import 'package:bbz/Components/BGImage.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:bbz/Utils/Constant.dart';
import 'package:flutter/material.dart';
import '../Components/AppBarStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import '../Controller/ExamScreenController.dart';
import '../Controller/PersistentNavBarController.dart';
import 'PersistentBottomNavBarCustom.dart';
import '../Controller/LoginController.dart';
import '../Views/SignUp.dart';
import '../Views/ResetPassword.dart';
import '../Styles/TextStyles.dart';
import '../Components/TextFieldCustom.dart';
import '../Components/TextRichCustom.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Utils/Global.dart';
import 'package:focus_detector/focus_detector.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final fromkey = GlobalKey<FormState>();
  final controller = LoginController();

  void viewWillAppear() {
    print("onResume / viewWillAppear / onFocusGained");
  }

  void viewWillDisappear() {
    print("onPause / viewWillDisappear / onFocusLost");

    fromkey.currentState!.reset();
  }

  @override
  void initState() {
    final examScreenController = Get.find<ExamScreenController>();
    examScreenController.inExamScreen.value = false;
    super.initState();
  }

  @override
  void dispose() {
    final examScreenController = Get.find<ExamScreenController>();
    examScreenController.inExamScreen.value = true;
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: viewWillAppear,
      onFocusLost: viewWillDisappear,
      child: Scaffold(
        appBar: AppBarStyle(
          title: 'Log In'.tr,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ColorStyle.primaryColor_1570A5,
            ),
            onPressed: () {
                final navbarController = Get.find<PersistentNavBarController>();
              navbarController.isNavBarActive.value = true;
            final examScreenController = Get.find<ExamScreenController>();
            examScreenController.inExamScreen.value = true;
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
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                decoration: boxDecorationAuthBox(),
                child: Form(
                  key: fromkey,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: () {},
                  child: Column(
                    children: [
                      // -----------------------Email Feild---------------------------->
                      const SizedBox(
                        height: 30,
                      ),

                      TextFormFieldOutline(
                        controller: controller.useremail.value,
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

                      // -----------------------Password Feild---------------------------->
                      TextFormFieldPWDOutline(
                        controller: controller.userPassword.value,
                        hintText: 'Password'.tr,
                        textStyle: TextStylesCustom.textStyles_14
                            .apply(fontWeightDelta: -1),
                        padding: const EdgeInsets.only(right: 16),
                        colorBoder: ColorStyle.grey_DAE1E7,
                        radiusBorder: 4,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required".tr;
                          } else if (value.length < 8) {
                            return "Password must be at least 8 characters".tr;
                          } else {
                            return null;
                          }
                        },
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
                                      color: controller.check3.value
                                          ? ColorStyle.primaryColor_1570A5
                                          : ColorStyle.grey_DAE1E7,
                                    ),
                                  )),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Remember me'.tr,
                                style: TextStylesCustom.textStyles_12,
                              ),
                            ],
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              elevation: 0,
                              padding: const EdgeInsets.only(
                                right: 0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              'Forgot Password?'.tr,
                              textAlign: TextAlign.right,
                              style: TextStylesCustom.textStyles_12,
                            ),
                            onPressed: () =>
                                ResetPassword().navigateToCustom(context),
                          ),
                        ],
                      ),

                      // -----------------------Login button---------------------------->

                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButtonCustom(
                        text: 'LOGIN'.tr,
                        styleText: TextStylesCustom.textStyles_15
                            .apply(fontWeightDelta: 4),
                        size: Size(MediaQuery.of(context).size.width - 30, 50),
                        onTap: () {
                          // fromkey.currentState!.reset();

                          if (fromkey.currentState!.validate()) {
                            debugPrint('yay you logged in successfully');
                            controller.userLogin();
                          }
                          // controller.validation();
                          // Get.to(const Login());
                        },
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      FittedBox(
                        child: TextRichCustom(
                          textFirst: 'Do not have an account?'.tr + ' ',
                          textSecond: 'Sign Up'.tr,
                          onTap: () {
                            SignUp().navigateToCustom(context);
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
      ),
    );
  }
}


// class Login extends StatelessWidget {
//   Login({super.key});
//
//   final fromkey = GlobalKey<FormState>();
//   final controller = LoginController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarStyle(
//         title: 'Log In',
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: ColorStyle.primaryColor_1570A5,
//           ),
//           onPressed: () {
//             navigateToBack(context);
//           },
//         ),
//         styleTitle: TextStylesCustom.textStyles_16.apply(
//           color: ColorStyle.primaryColor_1570A5,
//           fontWeightDelta: 2,
//         ),
//         elevation: 2,
//       ),
//       // bottomNavigationBar: bottomNavBarCustom(),
//       body: Stack(
//         children: [
//           const BGImage(),
//           SingleChildScrollView(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: Container(
//               margin: const EdgeInsets.only(top: 30),
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
//               decoration: boxDecorationAuthBox(),
//               child: Form(
//                 key: fromkey,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 onChanged: () {
//
//                 },
//                 child: Column(
//                   children: [
//                     // -----------------------Email Feild---------------------------->
//                     const SizedBox(
//                       height: 30,
//                     ),
//
//                     TextFormFieldOutline(
//                       controller: controller.useremail.value,
//                       keyboardType: TextInputType.emailAddress,
//                       hintText: 'Email address',
//                       textStyle: TextStylesCustom.textStyles_14
//                           .apply(fontWeightDelta: -1),
//                       padding: const EdgeInsets.only(left: 16, right: 16),
//                       colorBoder: ColorStyle.grey_DAE1E7,
//                       radiusBorder: 4,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Email is required";
//                         }else if(!GetUtils.isEmail(value)){
//                           return "Email is invalid";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//
//                     const SizedBox(
//                       height: 20,
//                     ),
//
//                     // -----------------------Password Feild---------------------------->
//                     TextFormFieldPWDOutline(
//                       controller: controller.userPassword.value,
//                       hintText: 'Password',
//                       textStyle: TextStylesCustom.textStyles_14
//                           .apply(fontWeightDelta: -1),
//                       padding: const EdgeInsets.only(left: 16, right: 16),
//                       colorBoder: ColorStyle.grey_DAE1E7,
//                       radiusBorder: 4,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Password is required";
//                         }else if(value.length < 8){
//                           return "Password must be at least 8 characters";
//                         }
//                         else {
//                           return null;
//                         }
//                       },
//                     ),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           // mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             InkWell(
//                                 onTap: () => controller.RememberMe(),
//                                 child: Obx(
//                                       () => Icon(
//                                     controller.check3.value
//                                         ? Icons.check_box
//                                         : Icons.check_box_outline_blank,
//                                     color: controller.check3.value ? ColorStyle.primaryColor_1570A5 : ColorStyle.grey_DAE1E7,
//                                   ),
//                                 )),
//                             const SizedBox(
//                               width: 8,
//                             ),
//                             Text(
//                               'Remember Me',
//                               style: TextStylesCustom.textStyles_12,
//                             ),
//                           ],
//                         ),
//                         TextButton(
//                           style: TextButton.styleFrom(
//                             elevation: 0,
//                             padding: const EdgeInsets.only(
//                               right: 0,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                           ),
//                           child: Text(
//                             'Forgot Password ?',
//                             textAlign: TextAlign.right,
//                             style: TextStylesCustom.textStyles_12,
//                           ),
//                           onPressed: () =>
//                               ResetPassword().navigateToCustom(context),
//                         ),
//                       ],
//                     ),
//
//                     // -----------------------Login button---------------------------->
//
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     ElevatedButtonCustom(
//                       text: 'LOGIN',
//                       styleText: TextStylesCustom.textStyles_15.apply(
//                           fontWeightDelta: 4
//                       ),
//                       size: Size(MediaQuery.of(context).size.width - 30, 50),
//                       onTap: () {
//                         // fromkey.currentState!.reset();
//
//                         if(fromkey.currentState!.validate()) {
//                           debugPrint('yay you logged in successfully');
//                           controller.userLogin();
//                         }
//                         // controller.validation();
//                         // Get.to(const Login());
//                       },
//                     ),
//
//                     const SizedBox(
//                       height: 16,
//                     ),
//
//                     TextRichCustom(
//                       textFirst: 'Do not have an account? ',
//                       textSecond: 'Sign Up',
//                       onTap: () {
//                         SignUp().navigateToCustom(context);
//                       },
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     InkWell(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                               'Continue as a Guest',
//                               style: TextStylesCustom.textStyles_15
//                                   .apply(color: ColorStyle.primaryColor_1570A5)
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Image.asset(
//                             ImageStyle.right_Arrow,
//                             width: 20,
//                           ),
//                         ],
//                       ),
//                       onTap: () {
//                         indexSelectedTab.value = 0;
//                         PersistentBottomNavBarCustom(initialIndex: 0,).navigateToCustom(context, withNavBar: false);
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
