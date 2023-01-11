import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:bbz/Views/Exam.dart';
import 'package:bbz/Views/Profile.dart';
import 'package:bbz/Views/WelcomeScreen.dart';
import 'package:get/get.dart';
import 'package:bbz/Styles/ImageStyle.dart';
import '../Controller/ExamScreenController.dart';
import '../Controller/PersistentNavBarController.dart';
import '../Utils/Global.dart';
import '../Utils/Constant.dart';
import 'package:flutter/cupertino.dart';

class PersistentBottomNavBarCustom extends StatelessWidget {
  final int initialIndex;
  PersistentBottomNavBarCustom({Key? key, this.initialIndex = 1})
      : super(key: key);
  final controller = Get.put(PersistentNavBarController());

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
            child: Image.asset(
              ImageStyle.test,
              fit: BoxFit.fill,
              color: (indexSelectedTab.value == 0) &&
                      controller.isNavBarActive.value
                  ? ColorStyle.primaryColor_1570A5
                  : ColorStyle.grey_A8B0B5,
            )),
        title: ("Exam".tr),
        activeColorPrimary: controller.isNavBarActive.value
            ? ColorStyle.primaryColor_1570A5
            : ColorStyle.grey_5E6D77,
        inactiveColorPrimary: ColorStyle.grey_5E6D77,
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          width: 26,
          height: 18,
          child: Image.asset(
            ImageStyle.account,
            fit: BoxFit.fill,
            color:
                (indexSelectedTab.value == 1) && controller.isNavBarActive.value
                    ? ColorStyle.primaryColor_1570A5
                    : ColorStyle.grey_A8B0B5,
          ),
        ),
        title: ("Profile".tr),
        activeColorPrimary: controller.isNavBarActive.value
            ? ColorStyle.primaryColor_1570A5
            : ColorStyle.grey_5E6D77,
        inactiveColorPrimary: ColorStyle.grey_5E6D77,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: ((controller) => Obx(() => WillPopScope(
          onWillPop: () async {
            final navbarController = Get.find<PersistentNavBarController>();
            final examScreenController = Get.find<ExamScreenController>();
            if (webViewController1 != null) {
              if (await webViewController1.canGoBack()) {
                webViewController1.goBack();
                return false;
              }
            }
             if (navbarController.isNavBarActive.value &&
                indexSelectedTab.value == 1 && !examScreenController.inExamScreen.value) {
              SystemNavigator.pop();
              return false;
            }
         
            navbarController.isNavBarActive.value = true;
            print("After clicking the Android Back Button in persistentNavbar");
            return true;
          },
          child: PersistentTabView(
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
            decoration: const NavBarDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ]),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            popAllScreensOnTapAnyTabs: true,

            onItemSelected: (index) {
              print(index);
              controller.isNavBarActive.value = true;
              indexSelectedTab.value = index;
            },
            navBarStyle: NavBarStyle
                .style3, // Choose the nav bar style with this property.
          )))),
    );
  }
}
