import '../Controller/TabbarScreenController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Styles/ImageStyle.dart';
import '../Views/Exam.dart';
import '../Views/Profile.dart';
// import 'package:custom_top_navigator/custom_scaffold.dart';
import '../Utils/Constant.dart';
import '../Views/WelcomeScreen.dart';
import 'package:flutter/cupertino.dart';
import '../Components/BottomNavBarCustom.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({Key? key}) : super(key: key);

  @override
  _TabbarScreenState createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  double iconSize = 24;

  final arrBody = [
    const Exam(),
    isLoggedIn ? Profile() : const WelcomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TabbarScreenController(),
        builder: (auth) {
          return GetBuilder(
            init: TabbarScreenController(),
            builder: (auth) {
              return Obx(() => Scaffold(
                    backgroundColor: Colors.white,
                    body: arrBody[indexSelectedTab.value],
                    // bottomNavigationBar: bottomNavBarCustom()
                  ));
            },
          );
        });
  }
}
