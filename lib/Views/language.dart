import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/ColorStyle.dart';
import '../Utils/Global.dart';
import '../Styles/TextStyles.dart';
import '../Components/ElevatedButtonCustom.dart';
import './DrawerScreen.dart';
import '../Utils/Global.dart';

class Language extends StatelessWidget {
  Language({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> keyDrawer = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: keyDrawer,
        drawer: DrawerScreen(),
                  appBar: AppBarStyle(
                    title: 'languages',

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
                    styleTitle: TextStylesCustom.textStyles_16.apply(
                      color: ColorStyle.primaryColor_1570A5,
                      fontWeightDelta: 1,
                    ),
                    elevation: 2,
                  ),
                  body: Container(
                    color: ColorStyle.grey_DAE1E7,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        ElevatedButtonCustoms(text: 'English',onTap: (){},width: Get.size.width, colorBG: ColorStyle.primaryColor_1570A5,),
                        SizedBox(height: 20,),
                        ElevatedButtonCustoms(text: 'Deutsch',onTap: (){},width: Get.size.width, colorBG: Colors.white, colorText: Colors.black,),
                      ],
                    ),
                  ));
  }
}
