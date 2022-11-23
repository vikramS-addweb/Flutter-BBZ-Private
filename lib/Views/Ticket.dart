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

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBarStyle(
        leading: Icon(Icons.arrow_back),
        title: 'Ticket Screen',
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
            Row( children: [SizedBox(height: 0, width: 18,),Text("Test 2", style: TextStyle(color: Colors.blue, fontSize: 23),), ],),
            SizedBox(height: 20,),
            Row( children: [SizedBox(height: 0, width: 18,), Icon(Icons.location_pin, size: 18, color: Colors.blue,), Text("   ***lskaldj", style: TextStyle(color: Colors.black),), ],),
            SizedBox(height: 25,),
            Row( mainAxisAlignment: MainAxisAlignment.start, children: [SizedBox(height: 0, width: 18,),
            Column( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
                 children: [ Icon(Icons.calendar_today, size: 18, color: Colors.blue,), Text("   Date", style: TextStyle(color: Colors.black),), ],)

              ,SizedBox(height: 20,), 
              Text("11.11.2022", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
              ],),
            SizedBox(height: 0, width: Get.mediaQuery.size.width * 0.3,),
            Column( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
                 children: [ Icon(Icons.money, size: 18, color: Colors.blue,), Text("   Price", style: TextStyle(color: Colors.black),), ],)

              ,SizedBox(height: 20,), 
              Text("100 ", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
              ],), 
             ],),
            /////////////////////////////
            SizedBox(height: 25,),
            Row( mainAxisAlignment: MainAxisAlignment.start, children: [SizedBox(height: 0, width: 18,),
            Column( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
                 children: [ Icon(Icons.schedule, size: 18, color: Colors.blue,), Text("   Exam Time", style: TextStyle(color: Colors.black),), ],)

              ,SizedBox(height: 20,), 
              Text("15:49:00", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
              ],),
            SizedBox(height: 0, width: Get.mediaQuery.size.width * 0.25,),
            Column( 
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Row(
                 children: [ Icon(Icons.person, size: 18, color: Colors.blue,), Text("   Student", style: TextStyle(color: Colors.black),), ],)

              ,SizedBox(height: 2,), 
              Text("kalsdjf", style: TextStyle(fontSize: 15),),
              Text("shivani", style: TextStyle(fontSize: 15),),
              Text("0987654321", style: TextStyle(fontSize: 15),)
              ],), 
             ],),
          
            SizedBox(height: 20,),
            Image(image: AssetImage('assets/Images/qr_code.png',))
          ],

        )
          
         
    ));
  }
}
