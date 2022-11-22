
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



class PersistentBottomNavBarCustom extends StatelessWidget {
  PersistentBottomNavBarCustom({Key? key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      const Exam(),
      const WelcomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(ImageStyle.test),
        iconSize: 130,
        // icon: const I4con(Icons.settings),
        title: ("Home"),
        textStyle: TextStyle(
            fontSize: 0
        ),
        activeColorPrimary: ColorStyle.primaryColor_1570A5,
        inactiveColorPrimary: ColorStyle.grey_5E6D77,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("Settings"),
        textStyle: TextStyle(
          fontSize: 0
        ),
        activeColorPrimary: ColorStyle.primaryColor_1570A5,
        inactiveColorPrimary: ColorStyle.grey_5E6D77,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: 0),
      // padding: const NavBarPadding.only(
      //     top: 10,
      //     bottom: 10,
      //     left: 0,
      //     right: 0
      // ),

      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
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
      // navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}



