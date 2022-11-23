import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Utils/Global.dart';
import '../Styles/ImageStyle.dart';

class Ticket extends StatelessWidget {
  Ticket({Key? key}) : super(key: key);

  List profileDetail = [
    {'item': 'Full Name:', 'value': 'John Doe'},
    {'item': 'Email:', 'value': 'JohnDoe@gmail.com'},
    {'item': 'Phone:', 'value': '9846453748'},
    {'item': 'Address:', 'value': 'Bdfgadsf, 453256, DE'},
  ];

  List bookingDetails = [
    {'item': 'Booking Number', 'value': '377'},
    {'item': 'Booking Status', 'value': 'Paid'},
    {'item': 'Payment Method', 'value': 'Stripe'},
    {'item': 'Exam Name', 'value': 'Test2'},
    {'item': 'Exam Type', 'value': 'B1'},
    {'item': 'Exam Time And Date', 'value': '11.11.2022(15:49:00)'},
    {'item': 'Fee', 'value': ''}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Test2',
                style: TextStylesCustom.textStyles_16
                    .apply(color: ColorStyle.primaryColor_1570A5),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: ColorStyle.primaryColor_1570A5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Bxhejx, DE',
                    style: TextStylesCustom.textStyles_14,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              // ----------------------------------------------Date and Price-------------------------------->
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: ColorStyle.primaryColor_1570A5,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                              width: 120,
                              child: Text(
                                'Date',
                                style: TextStylesCustom.textStyles_14,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '11.11.2020',
                        style: TextStylesCustom.textStyles_14
                            .apply(fontWeightDelta: 1),
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.money,
                              color: ColorStyle.primaryColor_1570A5,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Price',
                              style: TextStylesCustom.textStyles_14,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '100 €',
                          style: TextStylesCustom.textStyles_14
                              .apply(fontWeightDelta: 1),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              // -------------------------------------------Exam time and Student------------------------->
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: ColorStyle.primaryColor_1570A5,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                              width: 120,
                              child: Text(
                                'Exam Time',
                                style: TextStylesCustom.textStyles_14,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '15:49:00',
                        style: TextStylesCustom.textStyles_14
                            .apply(fontWeightDelta: 1),
                      )
                    ],
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: ColorStyle.primaryColor_1570A5,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Student',
                            style: TextStylesCustom.textStyles_14,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Heuebd Jxjejfe',
                        style: TextStylesCustom.textStyles_14
                            .apply(color: ColorStyle.grey_5E6D77),
                      ),
                      Text(
                        'JohnDoe@gmail.com',
                        style: TextStylesCustom.textStyles_14
                            .apply(color: ColorStyle.grey_5E6D77),
                      ),
                      Text(
                        '9876545678',
                        style: TextStylesCustom.textStyles_14
                            .apply(color: ColorStyle.grey_5E6D77),
                      )
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 50,
              ),
              
              // ---------------------------------------------QR Code---------------------------------------->
              Center(
                child: Image.asset(ImageStyle.ticketBarcode, width: 200, height: 200,),
              )
            ],
          ),
        ),
      ),
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
                  Text(
                    items[index]['item'],
                    style: TextStylesCustom.textStyles_12
                        .apply(fontWeightDelta: 1),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Text(
                    items[index]['value'],
                    style: TextStylesCustom.textStyles_12
                        .apply(fontWeightDelta: 1),
                    textAlign: TextAlign.end,
                  )),
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
