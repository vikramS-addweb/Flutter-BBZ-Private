import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';
import '../Utils/Global.dart';
import '../Styles/ImageStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Components/TextFieldCustom.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/DateFieldCustom.dart';
import 'BookingForm.dart';
import '../Controller/ExamDetailController.dart';
import 'package:flutter_html/flutter_html.dart';
import '../Utils/Constant.dart';


class ExamDetail extends StatelessWidget {
  ExamDetail({Key? key, required this.id}) : super(key: key);
  final controller = Get.put(ExamDetailController());
  final int? id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
        initState: (state){
          controller.initMethods(id!);
        },
        builder: ((controller) =>
        Obx(() =>
        controller.examDetailData.isEmpty ? Container(color: Colors.white,) : Scaffold(
          appBar: AppBarStyle(
            title:
                controller.examDetailData['title'] != null ? '${controller.examDetailData['title']}':
                '''      Deutschtest für Zuwanderer
(DTZ / A2-B1) (PR-220409-HU-DTZ)''',
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
          bottomNavigationBar:
          Container(

            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorStyle.grey_DAE1E7,
                    // spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(
                        0, 0), // changes position of shadow
                  ),]
            ),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const SizedBox(width: 10,),
                  Text('Fee', style: TextStylesCustom.textStyles_16.apply(color: ColorStyle.grey_5E6D77),),
                  const SizedBox(width: 13,),
                  Text('${controller.examDetailData['price']} €', style: TextStylesCustom.textStyles_22.apply(color: ColorStyle.primaryColor_1570A5),),
                  const SizedBox(width: 35,),
                  Expanded(
                      child:
                      DateTime.parse('${controller.examDetailData['reg_until_date']}').difference(DateTime.now()).inMinutes < 0 ?
                      ElevatedButtonCustoms(
                        onTap: (){

                        },
                        text: 'Exam Expired',
                        colorBG: ColorStyle.primaryColor_1570A5,
                      ):
                      ElevatedButtonCustoms(
                        onTap: (){
                          if(!(controller.isBooked.value || controller.examDetailData['available_seats'] == 0)){

                            if(kTOKENSAVED!=""){
                              controller.bookNowVerityEmail();
                            }else{
                              BookingForm(examDetails: controller.examDetailData.value,).navigateToCustom(context, withNavBar: false);
                            }
                          }
                        },
                        text: '${controller.isBooked.value ? 'ALREADY BOOKED' : (controller.examDetailData['available_seats'] != null && controller.examDetailData['available_seats'] == 0) ? 'SEATS NOT AVAILABLE' : 'BOOK NOW'}',
                        colorBG: ColorStyle.primaryColor_1570A5,
                      )
                  )
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [


// -------------------------------------------------------Booking Successful block-------------------------->
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          padding: const EdgeInsets.only(
                              left: 10,right: 10, top: 28),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ImageStyle.examBG),
                                  fit: BoxFit.fill)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  '${controller.examDetailData['exam_level'] ?? 'A2-B1 Level'}',

