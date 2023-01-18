import 'package:bbz/Controller/ExamDetailController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Components/AppBarStyle.dart';
import '../Controller/ExamScreenController.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';
import '../Utils/Global.dart';
import '../Styles/ImageStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Components/TextFieldCustom.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/DateFieldCustom.dart';
import 'BookingConfirmation.dart';
import '../Controller/BookingFormController.dart';
import '../Components/CustomError.dart';
import '../Components/PickerCustom.dart';
import '../Components/ContainerWithLabel.dart';
import 'package:path/path.dart';
import '../Utils/Constant.dart';
import 'package:flutter/gestures.dart';
import 'dart:io';

class BookingForm extends StatelessWidget {
  BookingForm({Key? key, required this.examDetails}) : super(key: key);
  final fromkey = GlobalKey<FormState>();
  Map examDetails = {};

  final controller = Get.put(BookingFormController());
  final examScreenController = Get.find<ExamScreenController>();

  // final examDetailController = Get.put(ExamDetailController());

  List examDetail = [
    {'item': 'Exam Level:', 'value': 'A2'},
    {'item': 'Exam date:', 'value': '03/31/2022 (SAT)'},
    {'item': 'Exam Time:', 'value': '09:30 AM'},
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        initState: (state) {
          controller.initMethods();
          examScreenController.isFilled.value = false;
        },
        builder: ((controller) => Obx(() => Scaffold(
              appBar: AppBarStyle(
                title: '${examDetails['title']}',
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorStyle.primaryColor_1570A5,
                    size: 30,
                  ),
                  onPressed: () {
                    controller.reset();
                    navigateToBack(context);
                  },
                ),
                styleTitle: TextStylesCustom.textStyles_16.apply(
                  color: ColorStyle.primaryColor_1570A5,
                  fontWeightDelta: 1,
                ),
                elevation: 2,
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: ColorStyle.grey_DAE1E7,
                    // spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ]),
                child: Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      // SizedBox(width: 10,),
                      Text(
                        'Total'.tr,
                        style: TextStylesCustom.textStyles_16
                            .apply(color: ColorStyle.grey_5E6D77),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Text(
                        '${examDetails['sale_price'] ?? examDetails['price']} €',
                        style: TextStylesCustom.textStyles_22.apply(
                            color: ColorStyle.primaryColor_1570A5,
                            fontWeightDelta: 1),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Expanded(
                          child: ElevatedButtonCustoms(
                        onTap: () {
                          if (controller.image.value.path.isEmpty) {
                            "ID Proof Image is required".tr.showError();
                          }
                          // else if(
                          //     controller.image.value.readAsBytesSync().lengthInBytes / 1024 > 500){
                          //   "ID Proof Image size(${(controller.image.value.readAsBytesSync().lengthInBytes / 1024).round()} kb) can't be larger than 500 kb".tr.showError();
                          // }
                          // debugPrint('file size : ${controller.image.value.readAsBytesSync().lengthInBytes / 1024}');

                          if (controller.country.value == '') {
                            controller.countryError.value = true;
                          } else {
                            controller.countryError.value = false;
                          }
                          //
                          if (controller.paymentMethod.value == '') {
                            controller.paymentError.value = true;
                          } else {
                            controller.paymentError.value = false;
                          }

                          if (!controller.termsAndCondition.value) {
                            controller.termsError.value = true;
                          } else {
                            controller.termsError.value = false;
                          }

                          if (!controller.privacyPolicy.value) {
                            controller.privacyError.value = true;
                          } else {
                            controller.privacyError.value = false;
                          }

                          if (!controller.secondTerm.value) {
                            controller.agreementError.value = true;
                          } else {
                            controller.agreementError.value = false;
                          }

                          if (fromkey.currentState!.validate() &&
                              !controller.countryError.value &&
                              !controller.agreementError.value &&
                              !controller.termsError.value &&
                              !controller.privacyError.value &&
                              !controller.paymentError.value) {
                            debugPrint('yay you logged in successfully');
                            controller.registerExam();
                          } else {
                            debugPrint('hello else');
                          }

                          // BookingConfirmation().navigateToCustom(context, withNavBar: false);
                        },
                        text: 'PAY NOW'.tr,
                        colorBG: controller.secondTerm.value &&
                                controller.termsAndCondition.value &&
                                controller.privacyPolicy.value
                            ? ColorStyle.primaryColor_1570A5
                            : ColorStyle.primaryColor_1570A5.withOpacity(0.5),
                      ))
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Get.locale.toString().contains('de')
                          ? Image.asset(
                              ImageStyle.bookingFormBarGerman,
                              width: 250,
                              height: 100,
                            )
                          : Image.asset(
                              ImageStyle.bookingFormBar,
                              width: 250,
                              height: 100,
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
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 28),
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
                                      '${examDetails['exam_level'] ?? 'A2-B1 level'}',
                                      style: TextStylesCustom.textStyles_21
                                          .apply(
                                              color: Colors.white,
                                              fontWeightDelta: 1),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                      ),

                                      const SizedBox(
                                        width: 5,
                                      ),

                                      Expanded(
                                        child: examDetails['location'] != null
                                            ? Text(
                                                '${examDetails['location']['name'] ?? ''} '
                                                '${examDetails['location']['street_name'] ?? ''} '
                                                '${examDetails['location']['city'] ?? ''} '
                                                '${examDetails['location']['zip_code'] ?? ''}',
                                                style: TextStylesCustom
                                                    .textStyles_14
                                                    .apply(color: Colors.white),
                                              )
                                            : Text(
                                                'Brüder Grimm Bildungscentrum e. V. Langstr. 60 63452 Hanau',
                                                style: TextStylesCustom
                                                    .textStyles_14
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
                              height: 245,
                              color: ColorStyle.white_F3F3F3,
                            ),
                          ],
                        ),
                        Positioned(
                          top: 120,
                          left: 16,
                          right: 16,
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
                                padding: const EdgeInsets.all(15),
                                child: ItemsList(
                                  items: [
                                    {
                                      'item': 'Exam Level'.tr + ':',
                                      'value':
                                          '${examDetails['exam_level'] ?? 'A2-B1'}'
                                    },
                                    {
                                      'item': 'Exam Date'.tr + ':',
                                      'value': examDetails['exam_date'] != null
                                          ? '${DateFormat('dd/MM/yyyy (EE)').format(DateTime.parse('${examDetails['exam_date']}'))}'
                                          : '25/03/2022 (SAT)'
                                    },
                                    {
                                      'item': 'Exam Time'.tr + ':',
                                      'value': examDetails['exam_time'] != null
                                          ? '${DateFormat.jm().format(DateTime.parse('${examDetails['exam_date']}T${examDetails['exam_time']}'))}'
                                          : '09:30 AM'
                                    },
                                  ],
                                  secondColor: Colors.black,
                                ),
                              ),
                              Container(
                                width: Get.mediaQuery.size.width,
                                height: 1,
                                color: ColorStyle.grey_DAE1E7,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Examination Fees'.tr,
                                        style: TextStylesCustom.textStyles_14),
                                    Expanded(
                                      child: SizedBox(
                                        width: Get.mediaQuery.size.width * 0.5,
                                        child: Text(
                                            '${examDetails['price'] ?? '7,50'}  €',
                                            textAlign: TextAlign.end,
                                            style: TextStylesCustom
                                                .textStyles_14
                                                .apply(color: Colors.black)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: Get.mediaQuery.size.width,
                                height: 1,
                                color: ColorStyle.grey_DAE1E7,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Total'.tr + ':',
                                        style: TextStylesCustom.textStyles_18
                                            .apply(
                                                color: ColorStyle
                                                    .primaryColor_1570A5,
                                                fontWeightDelta: 1)),
                                    Expanded(
                                      child: SizedBox(
                                        width: Get.mediaQuery.size.width * 0.5,
                                        child: Text(
                                            '${examDetails['price'] ?? '7,50'} €',
                                            textAlign: TextAlign.end,
                                            style: TextStylesCustom
                                                .textStyles_18
                                                .apply(
                                                    color: Colors.black,
                                                    fontWeightDelta: 1)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                    // --------------------------------------------Booking Submission ------------------------------>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Booking Submission'.tr,
                            style: TextStylesCustom.textStyles_16.apply(
                                color: ColorStyle.primaryColor_1570A5,
                                fontWeightDelta: 1),
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: ColorStyle.grey_DAE1E7,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Form(
                              key: fromkey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Contact Information'.tr,
                                    style: TextStylesCustom.textStyles_15
                                        .apply(fontWeightDelta: 2),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),

                                  DropdownWithLabel(
                                    firstText: 'Salutation'.tr,
                                    list: ['Mr'.tr, 'Mrs'.tr, 'Ms'.tr],
                                    width: Get.mediaQuery.size.width,
                                    controllerValue: controller.salutation,
                                    isFilled: examScreenController.isFilled.value,
                                    hintText: 'Please select'.tr,
                                    colorBoder: ColorStyle.grey_DAE1E7,
                                    padding:
                                        EdgeInsets.only(right: 15, bottom: 10),
                                    textStyle: TextStylesCustom.textStyles_14,
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Salutation is required'.tr;
                                      } else {
                                        controller.salutation.value = value;
                                        FocusScope.of(context).unfocus();
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  TextFormFieldWithLabel(
                                    controller: controller.academic_title.value,
                                    firstText: 'Academic Title'.tr,
                                    secondText: '',
                                    readOnly: examScreenController.isFilled.value,
                                    hintText: 'Please enter'.tr,
                                    validator: (value) {
                                      if (value!.isNotEmpty &&
                                          value![0] == ' ') {
                                        return "Academic title can't start with space"
                                            .tr;
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormFieldWithLabel(
                                          controller:
                                              controller.first_name.value,
                                              readOnly: examScreenController.isFilled.value,
                                          firstText: 'First Name'.tr,
                                          hintText: 'Please enter'.tr,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "First name is required"
                                                  .tr;
                                            } else if (!alphaSpace
                                                .hasMatch(value)) {
                                              return "First name should have letters"
                                                  .tr;
                                            } else if (value![0] == ' ') {
                                              // controller.userMessage.value.text = '';
                                              return "Can't start with space"
                                                  .tr;
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: TextFormFieldWithLabel(
                                          controller:
                                              controller.last_name.value,
                                              readOnly: examScreenController.isFilled.value,
                                          firstText: 'Last Name'.tr,
                                          hintText: 'Please enter'.tr,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Last name is required".tr;
                                            } else if (!alphaSpace
                                                .hasMatch(value)) {
                                              return "Last name should have letters"
                                                  .tr;
                                            } else if (value![0] == ' ') {
                                              // controller.userMessage.value.text = '';
                                              return "Can't start with space"
                                                  .tr;
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormFieldWithLabel(
                                    controller:
                                        controller.identification_number.value,
                                        readOnly: examScreenController.isFilled.value,
                                    firstText: 'Identification Number'.tr,
                                    hintText: 'Please enter'.tr,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          value.trim().isEmpty) {
                                        return "Identification number is required"
                                            .tr;
                                      } else if (!alphaNumericSpace
                                          .hasMatch(value)) {
                                        return "Identification number contains only numbers and letters."
                                            .tr;
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormFieldWithLabel(
                                    controller: controller.email.value,
                                    enabled: kTOKENSAVED == '',
                                    readOnly: examScreenController.isFilled.value,
                                    firstText: 'Email'.tr,
                                    hintText: 'Please enter'.tr,
                                    formatInput: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Email is required".tr;
                                      } else if (value![0] == ' ') {
                                        return "Email can't start with space"
                                            .tr;
                                      } else if (!GetUtils.isEmail(value)) {
                                        return "Email is invalid".tr;
                                      }
                                      // else if (!emailRegexWithoutSpecial.hasMatch(value)) {
                                      //   return "Email can't have special characters";
                                      // }
                                      else {
                                        return null;
                                      }
                                    },
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  // DateFieldCustom(
                                  //   firstText: 'Birth Date',
                                  //   hintText: 'dd-mm-yy',
                                  //   controller: controller.birth_date.value,
                                  // ),

                                  Stack(
                                    children: [
                                      TextFormFieldWithLabel(
                                        controller: controller.birth_date.value,
                                        enabled: true,
                                        showCursor: false,
                                        showDateIcon: true,
                                        readOnly: true,
                                        firstText: 'Birth Date'.tr,
                                        hintText: 'YYYY-MM-DD'.tr,
                                        onTap: examScreenController.isFilled.value ? null : () async {
                                          final dateSelected =
                                              await PickerCustom.datePicker(
                                            dateFormat: 'yyyy-MM-dd',
                                            selectedDate: controller.birth_date
                                                        .value.text ==
                                                    ''
                                                ? DateTime.parse('2006-12-31')
                                                : DateTime.parse(controller
                                                    .birth_date.value.text),
                                            firstDate: DateTime(1900),
                                            lastDate:
                                                DateTime.parse('2006-12-31'),
                                          );
                                          if (dateSelected != null) {
                                            controller.birth_date.value.text =
                                                dateSelected.toString();
                                          }
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Birth Date is required".tr;
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      // Positioned(
                                      //     right: 15,
                                      //     bottom: 15,
                                      //     child: Image.asset(ImageStyle.calendar, height: 20,))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormFieldWithLabel(
                                    controller: controller.birth_place.value,
                                    firstText: 'Birth Place'.tr,
                                    readOnly: examScreenController.isFilled.value,
                                    hintText: 'Please enter'.tr,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Birth place is required".tr;
                                      } else if (value![0] == ' ') {
                                        return "Birth place can't start with space"
                                            .tr;
                                      } else if (!alphaSpace.hasMatch(value)) {
                                        return "Birth place must contain only letters"
                                            .tr;
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormFieldWithLabel(
                                    controller:
                                        controller.country_of_birth.value,
                                        readOnly: examScreenController.isFilled.value,
                                    firstText: 'Country Of Birth'.tr,
                                    hintText: 'Please enter'.tr,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Country of birth is required"
                                            .tr;
                                      } else if (!alphaSpace.hasMatch(value)) {
                                        return "Country of birth must contain only letters"
                                            .tr;
                                      } else if (value![0] == ' ') {
                                        return "Country of birth place can't start with space"
                                            .tr;
                                      } else if (!alphaSpace.hasMatch(value)) {
                                        return "Country of birth place must only contain letters"
                                            .tr;
                                        return "Country of birth place must only contain letters";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  DropdownWithLabel(
                                    firstText: 'Mother Tongue'.tr,
                                    list: [
                                      if (controller
                                          .motherToungeData.isNotEmpty)
                                        ...controller.motherToungeData.map(
                                            (element) => element['language'])
                                    ],
                                    isFilled: examScreenController.isFilled.value,
                                    width: Get.mediaQuery.size.width,
                                    controllerValue: controller.motherToungue,
                                    colorBoder: ColorStyle.grey_DAE1E7,
                                    padding:
                                        EdgeInsets.only(right: 15, bottom: 10),
                                    hintText: 'Please select'.tr,
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Mother tongue is required'.tr;
                                      } else {
                                        controller.motherToungue.value = value;
                                        return null;
                                      }
                                    },
                                  ),
                                  if (controller.motherToungueError.value)
                                    CustomError(
                                      text: 'Mother toungue is required'.tr,
                                    ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormFieldWithLabel(
                                    readOnly: examScreenController.isFilled.value,
                                      controller: controller.telephone.value,
                                      firstText: 'Telephone'.tr,
                                      secondText: '',
                                      hintText: 'Please enter'.tr,
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        // if (value!.isEmpty) {
                                        //   return "Mobile number is required";
                                        // }else
                                        if (!value!.isEmpty) {
                                          if (!value!.isNum) {
                                            return "Telephone must contain number only"
                                                .tr;
                                          } else if (value.length < 9) {
                                            return "Min digit should be 9".tr;
                                          } else if (value.length > 14) {
                                            return "Max digit should be 14".tr;
                                          } else {
                                            return null;
                                          }
                                        } else {
                                          return null;
                                        }
                                      }),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormFieldWithLabel(
                                      controller: controller.mobile.value,
                                      firstText: 'Mobile'.tr,
                                      readOnly: examScreenController.isFilled.value,
                                      secondText: '*',
                                      hintText: 'Please enter'.tr,
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Mobile number is required".tr;
                                        } else if (!value.isNum) {
                                          return "Mobile must contain number only"
                                              .tr;
                                        } else if (value.length < 9) {
                                          return "Min digit should be 9".tr;
                                        } else if (value.length > 14) {
                                          return "Max digit should be 14".tr;
                                        } else {
                                          return null;
                                        }
                                      }),

                                  SizedBox(
                                    height: 35,
                                  ),
                                  InkWell(
                                    onTap: examScreenController.isFilled.value ? null : () {
                                      final xx =
                                          PickerCustom.imagePicker((file) {
                                        controller.image.value = file;
                                        if ((controller.image.value
                                                        .readAsBytesSync()
                                                        .lengthInBytes /
                                                    1024)
                                                .round() >
                                            500) {
                                          '${"ID Proof Image size(".tr + "${(controller.image.value.readAsBytesSync().lengthInBytes / 1024).round()}" + " kb) can't be larger than 500 kb".tr}'
                                              .showError();
                                          controller.image.value = File('');
                                        } else {
                                          controller.uploadImage();
                                        }
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: ColorStyle.primaryColor_1570A5,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Expanded(
                                          child: Text.rich(TextSpan(
                                              text: '',
                                              children: <InlineSpan>[
                                                TextSpan(
                                                  text: 'Upload ID Proof'.tr,
                                                  style: TextStylesCustom
                                                      .textStyles_15
                                                      .apply(
                                                          color: ColorStyle
                                                              .primaryColor_1570A5,
                                                          fontWeightDelta: 2),
                                                ),
                                                TextSpan(
                                                    text: ' *',
                                                    style: TextStylesCustom
                                                        .textStyles_16
                                                        .apply(
                                                            color: Colors.red)),
                                                TextSpan(
                                                  text:
                                                      '(size up to 500 kb)'.tr,
                                                  style: TextStylesCustom
                                                      .textStyles_12
                                                      .apply(
                                                          color: ColorStyle
                                                              .grey_5E6D77),
                                                )
                                              ])),
                                        )
                                      ],
                                    ),
                                  ),
                                  // InkWell(
                                  //   onTap: () {
                                  //     final xx = PickerCustom.imagePicker((file) {
                                  //       controller.image.value = file;
                                  //       //controller.uploadImage();
                                  //     });
                                  //   },
                                  //   child:
                                  //   Row(
                                  //     children: [
                                  //       Icon(
                                  //         Icons.add,
                                  //         color: ColorStyle.primaryColor_1570A5,
                                  //         size: 30,
                                  //       ),
                                  //       SizedBox(
                                  //         width: 7,
                                  //       ),
                                  //       Expanded(
                                  //         child: Text(
                                  //           'Upload ID Proof'.tr,
                                  //           style: TextStylesCustom.textStyles_15
                                  //               .apply(
                                  //                   color: ColorStyle
                                  //                       .primaryColor_1570A5,
                                  //                   fontWeightDelta: 2),
                                  //         ),
                                  //       ),
                                  //       Text(
                                  //         ' *',
                                  //         style: TextStylesCustom.textStyles_16
                                  //             .apply(color: Colors.red),
                                  //       ),
                                  //       SizedBox(
                                  //         width: 7,
                                  //       ),
                                  //       Expanded(
                                  //         child: Text(
                                  //           '(size up to 500 kb)'.tr,
                                  //           style: TextStylesCustom.textStyles_12
                                  //           .apply(
                                  //               color:
                                  //                   ColorStyle.grey_5E6D77),
                                  //         ),
                                  //       ),
                                  //
                                  //     ],
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                      width: Get.size.width,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                            color: ColorStyle.grey_DAE1E7),
                                      ),
                                      child: Text(
                                        basename(controller.image.value.path),
                                        style: TextStylesCustom.textStyles_14
                                            .apply(
                                                color: ColorStyle.grey_5E6D77),
                                      )),
                                  SizedBox(
                                    height: 33,
                                  ),
                                  Text(
                                    'Address'.tr,
                                    style: TextStylesCustom.textStyles_16
                                        .apply(fontWeightDelta: 2),
                                  ),
                                  SizedBox(
                                    height: 33,
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormFieldWithLabel(
                                      controller: controller.co.value,
                                      readOnly: examScreenController.isFilled.value,
                                      firstText: 'C/o'.tr,
                                      secondText: '',
                                      hintText: 'Please enter'.tr,
                                      validator: (value) {
                                        if (value!.isNotEmpty &&
                                            value![0] == ' ') {
                                          return "C/o can't start with space"
                                              .tr;
                                        } else {
                                          return null;
                                        }
                                      }),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormFieldWithLabel(
                                      controller: controller.street.value,
                                      readOnly: examScreenController.isFilled.value,
                                      firstText: 'Street'.tr,
                                      hintText: 'Please enter'.tr,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Street is required'.tr;
                                        } else if (value!.isNotEmpty &&
                                            value![0] == ' ') {
                                          return "Street can't start with space"
                                              .tr;
                                        } else {
                                          return null;
                                        }
                                      }),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormFieldWithLabel(
                                    controller: controller.city.value,
                                    readOnly: examScreenController.isFilled.value,
                                    firstText: 'City'.tr,
                                    hintText: 'Please enter'.tr,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "City is required".tr;
                                      } else if (!alphaSpace.hasMatch(value)) {
                                        return "City name must only contain letters"
                                            .tr;
                                      } else if (value!.isNotEmpty &&
                                          value![0] == ' ') {
                                        return "City can't start with space".tr;
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormFieldWithLabel(
                                    controller: controller.postal_code.value,
                                    readOnly: examScreenController.isFilled.value,
                                    firstText: 'Postal Code'.tr,
                                    hintText: 'Please enter'.tr,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Postal code is required".tr;
                                      } else if (!alphaNumeric
                                          .hasMatch(value)) {
                                        return "Postal code must contain number and character only"
                                            .tr;
                                      } else if (value.length < 4) {
                                        return "Postal code can't have less than 4 digits"
                                            .tr;
                                      } else if (value.length > 10) {
                                        return "Postal code can't have more than 10 digits"
                                            .tr;
                                      } else if ((value.replaceAll('0', ''))
                                          .isEmpty) {
                                        return "All digits can't be zeros".tr;
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  // DropdownWithLabel(
                                  //   firstText:'Country',
                                  //   list: ['Germany', 'india'],
                                  //   width: Get.mediaQuery.size.width,
                                  //   controllerValue: controller.country,
                                  //   validator: (value){
                                  //     if(value == null){
                                  //       return 'Salutation is required';
                                  //     }else {
                                  //       return null;
                                  //     }
                                  //   },
                                  // ),

                                  InkWell(
                                    onTap: examScreenController.isFilled.value ? null : () {
                                      PickerCustom.countryPicker((value) {
                                        controller.country.value = value;
                                      }, (value) {
                                        controller.countryCode.value = value;
                                      });
                                    },
                                    child: controller.country.value == ''
                                        ? ContainerWithLabel(
                                            firstText: 'Country'.tr,
                                            hintText: 'Please select'.tr,
                                            isError:
                                                controller.countryError.value,
                                            colorhintText:
                                                ColorStyle.grey_DAE1E7,
                                            // selectedValue: controller.country.value.text,
                                          )
                                        : ContainerWithLabel(
                                            firstText: 'Country'.tr,
                                            hintText: controller.country.value,
                                            isError:
                                                controller.countryError.value,
                                            colorhintText:
                                                ColorStyle.grey_5E6D77,

                                            // selectedValue: controller.country.value.text,
                                          ),
                                  ),

                                  if (controller.countryError.value)
                                    CustomError(
                                      text: 'Country is required'.tr,
                                    ),

                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    'Select Payment Method'.tr,
                                    style: TextStylesCustom.textStyles_16
                                        .apply(fontWeightDelta: 2),
                                  ),
                                  if (controller.paymentError.value)
                                    CustomError(
                                      text: 'Select payment method is required'
                                          .tr,
                                    ),
                                  SizedBox(
                                    height: 23,
                                  ),

                                  Container(
                                    // height: 89,
                                    width: Get.mediaQuery.size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorStyle.grey_DAE1E7),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.paymentMethod.value =
                                                'PayPal';
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 21.0, vertical: 14),
                                            child: Row(
                                              children: [
                                                controller.paymentMethod
                                                            .value ==
                                                        'PayPal'
                                                    ? Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        color: ColorStyle
                                                            .grey_5E6D77,
                                                      )
                                                    : Icon(
                                                        Icons.circle_outlined,
                                                        color: ColorStyle
                                                            .grey_DAE1E7,
                                                      ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  'PayPal',
                                                  style: TextStylesCustom
                                                      .textStyles_16
                                                      .apply(
                                                          fontWeightDelta: 2),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: 1,
                                            width: Get.mediaQuery.size.width,
                                            color: ColorStyle.grey_DAE1E7),
                                        InkWell(
                                          onTap: () {
                                            controller.paymentMethod.value =
                                                'stripe';
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 21.0, vertical: 14),
                                            child: Row(
                                              children: [
                                                controller.paymentMethod
                                                            .value ==
                                                        'stripe'
                                                    ? Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        color: ColorStyle
                                                            .grey_5E6D77,
                                                      )
                                                    : Icon(
                                                        Icons.circle_outlined,
                                                        color: ColorStyle
                                                            .grey_DAE1E7,
                                                      ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  'Stripe',
                                                  style: TextStylesCustom
                                                      .textStyles_16
                                                      .apply(
                                                          fontWeightDelta: 2),
                                                )),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 39,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.termsAndCondition.value =
                                          !controller.termsAndCondition.value;
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.0),
                                          child: controller
                                                  .termsAndCondition.value
                                              ? Icon(
                                                  Icons.check_box,
                                                  color: ColorStyle.grey_5E6D77,
                                                )
                                              : Icon(
                                                  Icons.check_box_outline_blank,
                                                  color: ColorStyle.grey_A8B0B5,
                                                ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: RichText(
                                            text: TextSpan(
                                              // text: 'I have read the ',
                                              // style: TextStylesCustom.textStyles_12,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        'I have read and accept the '
                                                            .tr,
                                                    style: TextStylesCustom
                                                        .textStyles_15
                                                        .apply(
                                                            color:
                                                                Colors.black)),
                                                TextSpan(
                                                    text:
                                                        'General Terms and Conditions'
                                                            .tr,
                                                    style: TextStylesCustom
                                                        .textStyles_15
                                                        .apply(
                                                            color: ColorStyle
                                                                .primaryColor_1570A5),
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap =
                                                              () async => {
                                                                    if (Get
                                                                        .locale
                                                                        .toString()
                                                                        .contains(
                                                                            'de'))
                                                                      {
                                                                        await launchUrl(
                                                                            Uri.parse('https://www.sprachtestcenter.de/de/page/terms-and-conditions'))
                                                                      }
                                                                    else
                                                                      {
                                                                        await launchUrl(
                                                                            Uri.parse('https://www.sprachtestcenter.de/page/terms-and-conditions'))
                                                                      }
                                                                  }),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  if (controller.termsError.value)
                                    CustomError(
                                      text:
                                          'Terms and conditions is required'.tr,
                                    ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  InkWell(
                                    onTap: () {
                                      controller.privacyPolicy.value =
                                          !controller.privacyPolicy.value;
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.0),
                                          child: controller.privacyPolicy.value
                                              ? Icon(
                                                  Icons.check_box,
                                                  color: ColorStyle.grey_5E6D77,
                                                )
                                              : Icon(
                                                  Icons.check_box_outline_blank,
                                                  color: ColorStyle.grey_A8B0B5,
                                                ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: RichText(
                                            text: TextSpan(
                                              // text: 'I have read the ',
                                              // style: TextStylesCustom.textStyles_12,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        'I have read and accept the '
                                                            .tr,
                                                    style: TextStylesCustom
                                                        .textStyles_15
                                                        .apply(
                                                            color:
                                                                Colors.black)),
                                                TextSpan(
                                                    text: 'Privacy Policy'.tr,
                                                    style: TextStylesCustom
                                                        .textStyles_15
                                                        .apply(
                                                            color: ColorStyle
                                                                .primaryColor_1570A5),
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap =
                                                              () async => {
                                                                    if (Get
                                                                        .locale
                                                                        .toString()
                                                                        .contains(
                                                                            'de'))
                                                                      {
                                                                        await launchUrl(
                                                                            Uri.parse('https://www.sprachtestcenter.de/de/page/privacy-policy'))
                                                                      }
                                                                    else
                                                                      {
                                                                        await launchUrl(
                                                                            Uri.parse('https://www.sprachtestcenter.de/page/privacy-policy'))
                                                                      }
                                                                  }),
                                                TextSpan(
                                                    text:
                                                        ' and agree to the storage of the above data.'
                                                            .tr,
                                                    style: TextStylesCustom
                                                        .textStyles_15
                                                        .apply(
                                                            color:
                                                                Colors.black)),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  if (controller.privacyError.value)
                                    CustomError(
                                      text: 'Privacy policy is required'.tr,
                                    ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  InkWell(
                                    onTap: () {
                                      controller.secondTerm.value =
                                          !controller.secondTerm.value;
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.0),
                                          child: controller.secondTerm.value
                                              ? Icon(
                                                  Icons.check_box,
                                                  color: ColorStyle.grey_5E6D77,
                                                )
                                              : Icon(
                                                  Icons.check_box_outline_blank,
                                                  color: ColorStyle.grey_A8B0B5,
                                                ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Text(
                                              'I agree that the service can be performed before the end of the right of withdrawal and I am aware that the right of withdrawal ends with the specified withdrawal period.'
                                                  .tr,
                                              style: TextStylesCustom
                                                  .textStyles_15
                                                  .apply(color: Colors.black)),
                                        )
                                      ],
                                    ),
                                  ),
                                  if (controller.agreementError.value)
                                    CustomError(
                                      text: 'Agreement checkbox is required'.tr,
                                    ),

                                  SizedBox(
                                    height: 72,
                                  ),
                                ],
                              ),
                            )),
                      ],
                    )
                  ],
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
                  child: SizedBox(
                    width: Get.mediaQuery.size.width * 0.5,
                    child: Text(items[index]['value'],
                        textAlign: TextAlign.end,
                        style: TextStylesCustom.textStyles_14.apply(
                            color: secondColor == null
                                ? ColorStyle.grey_A8B0B5
                                : secondColor)),
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
