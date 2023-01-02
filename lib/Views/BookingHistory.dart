import 'package:bbz/Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:intl/intl.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../Controller/PersistentNavBarController.dart';
import '../Utils/Global.dart';
import 'BookingDetails.dart';
import 'Invoice.dart';
import 'Ticket.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Controller/BookingHistoryController.dart';

class BookingHistory extends StatelessWidget {
  BookingHistory({Key? key}) : super(key: key);
  final controller = Get.put(BookingHistoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
        initState: (state){
          controller.initMethods();
        },
        builder: ((controller)=>Obx(() =>
        
        WillPopScope(
          onWillPop: () async {
            // Do something here
             final navbarController = Get.find<PersistentNavBarController>();
                navbarController.isNavBarActive.value = true;
            print("After clicking the Android Back Button");
            return true;
          },
         child: Scaffold(
          backgroundColor: ColorStyle.white,
          appBar: AppBarStyle(
            title: 'Booking History'.tr,
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
            child: Padding(
              padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ----------------------------------UPCOMING EXAMS------------------------------------->
                  Exams(
                    title: 'Upcoming Exams'.tr,
                    itemCount: 1,
                    items: controller.upcomingExamHistoryData.value
                  ),

                  // ----------------------------------PAST EXAMS------------------------------------->
                  Exams(
                    title: 'Past Exams'.tr,
                    itemCount: 3,
                    items: controller.pastExamHistoryData.value,
                  ),
                ],
              ),
            ),
          ),
        ))))
    );

  }
}

class Exams extends StatelessWidget {
  Exams({Key? key, this.title, this.itemCount, this.items}) : super(key: key);
  final String? title;
  int? itemCount = 1;
  List? items;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStylesCustom.textStyles_18
              .apply(color: ColorStyle.primaryColor_1570A5, fontWeightDelta: 1),
        ),
        const SizedBox(
          height: 19,
        ),
        ListView.separated(
          itemCount: items!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const SizedBox(
              // color: Colors.red,
              // height: 40,
            );
          },
          itemBuilder: (context, index) {
            return items![index]['booked_event'].length != 0?
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // height: 300,
                  width: Get.mediaQuery.size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorStyle.grey_DAE1E7),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      // -----------------------------------FULL AMOUNT PAID SECTION------------------>
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          // Icon(
                          //   Icons.credit_score,
                          //   size: 28,
                          //   color: ColorStyle.primaryColor_1570A5,
                          // ),
                          SizedBox(
                            width: 28,
                            height: 28,
                            child: Image.asset(
                              ImageStyle.paid,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),

                          Expanded(
                              child: FittedBox(
                                child: Text.rich(
                                    TextSpan(
                                        text: '',
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text: 'Full Amount Paid'.tr,
                                            style: TextStylesCustom.textStyles_14
                                                .apply(
                                                color: Colors.black,
                                                fontWeightDelta: 2),
                                          ),
                                          TextSpan(
                                            text: '  •  ',
                                            style: TextStylesCustom
                                                .textStyles_14
                                                .apply(
                                              color: ColorStyle
                                                  .grey_5E6D77,
                                            ),
                                          ),

                                          TextSpan(
                                            text: '${ items![index]['created_at'] != null ? DateFormat('dd/MM/yyyy').format(DateTime.parse('${items![index]['created_at']}')) : ''} | ${ items![index]['created_at'] != null ? DateFormat.jm().format(DateTime.parse('${items![index]['created_at']}')):''}  ',
                                            style: TextStylesCustom.textStyles_12
                                                .apply(color: ColorStyle.primaryColor_1570A5),
                                          ),

                                        ]
                                    )
                                ),
                              )
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // --------------------------------IMAGE AND DETAILS--------------------->
                      InkWell(
                        onTap: (){
                          BookingDetails(id: items![index]['id'],).navigateToCustom(context, withNavBar: false);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              ImageStyle.pixabay,
                              height: 90,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${items![index]['booked_event']['title'] ??  ''}',
                                    style: TextStylesCustom.textStyles_12
                                        .apply(fontWeightDelta: 1),
                                  ),
                                  SizedBox(height: 3,),
                                  Text(
                                    '${items![index]['booked_event']['examLevel'] ??  ''}',
                                    style: TextStylesCustom.textStyles_14.apply(
                                        color: ColorStyle.primaryColor_1570A5,
                                        fontWeightDelta: 2),
                                  ),
                                  SizedBox(height: 2,),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: FittedBox(
                                          child: Text.rich(
                                              TextSpan(
                                                  text: '',
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                      text: 'Amount Paid'.tr + ' : ',
                                                      style: TextStylesCustom.textStyles_14
                                                          .apply(fontWeightDelta: 3),
                                                    ),
                                                    TextSpan(
                                                      text: '${items![index]['paid'] ??  '7,50'} €',
                                                      style: TextStylesCustom.textStyles_14
                                                          .apply(
                                                          color: Colors.green,
                                                          fontWeightDelta: 1),
                                                    ),

                                                  ]
                                              )
                                          ),
                                        ),
                                      ),
                                      // Text(
                                      //   'Amount Paid:'.tr,
                                      //   style: TextStylesCustom.textStyles_14
                                      //       .apply(fontWeightDelta: 3),
                                      // ),
                                      // Text(
                                      //   '${items![index]['paid'] ??  '7,50'} €',
                                      //   style: TextStylesCustom.textStyles_14
                                      //       .apply(
                                      //           color: Colors.green,
                                      //           fontWeightDelta: 1),
                                      // ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, right: 8),
                              child: SvgPicture.asset(ImageStyle.bookingHistory_arrow)
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // ------------------------------------ BUTTONS ----------------------------->
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButtonCustoms(
                              onTap: () {
                                Invoice(id: items![index]['id'],).navigateToCustom(context, withNavBar: false);
                              },
                              text: 'GET INVOICE'.tr,
                              colorText: ColorStyle.primaryColor_1570A5,
                              colorBG: ColorStyle.white,
                              colorBorder: ColorStyle.primaryColor_1570A5,
                              fontWeight: 1,
                              radiusBorder: 0,
                            ),
                          ),
                          Expanded(
                            child: ElevatedButtonCustoms(
                              onTap: () {
                                Ticket(id: items![index]['id'],).navigateToCustom(context, withNavBar: false);
                              },
                              text: 'PRINT TICKET'.tr,
                              radiusBorder: 0,
                              fontWeight: 1,
                              colorBG: ColorStyle.primaryColor_1570A5,
                              colorBorder: ColorStyle.primaryColor_1570A5,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40,)
              ],
            ) : SizedBox(height: 0);
          },
        ),
        const SizedBox(
          height: 33,
        ),
      ],
    );
  }
}
