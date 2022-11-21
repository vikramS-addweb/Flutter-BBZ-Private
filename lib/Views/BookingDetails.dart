import 'package:flutter/material.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/AppBarStyle.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';

class BookingDetails extends StatelessWidget {
  BookingDetails({Key? key}) : super(key: key);

  List bookingDetails = [
    {'item': 'Booking status', 'value': 'Paid'},
    {'item': 'Booking date', 'value': '25/03/2022'},
    {'item': 'Payment Method', 'value': 'Stripe Checkout'},
    {'item': 'Exam type', 'value': 'lorem ipsum'},
    {'item': 'Exam date', 'value': '25/05/2022'},
    {'item': 'Exam time', 'value': '03:30 pm'},
    {'item': 'Exam fees', 'value': '7,50 €'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      appBar: AppBarStyle(
        title: 'Booking History',
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
        elevation: 1,
      ),

      // appBar: AppBarStyle(
      //   title: 'Deutschtest für Zuwanderer (DTZ / A2-B1) (PR-220409-HU-DTZ)',
      //   styleTitle: TextStylesCustom.textStyles_18.apply(
      //     color: ColorStyle.primaryColor_1570A5,
      //   ),
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: ColorStyle.primaryColor_1570A5,
      //       size: 30,
      //     ),
      //     onPressed: () {
      //       navigateToBack(context);
      //     },
      //   ),
      // appBar: AppBarStyle(),
      // )
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   width: Get.mediaQuery.size.width,
              //   height: 5,
              //   color: ColorStyle.grey_DAE1E7,
              // ),
              const SizedBox(
                height: 36,
              ),
              // -----------------------------------Booking Details---------------------->
              Text(
                'Booking Details',
                style: TextStylesCustom.textStyles_18.apply(
                    color: ColorStyle.primaryColor_1570A5, fontWeightDelta: 1),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Booking ID',
                      style: TextStylesCustom.textStyles_14.apply(
                        color: ColorStyle.primaryColor_1570A5,
                      )),
                  Text('86',
                      style: TextStylesCustom.textStyles_14.apply(
                        color: ColorStyle.primaryColor_1570A5,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ItemsList(items: bookingDetails),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',
                      style: TextStylesCustom.textStyles_14.apply(
                        color: ColorStyle.primaryColor_1570A5,
                      )),
                  Text('7,50 €',
                      style: TextStylesCustom.textStyles_14.apply(
                        color: ColorStyle.primaryColor_1570A5,
                      ))
                ],
              ),
              SizedBox(
                height: 36,
              ),

              // ---------------------------------------------Your Information------------------->
            ],
          ),
        ),
      ),
    );
  }
}

class ItemsList extends StatelessWidget {
  ItemsList({Key? key, required this.items}) : super(key: key);
  List items;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          itemCount: items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(items[index]['item'],
                    style: TextStylesCustom.textStyles_14),
                Text(items[index]['value'],
                    style: TextStylesCustom.textStyles_14),
              ],
            );
          },
        ),
      ],
    );
  }
}
