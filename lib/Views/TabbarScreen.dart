import '../Controller/TabbarScreenController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Styles/ImageStyle.dart';
import '../Views/Exam.dart';
import '../Views/Profile.dart';
import 'package:custom_top_navigator/custom_scaffold.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import '../Utils/Constant.dart';
import '../Views/WelcomeScreen.dart';
import 'package:flutter/cupertino.dart';
import '../Components/BottomNavBarCustom.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';



class TabbarScreen extends StatefulWidget {
  TabbarScreen({Key? key}) : super(key: key);

  @override
  _TabbarScreenState createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  double iconSize = 24;

  final arrBody = [
    const Exam(),
    isLoggedIn ? Profile() : WelcomeScreen(),
  ];

  onTapItem(int index) {
    setState(() {
      indexSelectedTab.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TabbarScreenController(),
        builder: (auth) {
          return GetBuilder(
            init: TabbarScreenController(),
            initState: (_) {

            },
            builder: (auth) {
              return Obx(() => Scaffold(
                backgroundColor: Colors.white,
                body: arrBody[indexSelectedTab.value],
                // bottomNavigationBar: bottomNavBarCustom(),
              )
              );
            },
          );
        });
  }
}
