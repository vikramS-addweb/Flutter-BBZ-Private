import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Utils/Global.dart';
import '../Styles/ImageStyle.dart';
import '../Controller/BookingHistoryController.dart';

class Invoice extends StatelessWidget {
  Invoice({
    Key? key,
    required this.id,
  }) : super(key: key);

  int id;
  final controller = Get.put(BookingHistoryController());


  List profileDetail = [
    {
      'item': 'Full Name:',
      'value': 'John Doe'
    },
    {
      'item':'Email:',
      'value':'JohnDoe@gmail.com'
    },
    {
      'item':'Phone:',
      'value':'9846453748'
    },
    {
      'item':'Address:',
      'value':'Bdfgadsf, 453256, DE'
    },
  ];

  List bookingDetails = [
    {
      'item':'Booking Number',
      'value':'377'
    },
    {
      'item':'Booking Status',
      'value':'Paid'
    },
    {
      'item':'Payment Method',
      'value':'Stripe'
    },
    {
      'item':'Exam Name',
      'value':'Test2'
    },
    {
      'item':'Exam Type',
      'value':'B1'
    },
    {
      'item':'Exam Time And Date',
      'value':'11.11.2022(15:49:00)'
    },
    {
      'item':'Fee',
      'value':''
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
        initState: (state){
          Future.delayed(Duration(microseconds: 100), () {
            controller.fetchBookingDetail(id);
          });
        },
        builder: ((controller)=> Obx(() => controller.bookingDetails.isEmpty ? Container(color: Colors.white,) :  Scaffold(
          appBar: AppBarStyle(
            title: 'Invoice',
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
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.print,size: 55,),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Billing To',
                          style: TextStylesCustom.textStyles_18.apply(
                              color: ColorStyle.primaryColor_1570A5,
                              fontWeightDelta: 1),
                        ),
                        SizedBox(
                            width: 100,
                            height: 80,
                            child: Image.asset(
                              ImageStyle.logoBBZ,
                              fit: BoxFit.fill,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.mediaQuery.size.width,
                    margin: EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    // height: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorStyle.grey_DAE1E7),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        ItemsList(items: [
                          {
                            'item': 'Full Name:',
                            'value': '${controller.bookingDetails['first_name'] ?? ''} ${controller.bookingDetails['last_name'] ?? ''}'
                          },
                          {
                            'item':'Email:',
                            'value':'${controller.bookingDetails['email'] ?? ''}'
                          },
                          {
                            'item':'Phone:',
                            'value':'${controller.bookingDetails['phone'] ?? ''}'
                          },
                          {
                            'item':'Address:',
                            'value':'${controller.bookingDetails['address'] != null ? '${controller.bookingDetails['address']}, ': ''}${controller.bookingDetails['address2'] != null ? '${controller.bookingDetails['address2']}, ': ''}${controller.bookingDetails['city'] != null ? '${controller.bookingDetails['city']}, ': ''}${controller.bookingDetails['zip_code'] != null ? '${controller.bookingDetails['zip_code']}, ': ''}${controller.bookingDetails['country'] != null ? '${controller.bookingDetails['country']}': ''}'
                          },
                        ],),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Container(
                    width: Get.mediaQuery.size.width,
                    padding: const EdgeInsets.all(10),
                    // height: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorStyle.grey_DAE1E7),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        ItemsList(items: [
                          {
                            'item':'Booking Number',
                            'value':'${controller.bookingDetails['id'] ?? ''}'
                          },
                          {
                            'item':'Booking Status',
                            'value':'${controller.bookingDetails['status'] ?? ''}'
                          },
                          {
                            'item':'Payment Method',
                            'value':'${controller.bookingDetails['gateway'] ?? ''}'
                          },
                          {
                            'item':'Exam Name',
                            'value':'${controller.bookingDetails['booked_event']['title'] ?? ''}'
                          },
                          {
                            'item':'Exam Type',
                            'value':'${controller.bookingDetails['examLevel'] ?? ''}'
                          },
                          {
                            'item':'Exam Time And Date',
                            'value':'${controller.bookingDetails['booked_event']['exam_date'] != null ? DateFormat('dd.MM.yyyy').format(DateTime.parse('${controller.bookingDetails['booked_event']['exam_date']}')):''}(${controller.bookingDetails['booked_event']['exam_time'] ?? ''})'
                          },
                          {
                            'item':'Fee',
                            'value':'${controller.bookingDetails['booked_event']['price'] ?? ''} €'
                          }
                        ],),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total', style: TextStylesCustom.textStyles_16.apply(color:ColorStyle.primaryColor_1570A5, fontWeightDelta: 1),),
                            const SizedBox(width: 20,),
                            Expanded(child: Text('${controller.bookingDetails['total'] ?? ''} €', style: TextStylesCustom.textStyles_16.apply(color: ColorStyle.red_ED0925, fontWeightDelta: 1),textAlign: TextAlign.end,)),
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        )))
    );
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
          shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(items[index]['item'], style: TextStylesCustom.textStyles_12.apply(fontWeightDelta: 1),),
                  const SizedBox(width: 20,),
                  Expanded(child: Text(items[index]['value'], style: TextStylesCustom.textStyles_12.apply(fontWeightDelta: 1),textAlign: TextAlign.end,)),
                ],
              );
            }),
            separatorBuilder: ((context, index) {
              return const SizedBox(
                height: 10,
              );
            }),
            itemCount: items.length),
      ],
    );
  }
}
