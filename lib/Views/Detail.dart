import 'dart:html';

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

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBarStyle(
        leading: Icon(Icons.arrow_back),
        title: 'Deutschtest für Zuwanderer \n(DTZ / A2-B1) (PR-220409-HU-DTZ)',
        styleTitle: TextStylesCustom.textStyles_14.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
          fontSizeDelta: 1
        ),
        elevation: 2,
        
      ),
      
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            Container(
              width: Get.mediaQuery.size.width,
              height: 164,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/Images/ExamBG.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Row( children: [
                    Padding(padding: EdgeInsets.all(8.0)),
                    Text("A2-B1 Level", style: TextStyle(color: ColorStyle.white, fontSize: 30),)
                  ],),
                  Row( children: [
                    Padding(padding: EdgeInsets.all(8.0)),
                    Icon(Icons.location_pin, color: ColorStyle.white),
                    Text(
                    "Brüder Grimm Bildungscentrum e. V. Langstr.60 63452 Hanau",
                    style: TextStyle(color: ColorStyle.white, fontSize: 15, )

                  )
                  ],),


                  
                ],
              ),
              
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              
              width: Get.mediaQuery.size.width/1.1,
              height: 164,
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row( children: [
                    Padding(padding: EdgeInsets.all(8.0)),
                    Icon(Icons.person, color: Colors.green, size: 23,),
                    Text("  Seats Available | 400/500 ", style: TextStyle(color: Colors.green, fontSize: 18 ),)
                  ],),
                  SizedBox(height: 20,),
                   Row( children: [
                    Padding(padding: EdgeInsets.all(8.0)),
                    Icon(Icons.calendar_today, color: Colors.blue, size: 23,),
                    Text("  Exam Date ", style: TextStyle(color: Colors.black, fontSize: 18 ),),
                    Text("  25/03/2022 (SAT) ", style: TextStyle(color: Colors.green, fontSize: 18 ),)
                  ],),
                  SizedBox(height: 20,),
                   Row( children: [
                    Padding(padding: EdgeInsets.all(8.0)),
                    Icon(Icons.hourglass_bottom_sharp, color: Colors.blue, size: 28,),
                    Text(" Reg. Until | 25/03/2022", style: TextStyle(color: Colors.orange, fontSize: 18 ),),
                  ],),
                  SizedBox(height: 20,),
                  
                   Row( children: [
                    Padding(padding: EdgeInsets.all(8.0)),
                    Icon(Icons.time_to_leave, color: Colors.blue, size: 23,),
                    Text("  Exam Time ", style: TextStyle(color: Colors.black, fontSize: 18 ),),
                    Text("  09:30 AM ", style: TextStyle(color: Colors.green, fontSize: 18 ),)
                  ],),
                   
                ],
              ),
              
            ),
            Container(
             margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              
              width: Get.mediaQuery.size.width,
              height: 564,
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Description',style: TextStyle(color: Colors.blue, fontSize: 22 )),
                  SizedBox(height: 20,),
                  

                   Text(
                    "Libero sem vitae sed donec conubia integer nisi integer rhoncus imperdiet orci odio libero est integer a integer tincidunt sollicitudin blandit fusce nibh leo vulputate lobortis egestas dapibus faucibus metus conubia maecenas cras potenti cum hac arcu rhoncus nullam eros dictum torquent integer cursus bibendum sem sociis molestie tellus purus Quam fusce convallis ipsum malesuada amet velit aliquam urna nullam vehicula fermentum id morbi dis magnis porta sagittis euismod etiam"
                    ,style: TextStyle( fontSize: 15 )),
                  SizedBox(height: 20,),

                   Container(
                    width: Get.mediaQuery.size.width,
                    height: 280,
                    decoration: const BoxDecoration(
                      color: Colors.white
                    ),
                    child: Card(
                      elevation: 8,
                      child: Row(
                        children: [
                          Text("Fee  " ),
                          Text("7,50 €"),
                          // ElevatedButton(onPressed: ()=> {},child: Text("Book now", style: TextStyle(color: Colors.black),),)
                        ],
                      ),
                    ),
                  ),
                  Text('Was müssen Sie für diese Prüfungkönnen?',style: TextStyle(color: Colors.blue, fontSize: 22 )),
                  SizedBox(height: 20,),
                 
                   Text(
                    "Sie können sich spontan und fließend ausdrücken. Mit umgangssprachlichen Wendungen sind Sie vertraut und können den Sprachstil gezielt variieren. Sie behalten ein hohes Maß an grammatischer Korrektheit bei.",
                    style: TextStyle( fontSize: 15 )),
                  
                   
                ],
              ), 
            )

          ],
        ),)
          
         
          
         
    );
  }
}