                                  style: TextStylesCustom.textStyles_21
                                      .apply(color: Colors.white, fontWeightDelta: 1),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),

                                  const SizedBox(
                                    width: 5,
                                  ),

                                  Expanded(
                                    child:
                                    controller.examDetailData['location'] != null ? Text(
                                      '${controller.examDetailData['location']['name'] ?? '' } '
                                          '${controller.examDetailData['location']['street_name'] ?? '' } '
                                          '${controller.examDetailData['location']['city'] ?? '' } '
                                          '${controller.examDetailData['location']['zip_code'] ?? '' }',
                                      style: TextStylesCustom.textStyles_14
                                          .apply(color: Colors.white),
                                    ) :
                                    Text(
                                      'Brüder Grimm Bildungscentrum e. V. Langstr.60 63452 Hanau',
                                      style: TextStylesCustom.textStyles_14
                                          .apply(color: Colors.white),
                                    ),
                                  )
                                  // Icon(Icons.check_circle_sharp, color: Colors.green, size: 35,)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 250,
                          color: ColorStyle.white_F3F3F3,
                        ),
                      ],
                    ),
                    // -----------------------------------------------------Card Content---------------------------------->
                    Positioned(
                      top: 120,
                      left: 10,
                      right: 10,
                      child: Container(
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
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 28,
                                      height: 28,
                                      child: Image.asset(ImageStyle.user,fit: BoxFit.fill, color: circleColor((controller.examDetailData['available_seats'] * 100/controller.examDetailData['total_seat']).round()) ?? Colors.green,),
                                    ),
                                    const SizedBox(width: 10,),
                                    Text('Seats Available   ', style: TextStylesCustom.textStyles_14.apply(color: circleColor((controller.examDetailData['available_seats'] * 100/controller.examDetailData['total_seat']).round()) ?? Colors.green, fontWeightDelta: 2),),
                                    Text('|', style: TextStylesCustom.textStyles_14.apply( color:circleColor((controller.examDetailData['available_seats'] * 100/controller.examDetailData['total_seat']).round()) ??  Colors.green, fontWeightDelta: 2),),
                                    const SizedBox(width: 10,),
                                    // Text('400/500', style: TextStylesCustom.textStyles_14.apply(color: Colors.green),)

                                    Text('${controller.examDetailData['available_seats'] ?? '400'}/${controller.examDetailData['total_seat'] ?? '500'}', style: TextStylesCustom.textStyles_14.apply(color:circleColor((controller.examDetailData['available_seats'] * 100/controller.examDetailData['total_seat']).round()) ??  Colors.green),)
                                  ],
                                ),
                                const SizedBox(height: 30,),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 28,
                                      height: 28,
                                      child: Image.asset(ImageStyle.feather_calendar,fit: BoxFit.fill,),
                                    ),
                                    const SizedBox(width: 10,),
                                    Text('Exam Date  ', style: TextStylesCustom.textStyles_14.apply( fontWeightDelta: 2),),
                                    Text(' |', style: TextStylesCustom.textStyles_14.apply( color: ColorStyle.grey_DAE1E7, fontWeightDelta: 2),),
                                    const SizedBox(width: 10,),
                                    // Text( '25/03/2022 (SAT)', style: TextStylesCustom.textStyles_14.apply(color: ColorStyle.primaryColor_1570A5),)

                                    Text( controller.examDetailData['exam_date'] != null ? '${DateFormat('dd/MM/yyyy (EE)').format(DateTime.parse('${controller.examDetailData['exam_date']}'))}':'25/03/2022 (SAT)', style: TextStylesCustom.textStyles_14.apply(color: ColorStyle.primaryColor_1570A5),)
                                  ],
                                ),
                                const SizedBox(height: 30,),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 28,
                                      height: 28,
                                      child: Image.asset(ImageStyle.hourglass,fit: BoxFit.fill, color: controller.examDetailData['reg_until_date'] != null ? registrationColor(DateTime.parse('${controller.examDetailData['reg_until_date']}')) : Colors.black,),
                                    ),
                                    const SizedBox(width: 10,),
                                    Text('Reg. Until   ', style: TextStylesCustom.textStyles_14.apply(color: controller.examDetailData['reg_until_date'] != null ? registrationColor(DateTime.parse('${controller.examDetailData['reg_until_date']}')) : ColorStyle.orange_C16D00, fontWeightDelta: 2),),
                                    Text('|', style: TextStylesCustom.textStyles_14.apply( color: controller.examDetailData['reg_until_date'] != null ? registrationColor(DateTime.parse('${controller.examDetailData['reg_until_date']}')) : ColorStyle.orange_C16D00, fontWeightDelta: 2),),
                                    const SizedBox(width: 10,),
                                    // Text('25/03/2022', style: TextStylesCustom.textStyles_14.apply(color: ColorStyle.orange_C16D00),)
                                    Text(controller.examDetailData['reg_until_date'] != null ? '${DateFormat('dd/MM/yyyy').format(DateTime.parse('${controller.examDetailData['reg_until_date']}'))}':'25/03/2022', style: TextStylesCustom.textStyles_14.apply(color: registrationColor(DateTime.parse('${controller.examDetailData['reg_until_date']}'))),)

                                  ],
                                ),
                                const SizedBox(height: 30,),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 28,
                                      height: 28,
                                      child: Image.asset(ImageStyle.legal_document,fit: BoxFit.fill,),
                                    ),
                                    const SizedBox(width: 10,),
                                    Text('Exam Time   ', style: TextStylesCustom.textStyles_14.apply(fontWeightDelta: 2),),
                                    Text(' |', style: TextStylesCustom.textStyles_14.apply( color: ColorStyle.grey_DAE1E7, fontWeightDelta: 2),),
                                    const SizedBox(width: 10,),
                                    // Text('09:30 AM', style: TextStylesCustom.textStyles_14.apply(color: ColorStyle.primaryColor_1570A5),)
                                    Text(controller.examDetailData['exam_time'] != null ? '${DateFormat.jm().format(DateTime.parse('${controller.examDetailData['exam_date']}T${controller.examDetailData['exam_time']}'))}':'09:30 AM', style: TextStylesCustom.textStyles_14.apply(color: ColorStyle.primaryColor_1570A5),)
                                  ],
                                )
                              ],

                            ),
                          )
                        ]),
                      ),
                    )
                  ],
                ),
                // --------------------------------------------Booking Submission ------------------------------>
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 35,),
                      Text('Description', style: TextStylesCustom.textStyles_17.apply(color: ColorStyle.primaryColor_1570A5, fontWeightDelta: 1),),
                      const SizedBox(height: 6,),
                      controller.examDetailData['content'] != null?
                      Html(
                          style: {
                            'p':Style.fromTextStyle(TextStylesCustom.textStyles_14),
                            "body": Style(margin: Margins.zero, padding: EdgeInsets.zero,)
                          },
                          data: controller.examDetailData['content']
                      ):
                      Text('Libero sem vitae sed donec conubia integer nisi integer rhoncus imperdiet orci odio libero est integer a integer tincidunt sollicitudin blandit fusce nibh leo vulputate lobortis egestas dapibus faucibus metus conubia maecenas cras potenti cum hac arcu rhoncus nullam eros dictum torquent integer cursus bibendum sem sociis molestie tellus purus Quam fusce convallis ipsum malesuada amet velit aliquam urna nullam vehicula fermentum id morbi dis magnis porta sagittis euismod etiam',style: TextStylesCustom.textStyles_14,),
                      // Text(controller.examDetailData['content'] != null ? '${controller.examDetailData['content']}' :'Libero sem vitae sed donec conubia integer nisi integer rhoncus imperdiet orci odio libero est integer a integer tincidunt sollicitudin blandit fusce nibh leo vulputate lobortis egestas dapibus faucibus metus conubia maecenas cras potenti cum hac arcu rhoncus nullam eros dictum torquent integer cursus bibendum sem sociis molestie tellus purus Quam fusce convallis ipsum malesuada amet velit aliquam urna nullam vehicula fermentum id morbi dis magnis porta sagittis euismod etiam',style: TextStylesCustom.textStyles_14,),
                      const SizedBox(height: 33,),
                      Text('Was müssen Sie für diese Prüfungkönnen?', style: TextStylesCustom.textStyles_17.apply(color: ColorStyle.primaryColor_1570A5, fontWeightDelta: 1),),
                      const SizedBox(height: 6,),
                      Text('Sie können sich spontan und fließend ausdrücken. Mit umgangssprachlichen Wendungen sind Sie vertraut und können den Sprachstil gezielt variieren. Sie behalten ein hohes Maß an grammatischer Korrektheit bei.',style: TextStylesCustom.textStyles_14,),
                      const SizedBox(height: 72,)

                    ],
                  ),
                )

              ],
            ),
          ),
        )
        )
            ))
      ;
  }
}


