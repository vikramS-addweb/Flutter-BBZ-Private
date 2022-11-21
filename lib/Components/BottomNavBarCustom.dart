
import '../Controller/TabbarScreenController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Styles/ImageStyle.dart';
import '../Views/Exam.dart';
import '../Views/Profile.dart';
import 'package:custom_top_navigator/custom_scaffold.dart';
import '../Utils/Constant.dart';
import '../Views/WelcomeScreen.dart';
import 'package:flutter/cupertino.dart';


BottomNavigationBar bottomNavBarCustom() {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: SizedBox(
          width: 24,
          height: 24,
          child: Image.asset(ImageStyle.test,fit: BoxFit.fill,
          color: (indexSelectedTab.value == 0)
              ? ColorStyle.primaryColor_1570A5
              : ColorStyle.grey_5E6D77,
          ),
        ),
        label: 'Exam',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.account_circle,
          size: 24,
          color: (indexSelectedTab.value == 1)
              ? ColorStyle.primaryColor_1570A5
              : ColorStyle.grey_5E6D77,
        ),
        label: 'Profile',
      ),
    ],
    selectedLabelStyle: TextStylesCustom.textStyles_14.apply(
      fontWeightDelta: 1,
    ),
    unselectedLabelStyle: TextStylesCustom.textStyles_14.apply(
      fontWeightDelta: 1,
    ),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: ColorStyle.primaryColor_1570A5,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
    currentIndex: indexSelectedTab.value,
    elevation: 0,
    onTap: (index) {
      indexSelectedTab.value = index;

      switch (index) {
        case 0:
          Get.offAll(const Exam());
          break;
        case 1:
          Get.offAll(isLoggedIn ? Profile() : const WelcomeScreen(),);
          break;
        default:
          break;
      }
    },
  );
}