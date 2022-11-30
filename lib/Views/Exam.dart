

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


class Exam extends StatefulWidget {
  const Exam({Key? key}) : super(key: key);
  @override
  State<Exam> createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  final welcomeController = Get.put(WelcomeController());
  final examDetailController = Get.put(ExamDetailController());
  final controller = Get.put(ExamController());
  @override
  initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      welcomeController.isBackVisible.value = true;

    });
  }

  textIcon(ImageProvider IconImage, String text, bool isBorder) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 10,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
            border: isBorder ? Border(
                bottom: BorderSide(
                  width: 1,
                  color: ColorStyle.grey_DAE1E7,
                )
            ) : Border()
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(image: IconImage, width: 15,),
                    ],
                  ),
                ),

                // Icon(
                //   icon,
                //   color: ColorStyle.primaryColor_1570A5,
                //   size: 26,
                // ),
                const SizedBox(width: 6),
                Expanded(child: Text(
                  text,
                  style: TextStylesCustom.textStyles_14.apply(
                    color: ColorStyle.grey_A8B0B5,
                    // fontWeightDelta: 1,
                  ),
                ),),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: ColorStyle.primaryColor_1570A5,
                  size: 34,
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        PickerCustom.datePicker('dd MMM yyyy');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        initState: (state){
          controller.initMethods();
        },
        builder: (controller){
      return Obx(() => Scaffold(
        key: keyDrawer,
        backgroundColor: ColorStyle.white_F3F3F3,
        drawer: DrawerScreen(),
        appBar: AppBarStyle(
          title: 'Exams',
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
                height: 475,
                child: Stack(
                  children: [
                    Image.asset(
                      ImageStyle.examBG,
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 16,
                          right: 16
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          Text(
                            'Book Your Exam Now!',
                            style: TextStylesCustom.textStyles_26.apply(
                              color: Colors.white,
                              // fontWeightDelta: 1,
                            ),
                          ),
                          Text(
                            'Use the search filters to find specific courses faster and easier',
                            style: TextStylesCustom.textStyles_14.apply(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 40,),
                        ],
                      ),
                    ),
                    Container(
                      height: 320,
                      width: Get.mediaQuery.size.width,
                      margin: const EdgeInsets.only(
                          top: 130,
                          left: 16,
                          right: 16
                      ),
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: ColorStyle.grey_DAE1E7,
                              // spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 0), // changes position of shadow
                            ),
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 16
                            ),
                            width: Get.mediaQuery.size.width,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      width: 2,
                                      color: ColorStyle.grey_DAE1E7,
                                    )
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location, Date or Level',
                                  style: TextStylesCustom.textStyles_16.apply(
                                    color: ColorStyle.grey_5E6D77,
                                    // fontWeightDelta: 1,
                                  ),
                                ),
                                const SizedBox(height: 6,),
                                Text(
                                  'Search everything here...',
                                  style: TextStylesCustom.textStyles_16.apply(
                                    color: ColorStyle.primaryColor_1570A5.withOpacity(0.5),
                                    fontWeightDelta: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DropdownButtonCustom(
                            width: MediaQuery.of(context).size.width - 32,
                            height: 50,
                            hintText: 'Select Your Center Location',
                            list: const ['One', 'Two', 'Three'],
                            padding: const EdgeInsets.only(
                                left: 16, right: 16
                            ),
                            colorIcon: ColorStyle.primaryColor_1570A5,
                            icon: Svg(ImageStyle.ticket_location, ),
                            textStyle: TextStylesCustom.textStyles_14,
                          ),
                          Container(
                            height: 1,
                            color: ColorStyle.grey_DAE1E7,
                          ),
                          textIcon(AssetImage(ImageStyle.calendar), 'Your Exam Date (from - to)', true),
                          DropdownButtonCustom(
                            width: MediaQuery.of(context).size.width - 32,
                            height: 50,
                            hintText: 'Select Your Language Level',
                            list: const ['One', 'Two', 'Three'],
                            padding: const EdgeInsets.only(
                                left: 16, right: 16
                            ),
                            colorIcon: ColorStyle.primaryColor_1570A5,
                            textStyle: TextStylesCustom.textStyles_14,
                            icon: Svg(ImageStyle.language),
                          ),
                          // textIcon(Icons.g_translate_rounded, 'Select Your Language Level', false),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: ElevatedButtonCustom(
                          text: 'SEARCH',
                          size: const Size(180, 46),
                          onTap: () {
                            // controller.userLogin();
                            // Get.to(const Login());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 20
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40,),
                    Text(
                      'Upcoming Exams',
                      style: TextStylesCustom.textStyles_18.apply(
                        color: ColorStyle.primaryColor_1570A5,
                        fontWeightDelta: 1,
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Text(
                      'All the coming exams for you',
                      style: TextStylesCustom.textStyles_14.apply(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 40,),
                    ListView.separated(
                      itemCount: controller.upcomingExamData.length,
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
                          onTap: (){
                            // examDetailController.fetchExamDetails(controller.upcomingExamData[index]['id']);
                            if(controller.upcomingExamData[index]['id'] != null)
                            ExamDetail(id: controller.upcomingExamData[index]['id']).navigateToCustom(context, withNavBar: false);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorStyle.grey_DAE1E7
                                )
                            ),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    (controller.upcomingExamData[index]['image'] != null && controller.upcomingExamData[index]['image']['file_path'] != null)?
                                        Image.network('${networkImage}${controller.upcomingExamData[index]['image']['file_path']}'):
                                    Image.asset(
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
                                            left: 30,
                                            right: 30,
                                            top: 40,
                                            bottom: 40
                                        ),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: Svg(
                                              'assets/Images/exam_redBlock.svg',
                                            ),
                                            fit: BoxFit.fill,

                                          ),
                                          // color: ColorStyle.red_ED0925
                                        ),
                                        child: controller.upcomingExamData[index]['term_name'] != null? Text(
                                          controller.upcomingExamData[index]['term_name'],
                                          style: TextStylesCustom.textStyles_16.apply(
                                            color: Colors.white,
                                            fontWeightDelta: 1,
                                          ),
                                        ): Text(
                                          'A2-B1',
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
                                            color: ColorStyle.primaryColor_1570A5
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: controller.upcomingExamData[index]['price'] != null? Text(
                                          '${controller.upcomingExamData[index]['price']} €',
                                          style: TextStylesCustom.textStyles_22.apply(
                                            color: Colors.white,
                                            fontWeightDelta: 1,
                                          ),
                                        ): Text(
                                          '7,50 €',
                                          style: TextStylesCustom.textStyles_22.apply(
                                            color: Colors.white,
                                            fontWeightDelta: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 16,
                                      right: 16
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      controller.upcomingExamData[index]['title'] != null? Text(
                                        '${controller.upcomingExamData[index]['title']}',
                                        style: TextStylesCustom.textStyles_14.apply(
                                          color: Colors.black,
                                        )
                                      ) : Text(
                                        'Zusatzleistung: Postversand - Zertifikate / Ergebnisbogen',
                                        style: TextStylesCustom.textStyles_14.apply(
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 12,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: FittedBox(
                                                    child: Text(
                                                      'Exam Date: ',
                                                      style: TextStylesCustom.textStyles_14.apply(
                                                          color: Colors.black,
                                                          fontWeightDelta: 2
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FittedBox(
                                                    child:controller.upcomingExamData[index]['exam_date'] != null ? Text(
                                                      '${DateFormat('dd/MM/yyyy').format(DateTime.parse('${controller.upcomingExamData[index]['exam_date']}'))}',
                                                      style: TextStylesCustom.textStyles_14.apply(
                                                        color: ColorStyle.primaryColor_1570A5,
                                                      ),
                                                    ) : Text(
                                                      '22/06/2022',
                                                      style: TextStylesCustom.textStyles_14.apply(
                                                        color: ColorStyle.primaryColor_1570A5,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text('Reg Until: ',style: TextStylesCustom.textStyles_14.apply(
                                                    color: Colors.black,
                                                    fontWeightDelta: 2
                                                ),
                                                ),
                                                FittedBox(
                                                  // fit: BoxFit.fitWidth,
                                                  child: controller.upcomingExamData[index]['reg_until_date'] != null ? Text(
                                                    '${DateFormat('dd/MM/yyyy').format(DateTime.parse('${controller.upcomingExamData[index]['reg_until_date']}'))}',
                                                    style: TextStylesCustom.textStyles_14.apply(
                                                      color: ColorStyle.red_ED0925,
                                                    ),
                                                  ) :Text(
                                                    '25/06/2022',

                                                    style: TextStylesCustom.textStyles_14.apply(
                                                      color: ColorStyle.red_ED0925,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // const Icon(
                                          //   Icons.location_on,
                                          //   size: 20,
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 4.0),
                                            child: Image(image:Svg(ImageStyle.examLocation), width: 13,),
                                          ),
                                          const SizedBox(width: 14,),
                                          Expanded(
                                            child: Text(
                                              '${controller.upcomingExamData[index]['location']['name'] ?? '' }, '
                                                  '${controller.upcomingExamData[index]['location']['street_name'] ?? '' } '
                                                  '${controller.upcomingExamData[index]['location']['city'] ?? '' }, '
                                                  '${controller.upcomingExamData[index]['location']['zip_code'] ?? '' }',
                                              style: TextStylesCustom.textStyles_13.apply(
                                                color: ColorStyle.primaryColor_1570A5,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30,),
                                      Container(
                                        height: 1,
                                        color: ColorStyle.grey_DAE1E7,
                                      ),
                                      const SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Available Seats',
                                            style: TextStylesCustom.textStyles_14.apply(
                                              color: Colors.black,
                                            ),
                                          ),
                                          (controller.upcomingExamData[index]['total_seat'] != null && controller.upcomingExamData[index]['available_seats'] != null) ?
                                          ProgressBarCircularCustom(
                                            text: '250',
                                            progress: controller.upcomingExamData[index]['available_seats'] + .0,
                                            total: controller.upcomingExamData[index]['total_seat'] + .0,
                                          ) :
                                          ProgressBarCircularCustom(
                                            text: '250',
                                            progress: 250,
                                            total: 400,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },)
                  ],
                ),
              ),
            ],
          ),
        ),
      ));

    }) ;


  }
}
