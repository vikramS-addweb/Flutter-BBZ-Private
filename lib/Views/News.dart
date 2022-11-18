

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';
import 'NewsDetail.dart';

import '../Views/DrawerScreen.dart';
import '../Utils/Constant.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      key: keyDrawer,
      drawer: DrawerScreen(),
      appBar: AppBarStyle(
        title: 'News',
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
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 32,
          bottom: 32
        ),
        itemCount: 10,
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return const SizedBox(
            // color: Colors.red,
            height: 40,
          );
        },
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Get.to(()=>NewsDetail());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ImageStyle.newArticle,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 25,),
                Text(
                  '03/30/022',
                  style: TextStylesCustom.textStyles_12.apply(
                    color: ColorStyle.primaryColor_1570A5,
                  ),
                ),
                const SizedBox(height: 7,),
                Text(
                  'Lorem ipsum dolor sit amet',
                  style: TextStylesCustom.textStyles_14.apply(
                    color: Colors.black,
                    fontWeightDelta: 1
                  ),
                ),
                const SizedBox(height: 9,),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
                  style: TextStylesCustom.textStyles_13.apply(
                      color: ColorStyle.grey_5E6D77,
                  ),
                ),
              ],
            ),
          );
        },),
    );
  }
}
