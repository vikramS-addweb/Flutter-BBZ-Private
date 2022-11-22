

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../Components/ProgressBarCustom.dart';
import '../../Components/ElevatedButtonCustom.dart';
import '../Views/DrawerScreen.dart';
import '../Utils/Constant.dart';
import '../Components/BottomNavBarCustom.dart';
import '../Utils/Global.dart';
import 'BookingConfirmation.dart';


class Exam extends StatelessWidget {
  const Exam({Key? key}) : super(key: key);

  textIcon(IconData icon, String text, bool isBorder) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 10,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
          border: isBorder ? Border(
              bottom: BorderSide(
                width: 1,
                color: ColorStyle.grey_DAE1E7,
              )
          ) : Border()
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: ColorStyle.primaryColor_1570A5,
                size: 26,
              ),
              const SizedBox(width: 6),
              Expanded(child: Text(
                text,
                style: TextStylesCustom.textStyles_14.apply(
                  color: ColorStyle.grey_A8B0B5,
                  // fontWeightDelta: 1,
                ),
              ),),
              Icon(
                Icons.keyboard_arrow_down,
                color: ColorStyle.primaryColor_1570A5,
                size: 34,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyDrawer,
      backgroundColor: ColorStyle.white_F3F3F3,
      drawer: DrawerScreen(),
      appBar: AppBarStyle(
        title: 'Exams',
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
      // bottomNavigationBar: bottomNavBarCustom(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 475,
              child: Stack(
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
                          'Book Your Exam Now!',
                          style: TextStylesCustom.textStyles_26.apply(
                            color: Colors.white,
                            // fontWeightDelta: 1,
                          ),
                        ),
                        Text(
                          'Use the search filters to find specific courses faster and easier',
                          style: TextStylesCustom.textStyles_14.apply(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 40,),
                      ],
                    ),
                  ),
                  Container(
                    height: 320,
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
                                'Location, Date or Level',
                                style: TextStylesCustom.textStyles_16.apply(
                                  color: ColorStyle.grey_5E6D77,
                                  // fontWeightDelta: 1,
                                ),
                              ),
                              const SizedBox(height: 6,),
                              Text(
                                'Search everything here...',
                                style: TextStylesCustom.textStyles_16.apply(
                                  color: ColorStyle.primaryColor_1570A5.withOpacity(0.5),
                                  fontWeightDelta: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        textIcon(Icons.location_on, 'Select Your Center Location', true),
                        textIcon(Icons.calendar_today_sharp, 'Your Exam Date (from - to)', true),
                        textIcon(Icons.g_translate_rounded, 'Select Your Language Level', false),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ElevatedButtonCustom(
                        text: 'SEARCH',
                        size: const Size(180, 46),
                        onTap: () {
                          // controller.userLogin();
                          // Get.to(const Login());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 20
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40,),
                  Text(
                    'Upcoming Exams',
                    style: TextStylesCustom.textStyles_18.apply(
                      color: ColorStyle.primaryColor_1570A5,
                      fontWeightDelta: 1,
                    ),
                  ),
                  const SizedBox(height: 6,),
                  Text(
                    'All the coming exams for you',
                    style: TextStylesCustom.textStyles_14.apply(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40,),
                  ListView.separated(
                    itemCount: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Container(
                        // color: Colors.red,
                        height: 40,
                      );
                    },
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          BookingConfirmation().navigateToCustom(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorStyle.grey_DAE1E7
                              )
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    ImageStyle.pixabay,
                                    height: 250,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                  Positioned(
                                    top: 20,
                                    left: 0,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16
                                      ),
                                      decoration: BoxDecoration(
                                          color: ColorStyle.red_ED0925
                                      ),
                                      child: Text(
                                        'A2-B1',
                                        style: TextStylesCustom.textStyles_16.apply(
                                          color: Colors.white,
                                          fontWeightDelta: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 16,
                                    left: 16,
                                    child: Text(
                                      '7,50 €',
                                      style: TextStylesCustom.textStyles_22.apply(
                                        color: Colors.white,
                                        fontWeightDelta: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Zusatzleistung: Postversand - Zertifikate / Ergebnisbogen',
                                      style: TextStylesCustom.textStyles_14.apply(
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 12,),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: FittedBox(
                                                  child: Text(
                                                    'Exam Date: ',
                                                    style: TextStylesCustom.textStyles_14.apply(
                                                        color: Colors.black,
                                                        fontWeightDelta: 2
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: FittedBox(
                                                  child: Text(
                                                    '25/06/2022',
                                                    style: TextStylesCustom.textStyles_14.apply(
                                                      color: ColorStyle.primaryColor_1570A5,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: FittedBox(
                                                  child: Text(
                                                    'Exam Date: ',
                                                    style: TextStylesCustom.textStyles_14.apply(
                                                        color: Colors.black,
                                                        fontWeightDelta: 2
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: FittedBox(
                                                  // fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    '25/06/2022',
                                                    style: TextStylesCustom.textStyles_14.apply(
                                                      color: ColorStyle.brown_C16D00,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 14,),
                                        Expanded(
                                          child: Text(
                                            'Brüder Grimm Bildungscentrum e. V. Langstr. 60 63452 Hanau',
                                            style: TextStylesCustom.textStyles_13.apply(
                                              color: ColorStyle.primaryColor_1570A5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30,),
                                    Container(
                                      height: 1,
                                      color: ColorStyle.grey_DAE1E7,
                                    ),
                                    const SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Available Seats',
                                          style: TextStylesCustom.textStyles_14.apply(
                                            color: Colors.black,
                                          ),
                                        ),
                                        ProgressBarCircularCustom(
                                          text: '250',
                                          progress: 250,
                                          total: 400,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },)
                ],
              ),
            ),
          ],
        ),
      ),
      );
  }
}
