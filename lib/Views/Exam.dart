import 'package:bbz/Components/PickerCustom.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:intl/intl.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../Components/ProgressBarCustom.dart';
import '../../Components/ElevatedButtonCustom.dart';
import '../Views/DrawerScreen.dart';
import '../Utils/Constant.dart';
import '../Components/BottomNavBarCustom.dart';
import '../Utils/Global.dart';
import 'BookingConfirmation.dart';
import 'ExamDetail.dart';
import '../Components/DropdownButtonCustom.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../Controller/WelcomeController.dart';
import '../Controller/ExamController.dart';
import '../Controller/ExamDetailController.dart';
import '../Components/TextFieldCustom.dart';

class Exam extends StatefulWidget {
  const Exam({Key? key}) : super(key: key);
  @override
  State<Exam> createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  GlobalKey<ScaffoldState> keyDrawer = GlobalKey();

  final welcomeController = Get.put(WelcomeController());
  final examDetailController = Get.put(ExamDetailController());
  final controller = Get.put(ExamController());

  @override
  initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      welcomeController.isBackVisible.value = true;
    });
  }

  // textIcon(ImageProvider IconImage, String text, bool isBorder) {
  //   return InkWell(
  //     child: Container(
  //       padding: const EdgeInsets.only(
  //         top: 16,
  //         bottom: 10,
  //         left: 16,
  //         right: 16,
  //       ),
  //       decoration: BoxDecoration(
  //           border: isBorder
  //               ? Border(
  //                   bottom: BorderSide(
  //                   width: 1,
  //                   color: ColorStyle.grey_DAE1E7,
  //                 ))
  //               : Border()),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             children: [
  //               SizedBox(
  //                 width: 20,
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     Image(
  //                       image: IconImage,
  //                       width: 15,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //
  //               // Icon(
  //               //   icon,
  //               //   color: ColorStyle.primaryColor_1570A5,
  //               //   size: 26,
  //               // ),
  //               const SizedBox(width: 6),
  //               Expanded(
  //                 child: Text(
  //                   text,
  //                   style: TextStylesCustom.textStyles_14.apply(
  //                     color: ColorStyle.grey_A8B0B5,
  //                     // fontWeightDelta: 1,
  //                   ),
  //                 ),
  //               ),
  //               Icon(
  //                 Icons.keyboard_arrow_down,
  //                 color: ColorStyle.primaryColor_1570A5,
  //                 size: 34,
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //     onTap: () {
  //       PickerCustom.datePicker(
  //         dateFormat: 'dd MMM yyyy',
  //         selectedDate: DateTime.now(),
  //         firstDate: DateTime.now(),
  //         lastDate: DateTime(2030),
  //       );
  //     },
  //   );
  // }

  datePicker(String title, {required bool isFrom}) {
    return InkWell(
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: ColorStyle.grey_DAE1E7, width: 1),
        ),
        child: Text(
          title == 'From' ? 'From'.tr : title == 'To' ? 'To'.tr : title,
          style: TextStylesCustom.textStyles_14.apply(
              // color: ColorStyle.grey_A8B0B5,
              color: (title == 'From' || title == 'To')
                  ? ColorStyle.grey_A8B0B5
                  : Colors.black),
        ),
      ),
      onTap: () async {
        final date = await PickerCustom.datePicker(
          dateFormat: 'dd MMM yyyy',
          selectedDate: (title == 'From') ? DateTime.now() : isFrom ? controller.dateFromMinDateForTo.value : (controller.dateTo.value == 'To' ? controller.dateFromMinDateForTo.value : DateFormat('dd MMM yyyy').parse(controller.dateTo.value)),
          firstDate: isFrom ? DateTime.now() : controller.dateFromMinDateForTo.value,
          lastDate: DateTime(2030),
        );

        if (date != null) {
          if (isFrom) {
            controller.dateFrom.value = date.toString();
            controller.dateFromMinDateForTo.value = DateFormat('dd MMM yyyy').parse(date.toString());

            final dateFrom = DateFormat('dd MMM yyyy').parse(controller.dateFrom.value.toString());
            final dateTo = DateFormat('dd MMM yyyy').parse(controller.dateTo.value.toString());

            if (dateFrom.compareTo(dateTo) > 0) {
              debugPrint("dateFrom is after dateTo");

              controller.dateTo.value = 'To';
            }
          } else {
            controller.dateTo.value = date.toString();
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        initState: (state) {
          controller.initMethods();
        },
        builder: (controller) {
          return Obx(() => Scaffold(
                key: keyDrawer,
                backgroundColor: ColorStyle.white_F3F3F3,
                drawer: DrawerScreen(),
                appBar: AppBarStyle(
                  title: 'Exams'.tr,
                  leading: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: ColorStyle.primaryColor_1570A5,
                      size: 30,
                    ),
                    onPressed: () {
                      keyDrawer.currentState!.openDrawer();
                    },
                  ),
                  styleTitle: TextStylesCustom.textStyles_22.apply(
                    color: ColorStyle.primaryColor_1570A5,
                    fontWeightDelta: 1,
                  ),
                  elevation: 2,
                ),
                // bottomNavigationBar: bottomNavBarCustom(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        // height: 475,
                        child: Stack(
                          // clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              ImageStyle.examBG,
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      'Book Your Exam Now!'.tr,
                                      style: TextStylesCustom.textStyles_26.apply(
                                        color: Colors.white,
                                        // fontWeightDelta: 1,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Use the search filters to find specific courses faster and easier'.tr,
                                    style: TextStylesCustom.textStyles_14.apply(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  // height: 320,
                                  width: Get.mediaQuery.size.width,
                                  margin: const EdgeInsets.only(
                                      top: 120, left: 16, right: 16),
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorStyle.grey_DAE1E7,
                                          blurRadius: 4,
                                          offset: const Offset(
                                              0, 0), // changes position of shadow
                                        ),
                                      ]),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 16, bottom: 16),
                                        width: Get.mediaQuery.size.width,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                          width: 2,
                                          color: ColorStyle.grey_DAE1E7,
                                        ))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Location, Date or Level'.tr,
                                              style: TextStylesCustom.textStyles_16
                                                  .apply(
                                                color: ColorStyle.grey_5E6D77,
                                                // fontWeightDelta: 1,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: TextFormFieldOutline(
                                                padding: const EdgeInsets.all(0),
                                                colorBoder: Colors.transparent,
                                                controller: controller.search,
                                                hintText:
                                                    'Search everything here...'.tr,
                                                colorHint: ColorStyle
                                                    .primaryColor_1570A5
                                                    .withOpacity(0.6),
                                                textStyle: TextStylesCustom
                                                    .textStyles_16
                                                    .apply(
                                                  color: ColorStyle
                                                      .primaryColor_1570A5
                                                      .withOpacity(1),
                                                  fontWeightDelta: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DropdownButtonCustom(
                                        controllerValue: controller.location,
                                        width:
                                            MediaQuery.of(context).size.width - 32,
                                        height: 50,
                                        hintText: 'Select Your Center Location'.tr,
                                        list: controller
                                                    .searchDetails['locations'] !=
                                                null
                                            ? controller.searchDetails['locations']
                                            : [
                                                {'name': 'One'},
                                                {'name': 'Two'},
                                                {'name': 'Three'}
                                              ],
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        colorIcon: ColorStyle.primaryColor_1570A5,
                                        icon: Svg(
                                          ImageStyle.ticket_location,
                                        ),
                                        textStyle: TextStylesCustom.textStyles_14,
                                        onChanged: (value) {
                                          print(value);
                                          controller.location.value = value!;
                                        },
                                      ),
                                      Container(
                                        height: 1,
                                        color: ColorStyle.grey_DAE1E7,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 20,
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: ColorStyle.grey_DAE1E7,
                                                  width: 1)),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              ImageStyle.calendar,
                                              height: 20,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                child: datePicker(
                                                    controller.dateFrom.value,
                                                    isFrom: true)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                child: datePicker(
                                                    controller.dateTo.value,
                                                    isFrom: false)),
                                          ],
                                        ),
                                      ),
                                      DropdownButtonCustom(
                                        controllerValue: controller.language,
                                        width:
                                            MediaQuery.of(context).size.width - 32,
                                        height: 50,
                                        hintText: 'Select Your Language Level'.tr,
                                        list: controller
                                                    .searchDetails['exam_level'] !=
                                                null
                                            ? controller.searchDetails['exam_level']
                                            : [
                                                {'name': 'One'},
                                                {'name': 'Two'},
                                                {'name': 'Three'}
                                              ],
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        colorIcon: ColorStyle.primaryColor_1570A5,
                                        textStyle: TextStylesCustom.textStyles_14,
                                        icon: Svg(ImageStyle.language),
                                        onChanged: (value) {
                                          controller.language.value = value!;
                                        },
                                      ),
                                      SizedBox(height: 50,)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 23,),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButtonCustom(
                                      text: 'SEARCH'.tr,
                                      size: const Size(170, 46),
                                      onTap: () {
                                        controller.searchExam();
                                      },
                                    ),
                                    if (controller.showSearchData.value)
                                      SizedBox(width: 5,),
                                    if (controller.showSearchData.value)
                                      ElevatedButtonCustom(
                                        text: 'CLEAR'.tr,
                                        size: const Size(170, 46),
                                        onTap: () {
                                          controller.clear();
                                          // controller.userLogin();
                                          // Get.to(const Login());
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              '${!controller.showSearchData.value ? 'Upcoming Exams'.tr : 'Search Results'.tr}',
                              style: TextStylesCustom.textStyles_18.apply(
                                color: ColorStyle.primaryColor_1570A5,
                                fontWeightDelta: 1,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            controller.showSearchData.value ?
                                    controller.searchResultData.value.length ==
                                        0
                                ? Text(
                                    'Exam not found'.tr,
                                    style: TextStylesCustom.textStyles_16.apply(
                                      color: Colors.black,
                                    ),
                                  )
                                :
                            Text(
                                    'All the coming exams for you'.tr,
                                    style: TextStylesCustom.textStyles_14.apply(
                                      color: Colors.black,
                                    ),
                                  ) :
                            controller.upcomingExamData.value.length ==
                                0
                                ? Text(
                              'Exam not found'.tr,
                              style: TextStylesCustom.textStyles_16.apply(
                                color: Colors.black,
                              ),
                            )
                                :
                            Text(
                              'All the coming exams for you'.tr,
                              style: TextStylesCustom.textStyles_14.apply(
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ItemsList(
                                items: controller.showSearchData.value
                                    ? controller.searchResultData.value
                                    : controller.upcomingExamData.value),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}

class ItemsList extends StatelessWidget {
  ItemsList({Key? key, required this.items}) : super(key: key);
  
  final controller = Get.put(ExamController());
  
  List items;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          itemCount: items.length,
          // itemCount: 5,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return Container(
              // color: Colors.red,
              height: 40,
            );
          },
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // examDetailController.fetchExamDetails(controller.upcomingExamData[index]['id']);
                if (items[index]['id'] != null)
                  ExamDetail(id: items[index]['id'])
                      .navigateToCustom(context, withNavBar: false);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorStyle.grey_DAE1E7)),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        (items[index]['image'] != null &&
                                items[index]['image']['file_path'] != null)
                            ? Image.network(
                                '${kBaseURL_Image}${items[index]['image']['file_path']}')
                            : Image.asset(
                                ImageStyle.pixabay,
                                height: 250,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                        Positioned(
                          top: -12,
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 40, bottom: 40),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Svg(
                                  'assets/Images/exam_redBlock.svg',
                                ),
                                fit: BoxFit.fill,
                              ),
                              // color: ColorStyle.red_ED0925
                            ),
                            child: items[index]['term_name'] != null
                                ? Text(
                                    items[index]['term_name'],
                                    style: TextStylesCustom.textStyles_16.apply(
                                      color: Colors.white,
                                      fontWeightDelta: 1,
                                    ),
                                  )
                                : Text(
                                    '',
                                    style: TextStylesCustom.textStyles_16.apply(
                                      color: Colors.white,
                                      fontWeightDelta: 1,
                                    ),
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 16,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ColorStyle.primaryColor_1570A5),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child:Text(
                                    '${items[index]['sale_price'] ?? items[index]['price']} €',
                                    style: TextStylesCustom.textStyles_22.apply(
                                      color: Colors.white,
                                      fontWeightDelta: 1,
                                    ),
                                  )
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          items[index]['title'] != null
                              ? Text('${items[index]['title']}',
                                  style: TextStylesCustom.textStyles_14.apply(
                                    color: Colors.black,
                                  ))
                              : Text(
                                  '',
                                  style: TextStylesCustom.textStyles_14.apply(
                                    color: Colors.black,
                                  ),
                                ),
                          const SizedBox(
                            height: 12,
                          ),

                          Row(
                            children: [
                              Expanded(
                                  child: FittedBox(
                                    child: Text.rich(
                                        TextSpan(
                                            text: '',
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text: 'Exam Date'.tr+': ',
                                                style: TextStylesCustom.textStyles_14
                                                    .apply(
                                                    color: Colors.black,
                                                    fontWeightDelta: 2),
                                              ),
                                              TextSpan(
                                                text: '${items[index]['exam_date'] != null ?  DateFormat('dd/MM/yyyy').format(DateTime.parse('${items[index]['exam_date']}')) : ''}',
                                                style: TextStylesCustom
                                                    .textStyles_14
                                                    .apply(
                                                  color: ColorStyle
                                                      .primaryColor_1570A5,
                                                ),
                                              )
                                              ,
                                              TextSpan(
                                                text: '   '+'Reg. Until'.tr+': ',
                                                style: TextStylesCustom.textStyles_14
                                                    .apply(
                                                    color: Colors.black,
                                                    fontWeightDelta: 2),
                                              ),
                                              TextSpan(
                                                text: '${items[index]['reg_until_date'] !=
                                                    null
                                                    ? DateFormat('dd/MM/yyyy').format(DateTime.parse('${items[index]['reg_until_date']}')) : ''}',
                                                style: TextStylesCustom
                                                    .textStyles_14
                                                    .apply(
                                                  color: registrationColor(DateTime.parse('${items[index]['reg_until_date']}')),
                                                ),
                                              )
                                            ]
                                        )
                                    ),
                                  )
                              )
                            ],
                          ),



                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Row(
                          //         children: [
                          //           Expanded(
                          //             child: FittedBox(
                          //               child: Text(
                          //                 'Exam Date'.tr+': ',
                          //                 style: TextStylesCustom.textStyles_14
                          //                     .apply(
                          //                         color: Colors.black,
                          //                         fontWeightDelta: 2),
                          //               ),
                          //             ),
                          //           ),
                          //           Expanded(
                          //             child: FittedBox(
                          //               child: items[index]['exam_date'] != null
                          //                   ? Text(
                          //                       '${DateFormat('dd/MM/yyyy').format(DateTime.parse('${items[index]['exam_date']}'))}',
                          //                       style: TextStylesCustom
                          //                           .textStyles_14
                          //                           .apply(
                          //                         color: ColorStyle
                          //                             .primaryColor_1570A5,
                          //                       ),
                          //                     )
                          //                   : Text(
                          //                       '22/06/2022',
                          //                       style: TextStylesCustom
                          //                           .textStyles_14
                          //                           .apply(
                          //                         color: ColorStyle
                          //                             .primaryColor_1570A5,
                          //                       ),
                          //                     ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     const SizedBox(
                          //       width: 10,
                          //     ),
                          //     Expanded(
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             'Reg. Until'.tr+': ',
                          //             style: TextStylesCustom.textStyles_14
                          //                 .apply(
                          //                     color: Colors.black,
                          //                     fontWeightDelta: 2),
                          //           ),
                          //           FittedBox(
                          //             // fit: BoxFit.fitWidth,
                          //             child: items[index]['reg_until_date'] !=
                          //                     null
                          //                 ? Text(
                          //                     '${DateFormat('dd/MM/yyyy').format(DateTime.parse('${items[index]['reg_until_date']}'))}',
                          //                     style: TextStylesCustom
                          //                         .textStyles_14
                          //                         .apply(
                          //                       color: registrationColor(DateTime.parse('${items[index]['reg_until_date']}')),
                          //                     ),
                          //                   )
                          //                 : Text(
                          //                     '25/06/2022',
                          //                     style: TextStylesCustom
                          //                         .textStyles_14
                          //                         .apply(
                          //                       color: ColorStyle.red_ED0925,
                          //                     ),
                          //                   ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // const Icon(
                              //   Icons.location_on,
                              //   size: 20,
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Image(
                                  image: Svg(ImageStyle.examLocation),
                                  width: 13,
                                ),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: items[index]['location'] != null
                                    ? Text(
                                        '${items[index]['location']['name'] ?? ''}, '
                                        '${items[index]['location']['street_name'] ?? ''} '
                                        '${items[index]['location']['city'] ?? ''}, '
                                        '${items[index]['location']['zip_code'] ?? ''}',
                                        style: TextStylesCustom.textStyles_13
                                            .apply(
                                          color: ColorStyle.primaryColor_1570A5,
                                        ),
                                      )
                                    : Text(
                                        '',
                                        style: TextStylesCustom.textStyles_13
                                            .apply(
                                          color: ColorStyle.primaryColor_1570A5,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 1,
                            color: ColorStyle.grey_DAE1E7,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Available Seats'.tr,
                                style: TextStylesCustom.textStyles_14.apply(
                                  color: Colors.black,
                                ),
                              ),
                              (items[index]['total_seat'] != null &&
                                      items[index]['available_seats'] != null)
                                  ? ProgressBarCircularCustom(
                                      text: '250',
                                      progress:
                                          items[index]['available_seats'] + .0,
                                      total: items[index]['total_seat'] + .0,
                                    )
                                  : SizedBox(height: 0,),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
