

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';

import '../Views/DrawerScreen.dart';
import '../Utils/Constant.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white_F3F3F3,
      key: keyDrawer,
      drawer: DrawerScreen(),
      appBar: AppBarStyle(
        title: 'About Us',
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
                  height: 170,
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
                        'Know Who we are!',
                        style: TextStylesCustom.textStyles_26.apply(
                          color: Colors.white,
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
                      top: 130,
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
                            left: 16,
                            right: 16,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The BBZ Language Schools are part of the Kiry Group of Companies, which has been working continuously and successfully in the areas of training, coaching and implementation of activation and placement measures since 1987. As an integration course provider recognized by the Federal Office for Migration and Refugees (BAMF), we offer courses at all levels at our locations in Koblenz, Bonn, Gelsenkirchen and Frankfurt am Main. Our services also include job-related German language support. Whether it's a classic integration course with or without literacy or specifically for second language learners, or job-related German language support - our focus is always on the language learner. With our needs-based German courses, experienced German language specialists specifically promote the basic skills of reading, listening, writing, and speaking. In addition, we deploy language support staff within various placement-oriented measures, e.g. KomBer (job-related language course with certificate), PerF or Aktivcenter as well as other offers in which the practical use of the German language in a professional context is trained or an initial assessment of German language skills takes place.",
                              style: TextStylesCustom.textStyles_12.apply(
                                color: ColorStyle.grey_5E6D77,
                                // fontWeightDelta: 1,
                              ),
                            ),

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
