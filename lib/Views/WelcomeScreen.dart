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
import 'Exam.dart';
import '../Utils/Global.dart';
import '../Utils/Constant.dart';
import '../Components/BottomNavBarCustom.dart';
import '../Views/PersistentBottomNavBarCustom.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Controller/WelcomeController.dart';
import './language.dart';
// import '../Controller/PersistentNavBarController.dart';
// isBackOnAuth.value = true;





class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final controller = Get.put(WelcomeController());
  // final navBarController = Get.put(PersistentNavBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        initState: (state){
          // navBarController.isNavBarActive.value = true;
        },
        init: controller,
        builder: (controller) {
      return Obx(() => Scaffold(
        appBar: AppBarStyle(
          title: 'Log In/Sign Up'.tr,
          styleTitle: TextStylesCustom.textStyles_14.apply(
            color: ColorStyle.primaryColor_1570A5,
            fontWeightDelta: 2,
          ),
          elevation: 2,

          leading: controller.isBackVisible.value ? IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ColorStyle.primaryColor_1570A5,
            ),
            onPressed: () {
              indexSelectedTab.value = 0;
              PersistentBottomNavBarCustom(initialIndex: 0,).navigateToCustom(context, withNavBar: false);
            },
          ) : const SizedBox(width: 0,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
            Language().navigateToCustom(context);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50))
          ),
          label:Text(' Choose language'.tr, style: TextStylesCustom.textStyles_14,),
          icon: SvgPicture.asset(ImageStyle.welcomeLanguage, height: 30,),
          backgroundColor: ColorStyle.primaryColor_1570A5,
        ),
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
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: IconButton(
                  //     icon: Icon(
                  //       Icons.g_translate_outlined,
                  //       size: 40,
                  //       color: ColorStyle.primaryColor_1570A5,
                  //     ),
                  //     onPressed: () {
                  //
                  //     },
                  //   ),
                  // ),
                  Text(
                      'Welcome To BBZ!'.tr,
                      style: TextStylesCustom.textStyles_26.apply(
                          color: ColorStyle.primaryColor_1570A5,
                          fontWeightDelta: 1)
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      textAlign: TextAlign.center,
                      'Login/Sign Up to get your profile and stay updated with the upcoming exams and news.'.tr,
                      style: TextStylesCustom.textStyles_13.apply(
                        color: ColorStyle.grey_5E6D77,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButtonCustom(
                    text: 'LOGIN'.tr,
                    styleText: TextStylesCustom.textStyles_15.apply(
                        fontWeightDelta: 4
                    ),
                    size: Size(MediaQuery.of(context).size.width, 50),
                    onTap: () {
                      controller.isBackVisible.value = true;
                      Login().navigateToCustom(context);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextRichCustom(
                    textFirst: 'Do not have an account? '.tr,
                    textSecond: 'Sign Up'.tr,
                    fontWeightdelta: 0,
                    onTap: () {
                      controller.isBackVisible.value = true;
                       SignUp().navigateToCustom(context);
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
                            'Continue as a Guest'.tr,
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
                      controller.isBackVisible.value = true;
                      indexSelectedTab.value = 0;
                      PersistentBottomNavBarCustom(initialIndex: 0,).navigateToCustom(context, withNavBar: false);
                    },
                  )
                ],
              ),
            )
        ),
      ));
    });


  }
}


