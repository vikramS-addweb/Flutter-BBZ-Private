import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';
import '../Utils/Global.dart';
import '../Styles/ImageStyle.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BookingConfirmation extends StatelessWidget {
  BookingConfirmation({Key? key}) : super(key: key);

  List yourInformation = [
    {'item': 'First name', 'value': 'John'},
    {'item': 'Last name', 'value': 'Doe'},
    {'item': 'Identification No.', 'value': 'Lorem'},
    {'item': 'Email', 'value': 'johndoe@gmail.com'},
    {'item': 'Salutation', 'value': 'Lorem'},
    {'item': 'Academic title', 'value': 'Lorem ipsum'},
    {'item': 'Birth date', 'value': '22/03/1995'},
    {'item': 'Birth place', 'value': 'Korea'},
    {'item': 'Country of birth', 'value': 'South Korea'},
    {'item': 'Mother Tongue', 'value': 'India'},
    {'item': 'Telephone', 'value': '12345678'},
    {'item': 'Mobile', 'value': '+491234566'},
    {
      'item': 'Address',
      'value': 'Lorem ipsum, dolor sit amet, adipresq, sdf-123456'
    },
  ];

  List examDetail = [
    {'item': 'Exam Level:', 'value': 'A2-B1'},
    {'item': 'Exam date:', 'value': '03/31/2022 (SAT)'},
    {'item': 'Exam Time:', 'value': '09:30 AM'},
  ];

  List bookingDetails = [
    {'item': 'Booking Number:', 'value': '11'},
    {'item': 'Booking Date:', 'value': '03/30/2022'},
    {'item': 'Payment Method:', 'value': 'Visa ending with 3334'},
    {'item': 'Booking Status:', 'value': 'Booked'}
  ];

  final arrIcons = [
    // const Icon(Icons.location_on),
    SvgPicture.asset(ImageStyle.bookingConfirmation_location, height: 18,),
    SvgPicture.asset(ImageStyle.call, color: Colors.black,),
    SvgPicture.asset(ImageStyle.mail),
    // const Icon(Icons.call),
    // Icon(Icons.fax_outlined),


  //   const Icon(
  // Icons.mail_outline,
  // ),
  ];
  final arrTitle = [
    'Brüder Grimm Bildungscentrum e. V. Langstr.60 63452 Hanau',
    '+49 1234567',
    'admin@gmail.com'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        title: 'Booking Confirmation',
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Center(
                child: Image.asset(ImageStyle.bookingConfirmationBar, width: 250, height: 100,),
              ),
            ),
