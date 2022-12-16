import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Utils/Global.dart';
import '../Styles/ImageStyle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Controller/BookingHistoryController.dart';

class Ticket extends StatelessWidget {
  Ticket({
    Key? key,
    required this.id,
  }) : super(key: key);

  int? id;
  final controller = Get.put(BookingHistoryController());

  List ticketDetails = [
    {
      'icon': ImageStyle.ticket_location,
      'title': 'Location',
      'secondText':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed.',
    },
    {
      'icon': ImageStyle.ticket_calendar,
      'title': 'Date',
      'secondText': '11.11.2020',
    },
    {
      'icon': ImageStyle.ticket_100_percent,
      'title': 'Price',
      'secondText': '100 €',
    },
    {
      'icon': ImageStyle.ticket_time,
      'title': 'Exam Time',
      'secondText': '15:49:00',
    },
    {
      'icon': ImageStyle.ticket_person,
      'title': 'Student',
      'secondText': '''Heuebd Jxjejfe
JohnDoe@gmail.com
9876545678''',
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
              appBar: AppBarStyle(
                title: 'Ticket',
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorStyle.primaryColor_1570A5,
                    size: 30,
                  ),
                  onPressed: () {
                    // keyDrawer.currentState!.openDrawer();
                    navigateToBack(context);
                  },
                ),
                styleTitle: TextStylesCustom.textStyles_20.apply(
                  color: ColorStyle.primaryColor_1570A5,
                  fontWeightDelta: 1,
                ),
                elevation: 2,
              ),
              body: SingleChildScrollView(
                child: Container(
                  color: ColorStyle.white_FAFAFA,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${controller.bookingDetails['booked_event']['title'] ?? ''}',
                        style: TextStylesCustom.textStyles_19.apply(
                            color: ColorStyle.primaryColor_1570A5,
                            fontWeightDelta: 2),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ItemsList(items: [
                        {
                          'icon': ImageStyle.ticket_location,
                          'title': 'Location',
                          'secondText':
                          '${controller.bookingDetails['address'] != null ? '${controller.bookingDetails['address']}, ': ''}${controller.bookingDetails['address2'] != null ? '${controller.bookingDetails['address2']}, ': ''}${controller.bookingDetails['city'] != null ? '${controller.bookingDetails['city']}, ': ''}${controller.bookingDetails['zip_code'] != null ? '${controller.bookingDetails['zip_code']}, ': ''}${controller.bookingDetails['country'] != null ? '${controller.bookingDetails['country']}': ''}',
                        },
                        {
                          'icon': ImageStyle.ticket_calendar,
                          'title': 'Date',
                          'secondText': controller.bookingDetails['booked_event']['exam_date'] != null ? DateFormat('dd.MM.yyyy').format(DateTime.parse('${controller.bookingDetails['booked_event']['exam_date']}')):'',
                        },
                        {
                          'icon': ImageStyle.ticket_100_percent,
                          'title': 'Price',
                          'secondText': '${controller.bookingDetails['booked_event']['price'] ?? ''} €',
                        },
                        {
                          'icon': ImageStyle.ticket_time,
                          'title': 'Exam Time',
                          'secondText': '${controller.bookingDetails['booked_event']['exam_time'] ?? ''}',
                        },
                        {
                          'icon': ImageStyle.ticket_person,
                          'title': 'Student',
                          'secondText': '''${controller.bookingDetails['first_name'] ?? ''} ${controller.bookingDetails['last_name'] ?? ''}
${controller.bookingDetails['email'] ?? ''}
johnnyharpertesting03@gmail.com
${controller.bookingDetails['phone'] ?? ''}''',
                        },
                      ]),
                      SizedBox(
                        height: 40,
                      ),

                      // ---------------------------------------------QR Code---------------------------------------->
                      Center(
                        child: Image.asset(
                          ImageStyle.ticketBarcode,
                          width: 230,
                          height: 230,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ))));
  }
}

class ItemsList extends StatelessWidget {
  ItemsList({Key? key, required this.items, this.secondColor})
      : super(key: key);
  List items;
  Color? secondColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: ((context, index) => Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyle.grey_DAE1E7.withOpacity(0.5),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    // Image.asset(
                    //   ImageStyle.calendar,
                    //   height: 70,
                    //   width: 70 ,
                    //   fit: BoxFit.fill,
                    // ),
                    SizedBox(
                        width: 60,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              items[index]['icon'],
                              width: 45,
                            ),
                            Expanded(
                                child: SizedBox(
                              width: 0,
                            ))
                          ],
                        )),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index]['title'],
                            style: TextStylesCustom.textStyles_14.apply(
                                color: ColorStyle.primaryColor_1570A5,
                                fontWeightDelta: 1),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            items[index]['secondText'],
                            style: TextStylesCustom.textStyles_10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          separatorBuilder: ((context, index) => SizedBox(
                height: 5,
              )),
          itemCount: items.length,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
