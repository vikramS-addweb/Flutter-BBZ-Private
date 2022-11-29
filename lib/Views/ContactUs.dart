import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../../Components/ElevatedButtonCustom.dart';
import '../Components/TextFieldCustom.dart';
import 'Profile.dart';
import '../Controller/ContactUsController.dart';
import '../Views/DrawerScreen.dart';
import '../Utils/Constant.dart';
import '../Components/BottomNavBarCustom.dart';


class ContactUs extends StatelessWidget {

  final controller = ContactUsController();
  ContactUs({Key? key}) : super(key: key);
  final arrIcons = [
    // const Icon(Icons.location_on),
    SvgPicture.asset(ImageStyle.bookingConfirmation_location, height: 30,),
    SvgPicture.asset(ImageStyle.contactCall,),
    // const Icon(Icons.call),
    // Icon(Icons.fax_outlined),
     Image.asset(ImageStyle.fax,),

    const Icon(Icons.language),
  ];
  final arrTitle = [
    'BBZ Altenkirchen GmbH & Co. KG Konrad-Adenauer-Platz 5 57610 Altenkirchen',
    '02681 8797-0',
    '02681 8797-111',
    'www.bbz-altenkirchen.de'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white_F3F3F3,
      key: keyDrawer,
      drawer: DrawerScreen(),
      appBar: AppBarStyle(
        title: 'Contact Us',
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
        // trailings: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.account_circle_outlined,
        //       color: ColorStyle.primaryColor_1570A5,
        //       size: 30,
        //     ),
        //     onPressed: () {
        //       Get.to(()=> Profile());
        //     },
        //   ),
        // ],
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
            Container(
              height: 645,
              child: Stack(
                children: [
                  Image.asset(
                    ImageStyle.examBG,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 37,
                        ),
                        Text(
                          "We'd love to hear from you",
                          style: TextStylesCustom.textStyles_22.apply(
                            color: Colors.white,
                            // fontWeightDelta: 1,
                          ),
                        ),
                        Text(
                          "Send us a message and we'll respond as soon as possible",
                          style: TextStylesCustom.textStyles_14.apply(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 470,
                    width: Get.mediaQuery.size.width,
                    margin:
                        const EdgeInsets.only(top: 150, left: 16, right: 16),
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 15,
                      right: 15,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: ColorStyle.grey_DAE1E7,
                            // spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldOutline(
                          controller: controller.userName.value,
                          hintText: 'Your Name',
                          textStyle: TextStylesCustom.textStyles_14,
                          colorText: ColorStyle.grey_DAE1E7,
                          colorBoder: ColorStyle.grey_DAE1E7,
                          radiusBorder: 4,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 13),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldOutline(
                          controller: controller.userEmail.value,
                          hintText: 'Email address',
                          textStyle: TextStylesCustom.textStyles_14,
                          colorText: ColorStyle.grey_DAE1E7,
                          colorBoder: ColorStyle.grey_DAE1E7,
                          radiusBorder: 4,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 13),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldOutline(
                          controller: controller.userMessage.value,
                          hintText: 'Message',
                          textStyle: TextStylesCustom.textStyles_14,
                          colorText: ColorStyle.grey_DAE1E7,
                          colorBoder: ColorStyle.grey_DAE1E7,
                          radiusBorder: 4,
                          maxLines: 8,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 13),
                        ),
                        const SizedBox(
                          height: 60,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ElevatedButtonCustom(
                        text: 'SEND MESSAGE',
                        size: const Size(200, 46),
                        onTap: () {
                          controller.validation();
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
              height: 37,
            ),
            Container(
              width: double.infinity,
              // height: 500,
              padding: const EdgeInsets.all(10),
              color: ColorStyle.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: Get.mediaQuery.size.width,
                    height: 5,
                    color: ColorStyle.primaryColor_1570A5,
                  ),
                  Container(
                    // height: 300,
                    width: Get.mediaQuery.size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    color: ColorStyle.primaryColor_1570A5.withOpacity(0.16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              ImageStyle.logoBBZ,
                              height: 70,
                              width: 80,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'BBZ Language Schools',
                                  style: TextStylesCustom.textStyles_16.apply(
                                      color: ColorStyle.primaryColor_1570A5,
                                      fontWeightDelta: 1),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                    'are a subsidiary of BBZ Altenkirchen GmbH & Co. KG',
                                    style: TextStylesCustom.textStyles_12
                                        .apply(fontWeightDelta: 1)),
                              ],
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),

                  // ---------------------------------------------------Contact us container ----------------------------->
                  Container(
                    width: Get.mediaQuery.size.width,
                    height: 1,
                    color: ColorStyle.primaryColor_1570A5,
                  ),
                  Container(
                    // height: 300,
                    width: Get.mediaQuery.size.width,
                    padding: const EdgeInsets.all(20),
                    color: ColorStyle.primaryColor_1570A5.withOpacity(0.16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Us',
                          style: TextStylesCustom.textStyles_16
                              .apply(fontWeightDelta: 1),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Deutschtest für Zuwanderer (DTZ / A2-B1)(PR-220409-HU-DTZ)',
                          style: TextStylesCustom.textStyles_12,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.separated(
                          itemCount: arrTitle.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.only(top:4.0),
                                //   child: arrIcons[index],
                                // ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    top: 0
                                  ),
                                  child: Container( width: 27,height: 20, child: Row(
                                    children: [
                                      arrIcons[index],
                                      Expanded(child: SizedBox(
                                        width: 10,
                                      ),)
                                    ],
                                  )),
                                ),
                                Expanded(
                                    child: Text(
                                  arrTitle[index],
                                  style: TextStylesCustom.textStyles_12.apply(
                                      color: ColorStyle.primaryColor_1570A5),
                                ))
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
