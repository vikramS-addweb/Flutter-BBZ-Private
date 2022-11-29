import 'package:bbz/Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../Utils/Global.dart';
import 'BookingDetails.dart';
import 'Invoice.dart';
import 'Ticket.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({Key? key}) : super(key: key);

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
                title: 'Upcoming Exams',
                itemCount: 1,
              ),

              // ----------------------------------PAST EXAMS------------------------------------->
              Exams(
                title: 'Past Exams',
                itemCount: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Exams extends StatelessWidget {
  Exams({Key? key, this.title, this.itemCount}) : super(key: key);
  final String? title;
  int? itemCount = 1;
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
          itemCount: itemCount!,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const SizedBox(
              // color: Colors.red,
              height: 40,
            );
          },
          itemBuilder: (context, index) {
            return Column(
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
                          Text(
                            'Full Amount Paid',
                            style: TextStylesCustom.textStyles_12
                                .apply(fontWeightDelta: 3),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              height: 6,
                              width: 6,
                              margin: const EdgeInsets.only(top: 6),
                              decoration: BoxDecoration(
                                color: ColorStyle.grey_5E6D77,
                                borderRadius: BorderRadius.circular(50),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '25/03/2022 | 03:30 PM',
                            style: TextStylesCustom.textStyles_12
                                .apply(color: ColorStyle.primaryColor_1570A5),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // --------------------------------IMAGE AND DETAILS--------------------->
                      InkWell(
                        onTap: (){
                          BookingDetails().navigateToCustom(context, withNavBar: false);
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
                                    'Zusatzleistung: Postversand- Zertifikate / Ergebnisbogen',
                                    style: TextStylesCustom.textStyles_12
                                        .apply(fontWeightDelta: 1),
                                  ),
                                  Text(
                                    'A2-B1',
                                    style: TextStylesCustom.textStyles_14.apply(
                                        color: ColorStyle.primaryColor_1570A5,
                                        fontWeightDelta: 2),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Amount Paid:',
                                        style: TextStylesCustom.textStyles_14
                                            .apply(fontWeightDelta: 3),
                                      ),
                                      Text(
                                        '7,50 €',
                                        style: TextStylesCustom.textStyles_14
                                            .apply(
                                                color: Colors.green,
                                                fontWeightDelta: 1),
                                      ),
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
                                Invoice().navigateToCustom(context, withNavBar: false);
                              },
                              text: 'GET INVOICE',
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
                                Ticket().navigateToCustom(context, withNavBar: false);
                              },
                              text: 'PRINT TICKET',
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
              ],
            );
          },
        ),
        const SizedBox(
          height: 33,
        ),
      ],
    );
  }
}
