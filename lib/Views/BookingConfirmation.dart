import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';
import '../Utils/Global.dart';
import '../Styles/ImageStyle.dart';


class BookingConfirmation extends StatelessWidget {
  const BookingConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        title: 'Booking Confirmation',
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorStyle.primaryColor_1570A5,
            size: 30,
          ),
          onPressed: () {
            navigateToBack(context);
          },
        ),
        styleTitle: TextStylesCustom.textStyles_16.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_rounded, color: ColorStyle.primaryColor_1570A5,),
                Container(
                  width: 70,
                  height: 3,
                  color: ColorStyle.primaryColor_1570A5,
                ),
                Icon(Icons.check_circle_rounded, color: ColorStyle.primaryColor_1570A5,),
                Container(
                  width: 70,
                  height: 3,
                  color: ColorStyle.primaryColor_1570A5,
                ),
                Icon(Icons.check_circle_rounded, color: ColorStyle.primaryColor_1570A5,),
              ],
            ),
            SizedBox(
              width: 300,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 25,),
                  Text('BOOKING', style: TextStylesCustom.textStyles_10.apply(color: ColorStyle.primaryColor_1570A5),),
                  SizedBox(width: 35,),
                  Text('PAYMENT', style: TextStylesCustom.textStyles_10.apply(color: ColorStyle.primaryColor_1570A5),),
                  SizedBox(width: 16,),
                  Text('CONFIRMATION', style: TextStylesCustom.textStyles_10.apply(color: ColorStyle.primaryColor_1570A5),),
                ],
              ),
            ),


            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(ImageStyle.examBG))
              ),
            )
          ],
        ),
      ),
    );
  }
}
