

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';


class BookingHistory extends StatelessWidget {
  const BookingHistory({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white_F3F3F3,
      appBar: AppBarStyle(
        title: 'Booking History',
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: ColorStyle.primaryColor_1570A5,
            size: 30,
          ),
          onPressed: () {

          },
        ),
        styleTitle: TextStylesCustom.textStyles_16.apply(
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
              // Get.to(()=>NewsDetail());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Upcoming Exams', style: TextStylesCustom.textStyles_18.apply(color: ColorStyle.primaryColor_1570A5, fontWeightDelta: 1),),
                const SizedBox(height: 19,),
                Container(
                  height: 300,
                  width: Get.mediaQuery.size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorStyle.grey_DAE1E7),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 18,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10,),
                          Icon(Icons.credit_score, size: 28,color: ColorStyle.primaryColor_1570A5,),
                          const SizedBox(width: 14,),
                          Text('Full Amount Paid', style: TextStylesCustom.textStyles_10.apply(fontWeightDelta: 2),),
                          const SizedBox(width: 10,),
                          Container(
                            height: 6,
                            width: 6,
                            margin: const EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                                color: ColorStyle.grey_5E6D77,
                              borderRadius: BorderRadius.circular(50),
                            )
                          ),
                          const SizedBox(width: 10,),
                          Text('25/03/2022 | 03:30 PM', style: TextStylesCustom.textStyles_10.apply(color: ColorStyle.primaryColor_1570A5),),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          Image.asset(
                            ImageStyle.pixabay,
                            height: 78,
                            width: 130,
                          ),
                          const SizedBox(width: 4,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Zusatzleistung: Postversand- Zertifikate / Ergebnisbogen', style: TextStylesCustom.textStyles_10.apply(fontWeightDelta:1),),
                              Text('A2-B1', style: TextStylesCustom.textStyles_12.apply(color: ColorStyle.primaryColor_1570A5, fontWeightDelta:1),),
                              Row(
                                children: [
                                  Text('Amount Paid:', style: TextStylesCustom.textStyles_12.apply(fontWeightDelta:2),),
                                  Text('7,50 €', style: TextStylesCustom.textStyles_12.apply(color: Colors.green, fontWeightDelta:1),),

                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },),
    );
  }
}