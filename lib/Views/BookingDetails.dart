import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/AppBarStyle.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import '../Controller/BookingHistoryController.dart';


class BookingDetails extends StatelessWidget {
  BookingDetails({
    Key? key,
    required this.id,
  }) : super(key: key);

  int id;

  final controller = Get.put(BookingHistoryController());


  List bookingDetails = [
    {'item': 'Booking status', 'value': 'Paid'},
    {'item': 'Booking date', 'value': '25/03/2022'},
    {'item': 'Payment method', 'value': 'Stripe Checkout'},
    {'item': 'Exam type', 'value': 'lorem ipsum'},
    {'item': 'Exam date', 'value': '25/05/2022'},
    {'item': 'Exam time', 'value': '03:30 pm'},
    {'item': 'Exam fees', 'value': '7,50 €'},
  ];

  List yourInformation = [
    {'item': 'First name', 'value': 'John'},
    {'item': 'Last name', 'value': ''},
    {'item': 'Identification No.', 'value': 'Lorem'},
    {'item': 'Email', 'value': 'johndoe@gmail.com'},
    {'item': 'Salutation', 'value': 'Lorem'},
    {'item': 'Academic title', 'value': 'Lorem ipsum'},
    {'item': 'Birth date', 'value': '22/03/1995'},
    {'item': 'Birth place', 'value': 'Korea'},
    {'item': 'Country of birth', 'value': 'South Korea'},
    {'item': 'Mother tongue', 'value': 'India'},
    {'item': 'Telephone', 'value': '12345678'},
    {'item': 'Mobile', 'value': '+491234566'},
    {
      'item': 'Address',
      'value': 'Lorem ipsum, dolor sit amet,adipresq, sdf-123456'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      initState: (state) {
        Future.delayed(Duration(microseconds: 100), () {
          controller.fetchBookingDetail(id);
        });
      },
      builder: ((controller) => Obx(() => controller.bookingDetails.isEmpty ? Container(color: Colors.white,) :  Scaffold(
      backgroundColor: ColorStyle.white,
      appBar: AppBarStyle(
        title: controller.bookingDetails['booked_event']['title'] ?? '',
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
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
                    'Booking Details'.tr,
                    style: TextStylesCustom.textStyles_18.apply(
                        color: ColorStyle.primaryColor_1570A5,
                        fontWeightDelta: 1),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Booking ID'.tr,
                          style: TextStylesCustom.textStyles_14.apply(
                            color: ColorStyle.primaryColor_1570A5,
                          )),
                      Text('${controller.bookingDetails['id'] ?? ''}',
                          style: TextStylesCustom.textStyles_14.apply(
                            color: ColorStyle.primaryColor_1570A5,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ItemsList(items: [
                    {'item': 'Booking Status'.tr, 'value':controller.bookingDetails['status'] != null ? '${controller.bookingDetails['status'].toString().tr}' : ''},
                    {'item': 'Booking Date'.tr, 'value': controller.bookingDetails['created_at'] != null ? DateFormat('dd/MM/yyyy').format(DateTime.parse('${controller.bookingDetails['created_at']}')):''},
                    {'item': 'Payment Method'.tr, 'value': '${controller.bookingDetails['gateway'] ?? ''}'},
                    {'item': 'Exam Type'.tr, 'value': '${controller.bookingDetails['examLevel'] ?? ''}'},
                    {'item': 'Exam Date'.tr, 'value': controller.bookingDetails['booked_event']['exam_date'] != null ? DateFormat('dd/MM/yyyy').format(DateTime.parse('${controller.bookingDetails['booked_event']['exam_date']}')):''},
                    {'item': 'Exam Time'.tr, 'value': controller.bookingDetails['booked_event']['exam_time'] != null ? '${DateFormat.jm().format(DateTime.parse('${controller.bookingDetails['booked_event']['exam_date']}T${controller.bookingDetails['booked_event']['exam_time']}'))}':''},
                    {'item': 'Exam Fee'.tr, 'value': '${controller.bookingDetails['booked_event']['sale_price'] ?? controller.bookingDetails['booked_event']['price'] ?? ''} €'},
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total'.tr,
                          style: TextStylesCustom.textStyles_14.apply(
                            color: ColorStyle.primaryColor_1570A5,
                          )),
                      Text('${controller.bookingDetails['total'] ?? ''} €',
                          style: TextStylesCustom.textStyles_14.apply(
                            color: ColorStyle.primaryColor_1570A5,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 36,
                  ),
                ],
              ),
            ),

            // ---------------------------------------------Your Information------------------->

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: ColorStyle.lightBlue_F2F2F2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Your Information'.tr,
                      style: TextStylesCustom.textStyles_18.apply(
                          color: ColorStyle.primaryColor_1570A5,
                          fontWeightDelta: 1),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    ItemsList(items: [
                      {'item': 'First Name'.tr, 'value': '${controller.bookingDetails['first_name'] ?? ''}'},
                      {'item': 'Last Name'.tr, 'value': '${controller.bookingDetails['last_name'] ?? ''}'},
                      {'item': 'Identification No.'.tr, 'value': '${controller.bookingDetails['identification_number'] ?? ''}'},
                      {'item': 'Email'.tr, 'value': '${controller.bookingDetails['email'] ?? ''}'},
                      {'item': 'Salutation'.tr, 'value': '${controller.bookingDetails['salutation'] ?? ''}'},
                      {'item': 'Academic Title'.tr, 'value': '${controller.bookingDetails['academic_title'] ?? ''}'},
                      {'item': 'Birth Date'.tr, 'value': controller.bookingDetails['birth_date'] != null ? DateFormat('dd/MM/yyyy').format(DateTime.parse('${controller.bookingDetails['birth_date']}')):''},
                      {'item': 'Birth Place'.tr, 'value': '${controller.bookingDetails['birth_place'] ?? ''}'},
                      {'item': 'Country Of Birth'.tr, 'value': '${controller.bookingDetails['country_Of_birth'] ?? ''}'},
                      {'item': 'Mother Tongue'.tr, 'value': '${controller.bookingDetails['mother_tongue'] ?? ''}'},
                      {'item': 'Telephone'.tr, 'value': '${controller.bookingDetails['tele_phone'] ?? ''}'},
                      {'item': 'Mobile'.tr, 'value': '${controller.bookingDetails['phone'] ?? ''}'},
                      {
                        'item': 'Address'.tr,
                        'value': '${controller.bookingDetails['address'] != null ? '${controller.bookingDetails['address']}, ': ''}${controller.bookingDetails['address2'] != null ? '${controller.bookingDetails['address2']}, ': ''}${controller.bookingDetails['city'] != null ? '${controller.bookingDetails['city']}, ': ''}${controller.bookingDetails['zip_code'] != null ? '${controller.bookingDetails['zip_code']}, ': ''}${controller.bookingDetails['country'] != null ? '${controller.bookingDetails['country']}': ''}'
                      },
                    ]),
                    SizedBox(
                      height: 40,
                    ),
                  ]),
            )
          ],
        ),
      ),
    )
    )
    ));
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(items[index]['item'],
                    style: TextStylesCustom.textStyles_14),
                // SizedBox(width: 10,),
                Expanded(
                  child: Text(items[index]['value'],
                      textAlign: TextAlign.end,
                      style: TextStylesCustom.textStyles_14
                          .apply(color: ColorStyle.grey_A8B0B5)),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
