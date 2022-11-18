

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../../Components/ElevatedButtonCustom.dart';
import '../Components/TextFieldCustom.dart';
import 'Profile.dart';


class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

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
          ) : const Border()
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
      backgroundColor: ColorStyle.white_F3F3F3,
      appBar: AppBarStyle(
        title: 'Contact Us',
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: ColorStyle.primaryColor_1570A5,
            size: 30,
          ),
          onPressed: () {

          },
        ),
        trailings: [
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              color: ColorStyle.primaryColor_1570A5,
              size: 30,
            ),
            onPressed: () {
              Get.to(()=> Profile());
            },
          ),
        ],
        styleTitle: TextStylesCustom.textStyles_22.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 695,
              child: Stack(
                children: [
                  Image.asset(
                    ImageStyle.examBG,
                    height: 240,
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
                          "We'd love to hear from you",
                          style: TextStylesCustom.textStyles_26.apply(
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
                        const SizedBox(height: 40,),
                      ],
                    ),
                  ),
                  Container(
                    height: 470,
                    width: Get.mediaQuery.size.width,
                    margin: const EdgeInsets.only(
                        top: 200,
                        left: 16,
                        right: 16
                    ),
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
                            offset: const Offset(0, 0), // changes position of shadow
                          ),
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldOutline(
                          hintText: 'Your Name',
                          textStyle: TextStylesCustom.textStyles_14,
                          colorText: ColorStyle.grey_DAE1E7,
                          colorBoder: ColorStyle.grey_DAE1E7,
                          radiusBorder: 4,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                        ),
                      const SizedBox(height: 16,),
                        TextFieldOutline(
                          hintText: 'Email address',
                          textStyle: TextStylesCustom.textStyles_14,
                          colorText: ColorStyle.grey_DAE1E7,
                          colorBoder: ColorStyle.grey_DAE1E7,
                          radiusBorder: 4,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                        ),
                        const SizedBox(height: 16,),

                        const SizedBox(height: 16,),
                        TextFieldOutline(
                          hintText: 'Message',
                          textStyle: TextStylesCustom.textStyles_14,
                          colorText: ColorStyle.grey_DAE1E7,
                          colorBoder: ColorStyle.grey_DAE1E7,
                          radiusBorder: 4,
                          maxLines: 8,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                        ),
                        const SizedBox(height: 60,)
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

          ],
        ),
      ),
    );
  }
}
