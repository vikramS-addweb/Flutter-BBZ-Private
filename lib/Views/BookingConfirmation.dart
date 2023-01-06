import 'package:bbz/Components/ElevatedButtonCustom.dart';
import 'package:bbz/Controller/ExamScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../Controller/PersistentNavBarController.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';
import '../Utils/Global.dart';
import '../Styles/ImageStyle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Controller/BookingConfirmationController.dart';
import 'package:intl/intl.dart';
import '../Controller/ExamDetailController.dart';
import './PersistentBottomNavBarCustom.dart';



class BookingConfirmation extends StatelessWidget {
  BookingConfirmation({
    Key? key,
    required this.code
  }) : super(key: key);
  String code;

  final controller = Get.put(BookingConfirmationController());
  final examDetalController = Get.put(ExamDetailController());

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
    {'item': 'Booking Status:', 'value': 'Booked'.tr}
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
    'BBZ Altenkirchen GmbH & Co. KG Konrad-Adenauer-Platz 5 57610 Altenkirchen'.tr,
    '02681 8797-0'.tr,
    'admin@gmail.com'.tr
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        initState: (state){
          controller.initMethods(code);
        },
        init: controller,
        builder: ((controller)=>Obx(() => controller.bookingConfirmationData.isEmpty ? Container(color: Colors.white,) : 
        WillPopScope(
            onWillPop: () async {
              // Do something here
              final navbarController = Get.find<PersistentNavBarController>();
              
              Get.offAll(()=> PersistentBottomNavBarCustom(initialIndex: 0));
              return true;
            },
            child:Scaffold(
              appBar: AppBarStyle(
                title: 'Booking Confirmation'.tr,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorStyle.primaryColor_1570A5,
                    size: 30,
                  ),
                  onPressed: () {
                    final navbarController = Get.find<PersistentNavBarController>();
              navbarController.isNavBarActive.value = true;
              Get.offAll(()=> PersistentBottomNavBarCustom(initialIndex: 0));
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
                        child: Get.locale.toString().contains('de') ? Image.asset(ImageStyle.bookingConfirmationBarGerman, width: 250, height: 100,) : Image.asset(ImageStyle.bookingConfirmationBar, width: 250, height: 100,),
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
                                        Text('Booking successful!'.tr, style: TextStylesCustom.textStyles_22.apply(color: Colors.white),),
                                        SizedBox(height: 6,),
                                        Text('Booking details has been sent to'.tr+':' +' ${controller.bookingConfirmationData['email'] ?? 'johndoe@gmail.com'}', style: TextStylesCustom.textStyles_14.apply(color: Colors.white),)
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
                              child: ItemsListCard(items: [
                                {'item': 'Booking Number'.tr+':', 'value': '${controller.bookingConfirmationData['id'] != null ? controller.bookingConfirmationData['id'] : ''}'},
                                {'item': 'Booking Date'.tr+':', 'value': '${ controller.bookingConfirmationData['created_at']!=null ? DateFormat('dd/MM/yyyy').format(DateTime.parse('${controller.bookingConfirmationData['created_at']}')) : ''}'},
                                {'item': 'Payment Method'.tr+':', 'value': '${controller.bookingConfirmationData['gateway'] != null ? controller.bookingConfirmationData['gateway'] : ''}'},
                                {'item': 'Booking Status'.tr+':', 'value': 'Booked'.tr}
                              ],),

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
                              'Your Booking'.tr,
                              style: TextStylesCustom.textStyles_18.apply(
                                  color: ColorStyle.primaryColor_1570A5,
                                  fontWeightDelta: 1),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            controller.bookingConfirmationData['booked_event']['title'] != null ?
                            Text(controller.bookingConfirmationData['booked_event']['title'], style: TextStylesCustom.textStyles_15.apply(fontWeightDelta: 1),):
                            Text('', style: TextStylesCustom.textStyles_15.apply(fontWeightDelta: 1),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:4.0, right: 5),
                                  child: SvgPicture.asset(ImageStyle.bookingConfirmation_location),
                                ),
                                // const Icon(Icons.location_on),
                                Expanded(child:
                                examDetalController.examDetailData['location'] != null ? Text(
                                  '${examDetalController.examDetailData['location']['name'] ?? '' } '
                                      '${examDetalController.examDetailData['location']['street_name'] ?? '' } '
                                      '${examDetalController.examDetailData['location']['city'] ?? '' } '
                                      '${examDetalController.examDetailData['location']['zip_code'] ?? '' }',
                                  style: TextStylesCustom.textStyles_14.apply(
                                      color: ColorStyle.primaryColor_1570A5,
                                      fontWeightDelta: 1),
                                ) :
                                Text(
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
                            ItemsList(items: [{'item': 'Exam Level'.tr+':', 'value': '${controller.bookingConfirmationData['booked_event']['term'][0]['name'] ?? ''}  '},
                              {'item': 'Exam Date'.tr+':', 'value': controller.bookingConfirmationData['booked_event'] != null && controller.bookingConfirmationData['booked_event']['exam_date'] != null ? DateFormat('dd/MM/yyyy (EE)').format(DateTime.parse('${controller.bookingConfirmationData['booked_event']['exam_date']}')):''},
                              {'item': 'Exam Time'.tr+':', 'value': controller.bookingConfirmationData['booked_event'] != null && controller.bookingConfirmationData['booked_event']['exam_time'] != null ? DateFormat.jm().format(DateTime.parse('${controller.bookingConfirmationData['booked_event']['exam_date']}T${controller.bookingConfirmationData['booked_event']['exam_time']}')):''},
                            ], secondColor: ColorStyle.black,),
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
                          Text('Examination Fees'.tr+':',
                              style: TextStylesCustom.textStyles_14),
                          SizedBox(
                            width: Get.mediaQuery.size.width * 0.4,
                            child: Text('${controller.bookingConfirmationData['booked_event']['sale_price'] ?? controller.bookingConfirmationData['booked_event']['price'] ?? ''} €',
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
                          Text('Total'.tr +':',
                              style: TextStylesCustom.textStyles_18.apply(color: ColorStyle.primaryColor_1570A5, fontWeightDelta: 1)),
                          SizedBox(
                            width: Get.mediaQuery.size.width * 0.4,
                            child:
                            Text('${controller.bookingConfirmationData['total'] ?? ''} €',
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
                              'Your Information'.tr,
                              style: TextStylesCustom.textStyles_18.apply(
                                  color: ColorStyle.primaryColor_1570A5,
                                  fontWeightDelta: 1),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            ItemsList(items: [
                              {'item': 'First Name'.tr, 'value': controller.bookingConfirmationData['first_name'] ?? ''},
                              {'item': 'Last Name'.tr, 'value': controller.bookingConfirmationData['last_name'] ?? ''},
                              {'item': 'Identification No.'.tr, 'value': controller.bookingConfirmationData['identification_number'] ?? ''},
                              {'item': 'Email'.tr, 'value': controller.bookingConfirmationData['email'] ?? ''},
                              {'item': 'Salutation'.tr, 'value': controller.bookingConfirmationData['salutation'] ?? ''},
                              {'item': 'Academic Title'.tr, 'value': controller.bookingConfirmationData['academic_title'] ?? ''},
                              {'item': 'Birth Date'.tr, 'value': controller.bookingConfirmationData['birth_date']!=null ? DateFormat('dd/MM/yyyy').format(DateTime.parse('${controller.bookingConfirmationData['birth_date']}')) : ''},
                              {'item': 'Birth Place'.tr, 'value': controller.bookingConfirmationData['birth_place'] ?? ''},
                              {'item': 'Country Of Birth'.tr, 'value': controller.bookingConfirmationData['country_Of_birth'] ?? ''},
                              {'item': 'Mother Tongue'.tr, 'value': controller.bookingConfirmationData['mother_tongue'] ?? ''},
                              {'item': 'Telephone'.tr, 'value': controller.bookingConfirmationData['tele_phone'] ?? ''},
                              {'item': 'Mobile'.tr, 'value': controller.bookingConfirmationData['phone'] ?? ''},
                              {
                                'item': 'Address'.tr,
                                'value': '${controller.bookingConfirmationData['street'] ?? ''}, ${controller.bookingConfirmationData['city'] ?? ''}, ${controller.bookingConfirmationData['zip_code'] ?? ''}'
                              },
                            ]),
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
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          // const SizedBox(
                                          //   height: 10,
                                          // ),
                                          Text(
                                            'Do you have a query?'.tr,
                                            style: TextStylesCustom.textStyles_16.apply(
                                                color: ColorStyle.primaryColor_1570A5,
                                                fontWeightDelta: 1),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                              'You can connect with us anytime!'.tr,
                                              style: TextStylesCustom.textStyles_14
                                                  .apply(fontWeightDelta: 1)),
                                        ],
                                      ),
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
                                  'Contact Us'.tr,
                                  style: TextStylesCustom.textStyles_16
                                      .apply(fontWeightDelta: 1),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Die BBZ Sprachschulen sind ein Angebot der BBZ Altenkirchen GmbH & Co. KG'.tr,
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
                          SizedBox(height: 20,),
                          ElevatedButtonCustoms(text: 'Go back to Home page'.tr, onTap: (){
                             Get.offAll(()=> PersistentBottomNavBarCustom(initialIndex: 0));
                          },
                            width: Get.size.width,
                            colorBG: ColorStyle.primaryColor_1570A5,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 91,)
                  ],
                ),
              ),
            )))
        ) );

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
                Expanded(
                  // width: Get.mediaQuery.size.width * 0.6,
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
