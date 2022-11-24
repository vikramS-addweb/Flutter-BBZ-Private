import 'package:bbz/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Utils/Global.dart';
import '../Styles/ImageStyle.dart';
import 'DrawerScreen.dart';

class Location extends StatelessWidget {
  Location({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyDrawer,
      drawer: DrawerScreen(),
      appBar: AppBarStyle(
        title: 'Location',
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: ColorStyle.primaryColor_1570A5,
            size: 30,
          ),
          onPressed: () {
            keyDrawer.currentState!.openDrawer();
            // navigateToBack(context);
          },
        ),
        styleTitle: TextStylesCustom.textStyles_20.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
        ),
        elevation: 2,
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
        itemBuilder: ((context, index){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frankfurt',
              style: TextStylesCustom.textStyles_18
                  .apply(fontWeightDelta: 1),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'GutleutstraBe 34-36',
              style: TextStylesCustom.textStyles_14
                  .apply(color: ColorStyle.grey_5E6D77),
            ),
            Text(
              '60329 Frankfurt am Main',
              style: TextStylesCustom.textStyles_14
                  .apply(color: ColorStyle.grey_5E6D77),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '1hr Ansprechpartner:',
              style: TextStylesCustom.textStyles_14
                  .apply(color: ColorStyle.grey_5E6D77),
            ),
            Text(
              'Herr Wiersch',
              style: TextStylesCustom.textStyles_14
                  .apply(color: ColorStyle.grey_5E6D77),
            ),
            Text(
              'Telefon: 069 348792507',
              style: TextStylesCustom.textStyles_14
                  .apply(color: ColorStyle.grey_5E6D77),
            ),
            Row(
              children: [
                Text(
                  'E-mail: ',
                  style: TextStylesCustom.textStyles_14
                      .apply(color: ColorStyle.grey_5E6D77),
                ),
                Text(
                  'frankfurt2@bbz.kiry.de',
                  style: TextStylesCustom.textStyles_14
                      .apply(color: ColorStyle.green_008428),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
// -------------------------------------------------------Map Container------------------------------------------->
            Container(
              width: Get.mediaQuery.size.width,
              height: 400,
              color: ColorStyle.grey_DAE1E7,
              child: Center(
                child: Text('location block'),
              ),
            )
          ],
        );
      }), separatorBuilder: ((context, index){
        return SizedBox(height: 20,);
      }), itemCount: 2,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,),
    );
  }
}

