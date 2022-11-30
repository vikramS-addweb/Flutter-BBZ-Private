

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';

import '../Views/DrawerScreen.dart';
import '../Utils/Constant.dart';

import '../Components/BottomNavBarCustom.dart';

class HowWeWork extends StatelessWidget {
   HowWeWork({Key? key}) : super(key: key);

   GlobalKey<ScaffoldState> keyDrawer = GlobalKey();

  final demoData = [
    {
      'assetImageWidget': ImageStyle.registration,
      'title':'Registration',
    },
    {
      'assetImageWidget': ImageStyle.gradingTest,
      'title':'Grading Test',
    },
    {
      'assetImageWidget': ImageStyle.education,
      'title':'Education',
    },
    {
      'assetImageWidget': ImageStyle.examTraining,
      'title':'Exam Training',
    },
    {
      'assetImageWidget': ImageStyle.exam,
      'title':'Exam',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white_F3F3F3,
      key: keyDrawer,
      drawer: DrawerScreen(),
      // bottomNavigationBar: bottomNavBarCustom(),
      appBar: AppBarStyle(
        title: 'How We Work',
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: ColorStyle.primaryColor_1570A5,
            size: 30,
          ),
          onPressed: () {
            keyDrawer.currentState!.openDrawer();
          },
        ),
        styleTitle: TextStylesCustom.textStyles_22.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  ImageStyle.examBG,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 16,
                      right: 16
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      Text(
                        'Our process for your better understanding',
                        style: TextStylesCustom.textStyles_24.apply(
                          color: Colors.white,
                          heightDelta: 1,
                          heightFactor: 0
                          // fontWeightDelta: 1,
                        ),
                      ),

                      const SizedBox(height: 40,),
                    ],
                  ),
                ),
                Container(
                  // height: 320,
                  width: Get.mediaQuery.size.width,
                  margin: const EdgeInsets.only(
                      top: 140,
                      left: 16,
                      right: 16
                  ),
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: ColorStyle.grey_DAE1E7,
                          // spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 0), // changes position of shadow
                        ),
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 16
                        ),
                        width: Get.mediaQuery.size.width,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  width: 2,
                                  color: ColorStyle.grey_DAE1E7,
                                )
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...demoData.map((e) => Container(
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                              decoration:   BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                   BoxShadow(
                                    color: ColorStyle.grey_DAE1E7.withOpacity(0.5),
                                    blurRadius: 10.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 10,),
                                  Image.asset(
                                    e['assetImageWidget']!,
                                    height: 70,
                                    width: 70 ,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(width: 16,),
                                  Text(e['title']!, style: TextStylesCustom.textStyles_14.apply(color: ColorStyle.primaryColor_1570A5),),
                                ],
                              ),
                            )).toList()
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}
