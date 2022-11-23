import 'package:bbz/Styles/ColorStyle.dart';
import 'package:bbz/Styles/ImageStyle.dart';
import 'package:flutter/material.dart';
import '../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import '../Components/BGImage.dart';
import '../Views/Auth/SignUp.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/TextRichCustom.dart';

class Invoice extends StatelessWidget {
  const Invoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBarStyle(
        leading: Icon(Icons.arrow_back),
        title: 'Invoice',
        styleTitle: TextStylesCustom.textStyles_14.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
          fontSizeDelta: 1
        ),
        elevation: 2,
        
      ),
      
      body: SingleChildScrollView(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [Icon(Icons.print, size: 40,), SizedBox(height: 0, width: 40,)],),
            SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Billing to", style: TextStyle(color: Colors.blue, fontSize: 23),), Image(image: AssetImage('assets/Images/logoBBZ.png',))],),
            SizedBox(height: 20,),
            Container(
              width: Get.mediaQuery.size.width/1.03,
              padding: EdgeInsets.all(9),

              decoration: BoxDecoration( border: Border.all(color: ColorStyle.grey_5E6D77, width: 0.5)),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Full name : ", style: TextStyle(fontSize: 18),),Text("Shivani Smith", style: TextStyle(fontSize: 18),)],),
                  SizedBox(height: 13,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("E-mail : ", style: TextStyle(fontSize: 18),),Text("shivani@addwebsolution.in", style: TextStyle(fontSize: 18),)],),
                  SizedBox(height: 13,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Phone: ", style: TextStyle(fontSize: 18),),Text("0987654321", style: TextStyle(fontSize: 18),)],),
                  SizedBox(height: 13,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Address : ", style: TextStyle(fontSize: 18),),Text("***lskaldj", style: TextStyle(fontSize: 18),)],),
                  SizedBox(height: 13,),
                ],
              ),
            ),
            SizedBox(height: 25,),
            Container(
              width: Get.mediaQuery.size.width/1.03,
              padding: EdgeInsets.all(9),

              decoration: BoxDecoration(border: Border.all(color: ColorStyle.grey_5E6D77, width: 0.5)),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Full name : ", style: TextStyle(fontSize: 18),),Text("Shivani Smith", style: TextStyle(fontSize: 18),)],),
                  SizedBox(height: 13,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("E-mail : ", style: TextStyle(fontSize: 18),),Text("shivani@addwebsolution.in", style: TextStyle(fontSize: 18),)],),
                  SizedBox(height: 13,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Phone: ", style: TextStyle(fontSize: 18),),Text("0987654321", style: TextStyle(fontSize: 18),)],),
                  SizedBox(height: 13,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Address : ", style: TextStyle(fontSize: 18),),Text("***lskaldj", style: TextStyle(fontSize: 18),)],),
                  SizedBox(height: 13,),
                ],
              ),
            ),
          ],
        )
          
         
    ));
  }
}