// -------------------------------------------------------Booking Successful block-------------------------->
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage(ImageStyle.examBG), fit: BoxFit.fill)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // decoration: const BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.all(Radius.circular(50))
                            // ),
                            margin: const EdgeInsets.only(top: 20),
                            height: 46,
                            width: 46,
                            child: SvgPicture.asset(ImageStyle.bookingSuccessful_green),
                            // child: Image.asset(ImageStyle.checkCircle, fit: BoxFit.fill,)
                          ),

                          const SizedBox(width: 19,),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Booking successful!', style: TextStylesCustom.textStyles_22.apply(color: Colors.white),),
                                SizedBox(height: 6,),
                                Text('Booking details has been sent to: johndoe@gmail.com', style: TextStylesCustom.textStyles_14.apply(color: Colors.white),)
                              ],
                            ),
                          )
                          // Icon(Icons.check_circle_sharp, color: Colors.green, size: 35,)
                        ],
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      height: 145,
                      color: ColorStyle.white_F3F3F3,
                    ),
                  ],
                ),
                Positioned(
                  top: 120,
                    left: 16,
                    right: 16,
                    child: Container(
                  padding: const EdgeInsets.all(15),
                  // width: Get.mediaQuery.size.width*.5,
                  // height: 200,
                  // color: Colors.blue,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: ColorStyle.grey_DAE1E7,
                          // spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(
                              0, 0), // changes position of shadow
                        ),
                      ]),
                      child: ItemsListCard(items: bookingDetails,),

                ))
              ],
            ),

            // ------------------------------------------------Your Booking-------------------------------------------->
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Your Booking',
                      style: TextStylesCustom.textStyles_18.apply(
                          color: ColorStyle.primaryColor_1570A5,
                          fontWeightDelta: 1),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text('''Deutschtest für Zuwanderer 
(DTZ / A2-B1) (PR-220409-HU-DTZ)''', style: TextStylesCustom.textStyles_15.apply(fontWeightDelta: 1),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:4.0, right: 5),
                          child: SvgPicture.asset(ImageStyle.bookingConfirmation_location),
                        ),
                        // const Icon(Icons.location_on),
                        Expanded(child: Text(
                          'Brüder Grimm Bildungscentrum e. V.Langstr. 60 63452 Hanau',
                          style: TextStylesCustom.textStyles_14.apply(
                              color: ColorStyle.primaryColor_1570A5,
                              fontWeightDelta: 1),))
                      ],
                    ),
                    const SizedBox(height: 31,),
                  ]),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: ColorStyle.grey_DAE1E7,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    ItemsList(items: examDetail, secondColor: ColorStyle.black,),
                    const SizedBox(
                      height: 16,
                    ),
                  ]),

            ),
            Container(
              width: double.infinity,
              height: 1,
              color: ColorStyle.grey_DAE1E7,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Examination Fees:',
                      style: TextStylesCustom.textStyles_14),
                  SizedBox(
                    width: Get.mediaQuery.size.width * 0.4,
                    child: Text('7,50 €',
                        textAlign: TextAlign.end,
                        style: TextStylesCustom.textStyles_14
                            .apply(color: ColorStyle.black)),
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              height: 1,
              color: ColorStyle.grey_DAE1E7,
            ),

            Padding(
              padding: const EdgeInsets.only(top:16.0, right: 16, left: 16, bottom: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total:',
                      style: TextStylesCustom.textStyles_18.apply(color: ColorStyle.primaryColor_1570A5, fontWeightDelta: 1)),
                  SizedBox(
                    width: Get.mediaQuery.size.width * 0.4,
                    child: Text('7,50 €',
                        textAlign: TextAlign.end,
                        style: TextStylesCustom.textStyles_18.apply(fontWeightDelta: 2)),
                  ),
                ],
              ),
            ),


            // ---------------------------------------------Your Information---------------------------------------->

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: ColorStyle.lightBlue_F2F2F2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Your Information',
                      style: TextStylesCustom.textStyles_18.apply(
                          color: ColorStyle.primaryColor_1570A5,
                          fontWeightDelta: 1),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    ItemsList(items: yourInformation),
                    const SizedBox(
                      height: 40,
                    ),
                  ]),
            ),

            // ---------------------------------------------------Contact us container ----------------------------->
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 27,),
                  Container(
                    width: Get.mediaQuery.size.width,
                    height: 5,
                    color: ColorStyle.primaryColor_1570A5,
                  ),
                  Container(
                    // height: 300,
                    width: Get.mediaQuery.size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    color: ColorStyle.primaryColor_1570A5.withOpacity(0.16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageStyle.lightbulb,
                              height: 60,
                              width: 45,
                              fit: BoxFit.fill,
                            ),
                            // Icon(Icons.lightbulb, size: 70, color: ColorStyle.orange_C16D00),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                Text(
                                  'Do you have a query?',
                                  style: TextStylesCustom.textStyles_16.apply(
                                      color: ColorStyle.primaryColor_1570A5,
                                      fontWeightDelta: 1),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                    'You can connect with us anytime!',
                                    style: TextStylesCustom.textStyles_14
                                        .apply(fontWeightDelta: 1)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.mediaQuery.size.width,
                    height: 1,
                    color: ColorStyle.primaryColor_1570A5,
                  ),
                  Container(
                    // height: 300,
                    width: Get.mediaQuery.size.width,
                    padding: const EdgeInsets.all(20),
                    color: ColorStyle.primaryColor_1570A5.withOpacity(0.16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Us',
                          style: TextStylesCustom.textStyles_16
                              .apply(fontWeightDelta: 1),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Deutschtest für Zuwanderer (DTZ / A2-B1)(PR-220409-HU-DTZ)',
                          style: TextStylesCustom.textStyles_12,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.separated(
                          itemCount: arrTitle.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 25,
                                  padding: EdgeInsets.only(top: 4),
                                  child: Row(
                                    children: [
                                      arrIcons[index],
                                      Expanded(
                                        child: SizedBox(
                                          width: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Text(
                                      arrTitle[index],
                                      style: TextStylesCustom.textStyles_12.apply(
                                          color: ColorStyle.primaryColor_1570A5),
                                    ))
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 91,)
          ],
        ),
      ),
    );
  }
}



class ItemsList extends StatelessWidget {
  ItemsList({Key? key, required this.items, this.secondColor}) : super(key: key);
  List items;
  Color? secondColor;
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
                SizedBox(
                  width: Get.mediaQuery.size.width * 0.6,
                  child: Text(items[index]['value'],
                      textAlign: TextAlign.end,
                      style: TextStylesCustom.textStyles_14
                          .apply(color: secondColor == null ? ColorStyle.grey_A8B0B5 : secondColor)),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ItemsListCard extends StatelessWidget {
  ItemsListCard({Key? key, required this.items}) : super(key: key);
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(items[index]['item'],
                    style: TextStylesCustom.textStyles_14.apply(fontWeightDelta: 2)),
                const SizedBox(width: 10,),
                Expanded(
                  child: SizedBox(
                    width: Get.mediaQuery.size.width * 0.5,
                    child: Text(items[index]['value'],
                        // textAlign: TextAlign.end,
                        style: TextStylesCustom.textStyles_14
                            .apply(color: ColorStyle.grey_A8B0B5, fontWeightDelta: 2)),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
