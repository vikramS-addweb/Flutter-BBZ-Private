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

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBarStyle(
        leading: Icon(Icons.arrow_back),
        trailings: [Icon(Icons.person)],
        title: 'Location',
        styleTitle: TextStylesCustom.textStyles_14.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 2,
          fontSizeDelta: 2
        ),
        elevation: 2,
        
      ),
      
      body: SingleChildScrollView(
        child:
        Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.all(10)),
            Image(image: AssetImage('assets/Images/warehouse.png',)),
            SizedBox(height: 20,),
            Text('Langnenhagen', style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Galileastrasse 3", style: TextStyle(fontSize: 15),),
            Text("30853 Langnenhagen", style: TextStyle(fontSize: 15),),
            SizedBox(height: 20,),
            Text("28937 asflskdjfl", style: TextStyle(fontSize: 15),),
            Text("asldjfasj;ld", style: TextStyle(fontSize: 15),),
            Text("telephone: 0987654321", style: TextStyle(fontSize: 15),),
            Row(children: [
              Text("email: ", style: TextStyle(fontSize: 15),),
              Text("  aksjd@gkamc,cin", style: TextStyle(fontSize: 15, color: Colors.green),)
            ],),

            SizedBox(height: 20,),

            Container(
              height: 120,
              width: Get.mediaQuery.size.width,
              decoration: BoxDecoration(
                color: Colors.grey
              ),
            )

          ],

        )
          ,
        )
         
         
    ));
  }
}
