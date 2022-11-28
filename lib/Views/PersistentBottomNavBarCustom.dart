
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:bbz/Views/Exam.dart';
import 'package:bbz/Views/Profile.dart';
import 'package:bbz/Views/WelcomeScreen.dart';
import 'package:bbz/Views/ChangePassword.dart';
import 'package:bbz/Views/ContactUs.dart';
import 'package:get/get.dart';
import 'package:bbz/Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';

import '../Utils/Constant.dart';
import 'package:flutter/cupertino.dart';


class PersistentBottomNavBarCustom extends StatelessWidget {

  final int initialIndex;
  PersistentBottomNavBarCustom({Key? key,  this.initialIndex = 1}) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      const Exam(),
      isLoggedIn ? Profile() : WelcomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SizedBox(
            width: 26,
            height: 18,
            child: Image.asset(ImageStyle.test, fit: BoxFit.fill,)),
        // iconSize: 200,
        // icon: const I4con(Icons.settings),
        title: ("Exam"),
        // textStyle: TextStyle(
        //     fontSize: 0
        // ),
        activeColorPrimary: ColorStyle.primaryColor_1570A5,
        inactiveColorPrimary: ColorStyle.grey_5E6D77,
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          width: 26,
            height: 18,
          child: Image.asset(ImageStyle.account, fit: BoxFit.fill,),
        ),
        title: ("Profile"),
        // textStyle: TextStylesCustom.textStyles_12,
        activeColorPrimary: ColorStyle.primaryColor_1570A5,
        inactiveColorPrimary: ColorStyle.grey_5E6D77,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: initialIndex),
        screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      navBarHeight: 70,
      decoration: const NavBarDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ]
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,

      // itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
      //   duration: Duration(milliseconds: 200),
      //   curve: Curves.ease,
      // ),
      // screenimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
      //   duration: Duration(milliseconds: 200),
      //   curve: Curves.ease,
      // ),
      // screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
      //   animateTabTransition: true,
      //   curve: Curves.ease,
      //   duration: Duration(milliseconds: 200),
      // ),

      navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}



