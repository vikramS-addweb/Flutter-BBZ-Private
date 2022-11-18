import '../Controller/TabbarScreenController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Styles/ImageStyle.dart';
import '../Views/Exam.dart';
import '../Views/Profile.dart';

class TabbarScreen extends StatelessWidget {
  final int? indexSelected;

  TabbarScreen({Key? key, this.indexSelected = 0}) : super(key: key);

  double iconSize = 24;

  final arrBody = [
    const Exam(),
    // const Exam(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabbarScreenController());

    return GetBuilder(
      init: TabbarScreenController(),
      builder: (auth) {
        return Obx(() => Scaffold(
              backgroundColor: Colors.white,
              body: arrBody[controller.index.value],
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.history_edu_rounded,
                      size: 24,
                      color: (controller.index.value == 0)
                          ? ColorStyle.primaryColor_1570A5
                          : ColorStyle.grey_5E6D77,
                    ),

                    //       Image.asset(
                    //         ImageStyle.Group1669,
                    // height: 24,
                    //         color: (controller.index.value == 0)
                    //             ? ColorStyle.primaryColor_1570A5
                    //             : ColorStyle.grey,
                    //       ),
                    label: 'Exam',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_circle,
                      size: 24,
                      color: (controller.index.value == 1)
                          ? ColorStyle.primaryColor_1570A5
                          : ColorStyle.grey_5E6D77,
                    ),

                    //       Image.asset(
                    //         ImageStyle.Group1669,
                    // height: 24,
                    //         color: (controller.index.value == 0)
                    //             ? ColorStyle.primaryColor_1570A5
                    //             : ColorStyle.grey,
                    //       ),
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
                currentIndex: controller.index.value,
                elevation: 0,
                onTap: (index) {
                  controller.index.value = index;
                },
              ),
            ));
      },
    );
  }
}
