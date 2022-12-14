import 'package:intl/intl.dart';

import '../Components/BGImage.dart';
import '../Styles/ColorStyle.dart';
import 'package:flutter/material.dart';
import './ChangePassword.dart';
import '../Components/AppBarStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import '../Styles/TextStyles.dart';
import '../Components/TextFieldCustom.dart';
import '../Styles/EffectStyle.dart';
import '../Utils/Global.dart';
import '../Styles/ImageStyle.dart';
import '../Controller/MyProfileController.dart';
import '../Components/PickerCustom.dart';
import '../Components/DropdownButtonCustom.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'dart:io';
import '../Components/ContainerWithLabel.dart';
import '../Components/CustomError.dart';
import '../Utils/Constant.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  final fromkey = GlobalKey<FormState>();
  final controller = Get.put(MyProfileController());
  String em = "";
  @override
  Widget build(BuildContext context) {
    // final controller = LoginController();
    return GetBuilder(
        initState: (state) {
          controller.initMethods();
        },
        init: controller,
        builder: ((controller) => Obx(() => Scaffold(
              appBar: AppBarStyle(
                title: 'My Profile',
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorStyle.primaryColor_1570A5,
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
              //--------------------------------save changes bottom button---------------------->
              bottomNavigationBar: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButtonCustoms(
                  onTap: () {
                    if(controller.country.value == ''){
                      controller.countryError.value = true;
                    }else{
                      controller.countryError.value = false;
                    }
                    if (fromkey.currentState!.validate() && !controller.countryError.value) {

                      controller.editProfile();
                      debugPrint('yay you logged in successfully');
                    }
                  },
                  styleText: TextStylesCustom.textStyles_16,
                  text: 'SAVE CHANGES',
                  colorBG: ColorStyle.primaryColor_1570A5,
                ),
              ),
              body: Stack(
                children: [
                  Container(
                    width: Get.mediaQuery.size.width,
                    height: Get.mediaQuery.size.height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/Images/MyProfile_background.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Form(
                        key: fromkey,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 30),
                              decoration: boxDecorationAuthBox(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 5),
                                    // height: 115,
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(5),
                                    //     // border: Border.all(color: ColorStyle.grey_DAE1E7)
                                    // ),
                                    child: Row(
                                      children: [
                                        if (controller.image.value.path.isEmpty)
                                          CircleAvatar(
                                            backgroundColor:
                                                ColorStyle.primaryColor_1570A5,
                                            radius: 50,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                                child: CircleAvatar(
                                                  radius: 50,
                                                  child: Image.network(
                                                    controller.imageURL.value,
                                                    height: 100,
                                                    width: 100,
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (context,
                                                        exception, stackTrace) {
                                                      return const SizedBox(
                                                        height: 50,
                                                        width: 50,
                                                        child: Icon(
                                                          Icons.person,
                                                          size: 50,
                                                          color: Colors.white,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )),
                                          )
                                        else
                                          CircleAvatar(
                                            backgroundColor:
                                                ColorStyle.primaryColor_1570A5,
                                            radius: 50,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.file(
                                                  File(controller
                                                      .image.value.path),
                                                  fit: BoxFit.fill,
                                                  height: 100,
                                                  width: 100,
                                                )),
                                          ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                            child: ElevatedButtonCustoms(
                                          onTap: () {
                                            PickerCustom.imagePicker((file) {
                                              controller.image.value = file;

                                              controller.editProfileImage();
                                            });
                                          },
                                          text: 'EDIT PICTURE',
                                          styleText: TextStylesCustom
                                              .textStyles_16
                                              .apply(
                                                  color: ColorStyle
                                                      .primaryColor_1570A5,
                                                  fontWeightDelta: 1),
                                          colorBG: Colors.white,
                                          colorBorder:
                                              ColorStyle.primaryColor_1570A5,
                                        )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: TextFormFieldWithLabel(
                                        controller: controller.firstName.value,
                                        firstText: 'First Name',
                                        hintText: 'John',
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "First name is required";
                                          } else if (!alphaSpace.hasMatch(value)) {
                                            return " FN should have letters";
                                          }
                                          else if(value![0] == ' '){
                                            // controller.userMessage.value.text = '';
                                            return "Can't start with space";
                                          }
                                          else {
                                            return null;
                                          }
                                        },
                                      )),
                                      SizedBox(
                                        width: 21,
                                      ),
                                      Expanded(
                                          child: TextFormFieldWithLabel(
                                        controller: controller.lastName.value,
                                        firstText: 'Last Name',
                                        hintText: 'Doe',
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Last name is required";
                                          } else if (!alphaSpace.hasMatch(value)) {
                                            return " LN should have letters";
                                          }
                                          else if(value![0] == ' '){
                                            // controller.userMessage.value.text = '';
                                            return "Can't start with space";
                                          }
                                          else {
                                            return null;
                                          }
                                        },
                                      )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  // -----------------------Email Field---------------------------->
                                  TextFormFieldWithLabel(
                                    controller: controller.email.value,
                                    firstText: 'Email',
                                    hintText: 'Johndoe@gmail.com',
                                    enabled: false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Email is required";
                                      } else if (!GetUtils.isEmail(value)) {
                                        return "Email is invalid";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  // -----------------------Telephone Field---------------------------->
                                  TextFormFieldWithLabel(
                                    controller: controller.telephone.value,
                                    keyboardType: TextInputType.number,
                                    firstText: 'Telephone',
                                    hintText: 'Please enter',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Telephone is required";
                                      }else if(!value.isNumericOnly){
                                        return "Telephone must contain only number";
                                      }
                                      else if (value.length < 7) {
                                        return "Min digit should be 7";
                                      }else if (value.length > 15) {
                                        return "Max digit should be 15";
                                      }
                                      else {
                                        return null;
                                      }
                                    }
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  // -----------------------Birth Date Field---------------------------->
                                  TextFormFieldWithLabel(
                                    controller: controller.birthDate.value,
                                    enabled: true,
                                    showCursor: false,
                                    readOnly: true,
                                    firstText: 'Birth Date',
                                    hintText: 'YYYY-MM-DD',
                                    onTap: () async {
                                      final dateSelected = await PickerCustom.datePicker(
                                        dateFormat: 'yyyy-MM-dd',
                                        selectedDate: DateTime.parse('2006-12-31'),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.parse('2006-12-31'),
                                      );

                                      if (dateSelected != null) {
                                        controller.birthDate.value.text = dateSelected.toString();
                                        em ="";
                                      }else {
                                        print("Date is not selected");
                                        em ="Birth Date is required";
                                      }
                                    },
                                    validator: (value) {
                                      debugPrint(value);
                                      if (value!.isEmpty || value == "") {
                                        return "Birth Date is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),

                                  // if(controller.birthDate.value.text == '')
                                  //   Text(em,style: TextStyle(color: Colors.red),),

                                  // TextFormField(
                                  //   controller: controller.birthDate.value,
                                  //     showCursor: true,
                                  //     readOnly: true,
                                  //   decoration: const InputDecoration(
                                  //
                                  //       radiusBorder: 4,
                                  //       colorBoder: ColorStyle.grey_DAE1E7,
                                  //       padding: const EdgeInsets.only(left: 14),
                                  //       colorHint: ColorStyle.grey_DAE1E7,
                                  //       textStyle: TextStylesCustom.textStyles_14
                                  //           .apply(color: ColorStyle.grey_5E6D77),
                                  //       hintText: 'dd-mm-yy',
                                  //       labelText: "Birth Date"),
                                  //   onTap: () async {
                                  //     DateTime? pickedDate = await showDatePicker(
                                  //         context: context,
                                  //         firstDate: DateTime(1900),
                                  //         lastDate: DateTime.parse('2006-12-31'),
                                  //         initialDate:DateTime.parse('2006-12-31'),
                                  //     );
                                  //     if (pickedDate != null) {
                                  //       String formattedDate =
                                  //       DateFormat('yyyy-MM-dd').format(pickedDate);
                                  //       controller.birthDate.value.text = formattedDate;
                                  //     } else {}
                                  //   },
                                  //   validator: (value) {
                                  //     return controller.requiredFieldValidator(value);
                                  //   },
                                  // ),

                                  const SizedBox(
                                    height: 40,
                                  ),

                                  Text(
                                    'Address',
                                    style: TextStylesCustom.textStyles_16
                                        .apply(fontWeightDelta: 1),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  // -----------------------C/o field---------------------------->
                                  TextFormFieldWithLabel(
                                    controller: controller.co.value,
                                    firstText: 'C/o',
                                    secondText: '',
                                    hintText: 'Please enter',
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  // -----------------------Street field---------------------------->
                                  TextFormFieldWithLabel(
                                    controller: controller.street.value,
                                    firstText: 'Street',
                                    hintText: 'Please enter',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Street is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  // -----------------------City field---------------------------->
                                  TextFormFieldWithLabel(
                                    controller: controller.city.value,
                                    firstText: 'City',
                                    hintText: 'Please enter',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "City is required";
                                      } else if (!GetUtils.isAlphabetOnly(
                                          value)) {
                                        return " City name must only contain letters";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  // -----------------------Postal field---------------------------->
                                  TextFormFieldWithLabel(
                                    controller: controller.postalCode.value,
                                    keyboardType: TextInputType.number,
                                    firstText: 'Postal Code',
                                    hintText: 'Please enter',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Postal code is required";
                                      } else if (!value!.isNumericOnly) {
                                        return 'Postal code must contain only numbers';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  // -----------------------Country field---------------------------->
                                  InkWell(
                                    onTap: () {
                                      PickerCustom.countryPicker((value) {
                                        controller.country.value = value;
                                      });
                                    },
                                    child: controller.country.value == ''?

                                    ContainerWithLabel(
                                      firstText: 'Country',
                                      hintText: 'Please Select',
                                      isError: controller.countryError.value,
                                      colorhintText: ColorStyle.grey_DAE1E7,
                                      colorBorder: ColorStyle.white,
                                      // selectedValue: controller.country.value.text,
                                    ):
                                    ContainerWithLabel(
                                      firstText: 'Country',
                                      hintText: controller.country.value,
                                      isError: controller.countryError.value,
                                      colorhintText: ColorStyle.grey_5E6D77,
                                      colorBorder: ColorStyle.white,

                                      // selectedValue: controller.country.value.text,
                                    )
                                    ,
                                  ),

                                  if (controller.countryError.value)
                                    CustomError(
                                      text: 'Country is required',
                                    ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  //------------------------Change password button----------------------->
                                  ElevatedButtonCustoms(
                                    onTap: () {
                                      ChangePassword()
                                          .navigateToCustom(context);

                                      // Navigator.push(context, MaterialPageRoute(
                                      //     builder: (context) => const ChangePassword()
                                      // ));
                                      // Get.to(()=>const ChangePassword());
                                    },
                                    text: 'CHANGE PASSWORD',
                                    colorText: ColorStyle.primaryColor_1570A5,
                                    colorBG: Colors.white,
                                    width: Get.mediaQuery.size.width,
                                    colorBorder: ColorStyle.primaryColor_1570A5,
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ))));
  }
}
