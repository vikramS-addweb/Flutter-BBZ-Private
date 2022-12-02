import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
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

class BookingForm extends StatelessWidget {
  BookingForm({Key? key}) : super(key: key);
  final fromkey = GlobalKey<FormState>();

  final controller = Get.put(BookingFormController());


  List examDetail = [
    {'item': 'Exam Level:', 'value': 'A2-B1'},
    {'item': 'Exam date:', 'value': '03/31/2022 (SAT)'},
    {'item': 'Exam Time:', 'value': '09:30 AM'},
  ];




  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
        initState: (state){},
        builder: ((controller)=>Obx(() => Scaffold(
          appBar: AppBarStyle(
            title: '''       Deutschtest für Zuwanderer
(DTZ / A2-B1) (PR-220409-HU-DTZ)''',
            centerTitle: true,
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
                  // SizedBox(width: 10,),
                  Text('Total', style: TextStylesCustom.textStyles_16.apply(color: ColorStyle.grey_5E6D77),),
                  SizedBox(width: 13,),
                  Text('7,50 €', style: TextStylesCustom.textStyles_22.apply(color: ColorStyle.primaryColor_1570A5, fontWeightDelta: 1),),
                  SizedBox(width: 35,),
                  Expanded(
                      child: ElevatedButtonCustoms(
                        onTap: (){
                          if(fromkey.currentState!.validate()){
                            // if(controller.salutation.value == ''){
                            //
                            // }else if(controller.motherToungue.value == ''){
                            //   'Mother toungue is required'.showError();
                            //   return;
                            // }else if(controller.country.value == ''){
                            //   'Country is required'.showError();
                            //   return;
                            // }else if(controller.paymentMethod.value == ''){
                            //   'Select payment method'.showError();
                            //   return;
                            // }else if(!controller.termsAndCondition.value){
                            //   'Terms and condition is required'.showError();
                            //   return;
                            // }else if(!controller.secondTerm.value){
                            //   'Agreement checkbox is required'.showError();
                            //   return;
                            // }else {
                            debugPrint('yay you logged in successfully');
                            //   BookingConfirmation().navigateToCustom(context, withNavBar: false);

                            // }
                          }


                          if(controller.salutation.value == ''){
                            controller.salutationError.value = true;
                          }else{
                            controller.salutationError.value = false;
                          }
                          //
                          //
                          if(controller.motherToungue.value == ''){
                            controller.motherToungueError.value = true;
                          }else{
                            controller.motherToungueError.value = false;
                          }
                          //
                          //
                          if(controller.country.value == ''){
                            controller.countryError.value = true;
                          }else{
                            controller.countryError.value = false;
                          }

                          if(controller.paymentMethod.value == ''){
                            controller.paymentError.value = true;
                          }else{
                            controller.paymentError.value = false;
                          }

                          if(!controller.termsAndCondition.value){
                            controller.termsError.value = true;
                          }else{
                            controller.termsError.value = false;
                          }

                          if(!controller.secondTerm.value){
                            controller.agreementError.value = true;
                          }else{
                            controller.agreementError.value = false;
                          }


                          // BookingConfirmation().navigateToCustom(context, withNavBar: false);
                        },
                        text: 'PAY NOW',
                        colorBG: ColorStyle.primaryColor_1570A5.withOpacity(0.5),
                      )
                  )
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [

                Center(
                  child: Image.asset(ImageStyle.bookingFormBar, width: 250, height: 100,),
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
                                padding: const EdgeInsets.only(left:4.0),
                                child: Text(
                                  'A2-B1 Level',
                                  style: TextStylesCustom.textStyles_21
                                      .apply(color: Colors.white, fontWeightDelta: 1),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),

                                  const SizedBox(
                                    width: 5,
                                  ),

                                  Expanded(
                                    child: Text(
                                      'Brüder Grimm Bildungscentrum e. V. Langstr. 60 63452 Hanau',
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
                          height: 270,
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
                              items: examDetail,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Examination Fees',
                                    style: TextStylesCustom.textStyles_14),
                                Expanded(
                                  child: SizedBox(
                                    width: Get.mediaQuery.size.width * 0.5,
                                    child: Text('7,50 €',
                                        textAlign: TextAlign.end,
                                        style: TextStylesCustom.textStyles_14
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total:',
                                    style: TextStylesCustom.textStyles_18.apply(color: ColorStyle.primaryColor_1570A5, fontWeightDelta: 1)),
                                Expanded(
                                  child: SizedBox(
                                    width: Get.mediaQuery.size.width * 0.5,
                                    child: Text('7,50 €',
                                        textAlign: TextAlign.end,
                                        style: TextStylesCustom.textStyles_18
                                            .apply(color: Colors.black, fontWeightDelta: 1)),
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
                    SizedBox(height: 35,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Booking Submission', style: TextStylesCustom.textStyles_16.apply(color: ColorStyle.primaryColor_1570A5, fontWeightDelta: 1),),
                    ),
                    SizedBox(height: 17,),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: ColorStyle.grey_DAE1E7,
                    ),
                    SizedBox(height: 15,),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Form(
                          key: fromkey,
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact Information', style: TextStylesCustom.textStyles_15.apply(fontWeightDelta: 2),),
                              SizedBox(height: 40,),

                              DropdownWithLabel(firstText:'Salutation',  list: ['s1', 's2', 's3'], width: Get.mediaQuery.size.width, controllerValue: controller.salutation,),
                              SizedBox(height: 15,),

                              // salutation error message
                              if(controller.salutationError.value)
                                CustomError(text: 'Salutation is required',),
                              // Container(
                              //   width: Get.size.width,
                              //   // height:
                              //   padding: const EdgeInsets.only(top: 10.0, bottom: 13, left: 13),
                              //   decoration: BoxDecoration(
                              //       // color: Colors.red,
                              //
                              //       border: Border(
                              //         top: BorderSide(color: Colors.red)
                              //       )
                              //   ),
                              //   child: Text('Salutation is Required', style: TextStylesCustom.textStyles_11.apply(color: Colors.red),),
                              //
                              // ),


                              TextFormFieldWithLabel(
                                firstText: 'Academic Title',
                                hintText: 'Please enter',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Academic title is required";
                                  }else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: 15,),
                              Row(
                                children: [
                                  Expanded(child: TextFormFieldWithLabel(firstText: 'First Name', hintText: 'Please enter',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "First name is required";
                                      }else if(!GetUtils.isAlphabetOnly(value)){
                                        return "First name must only contain letters";
                                      } else {
                                        return null;
                                      }
                                    },),),
                                  SizedBox(width: 20,),
                                  Expanded(child: TextFormFieldWithLabel(firstText: 'Last Name', hintText: 'Please enter',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Last name is required";
                                      }else if(!GetUtils.isAlphabetOnly(value)){
                                        return "Last name must only contain letters";
                                      } else {
                                        return null;
                                      }
                                    },),)
                                ],
                              ),
                              SizedBox(height: 15,),
                              TextFormFieldWithLabel(firstText: 'Identification Number', hintText: 'Please enter',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Identification number is required";
                                  }else {
                                    return null;
                                  }
                                },
                              ),

                              SizedBox(height: 15,),
                              TextFormFieldWithLabel(firstText: 'Email', hintText: 'Please enter',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email is required";
                                  }else if(!GetUtils.isEmail(value)){
                                    return "Email is invalid";
                                  } else {
                                    return null;
                                  }
                                },),

                              SizedBox(height: 15,),
                              DateFieldCustom(firstText: 'Birth Date', hintText: 'dd-mm-yy',),

                              SizedBox(height: 15,),
                              TextFormFieldWithLabel(firstText: 'Birth Place', hintText: 'Please enter',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Birth place is required";
                                  }else if(!GetUtils.isAlphabetOnly(value)){
                                    return "Birth place must only contain letters";
                                  } else {
                                    return null;
                                  }
                                },
                              ),

                              SizedBox(height: 15,),
                              TextFormFieldWithLabel(firstText: 'Country Of Birth', hintText: 'Please enter',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Country of birth is required";
                                  }else if(!GetUtils.isAlphabetOnly(value)){
                                    return "Country of birth must only contain letters";
                                  } else {
                                    return null;
                                  }
                                },
                              ),

                              SizedBox(height: 15,),
                              DropdownWithLabel(firstText:'Mother Tongue', list: ['m1', 'm2', 'm3','m4'], width: Get.mediaQuery.size.width, controllerValue: controller.motherToungue,),
                              if(controller.motherToungueError.value)
                                CustomError(text: 'Mother toungue is required',),


                              SizedBox(height: 15,),
                              TextFormFieldWithLabel(firstText: 'Telephone', secondText: '', hintText: 'Please enter', keyboardType: TextInputType.phone,

                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     return "T is required";
                                //   } else if (value.length < 9 || value.length >13) {
                                //     return "Phone must be between 9 and 13 digits";
                                //   } else {
                                //     return null;
                                //   }
                                // }
                              ),

                              SizedBox(height: 15,),
                              TextFormFieldWithLabel(firstText: 'Mobile', secondText: '*', hintText: 'Please enter', keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Mobile is required";
                                    } else if (value.length < 9 || value.length >13) {
                                      return "Mobile must be between 9 and 13 digits";
                                    } else {
                                      return null;
                                    }
                                  }),

                              SizedBox(height: 35,),
                              Row(
                                children: [
                                  Icon(Icons.add, color: ColorStyle.primaryColor_1570A5, size: 30,),
                                  SizedBox(width: 7,),
                                  Text('Upload ID Proof', style: TextStylesCustom.textStyles_15.apply(color: ColorStyle.primaryColor_1570A5, fontWeightDelta: 2),),
                                  Text(' *', style: TextStylesCustom.textStyles_16.apply(color: Colors.red),),
                                  SizedBox(width: 7,),
                                  Expanded(child: Text('(size up to 500 kb)', style: TextStylesCustom.textStyles_12.apply(color: ColorStyle.grey_5E6D77),)),

                                ],
                              ),
                              SizedBox(height: 36,),
                              Text('Address', style: TextStylesCustom.textStyles_16.apply(fontWeightDelta: 2),),
                              SizedBox(height: 33,),

                              SizedBox(height: 15,),
                              TextFormFieldWithLabel(firstText: 'C/o',secondText: '', hintText: 'Please enter',),

                              SizedBox(height: 15,),
                              TextFormFieldWithLabel(firstText: 'Street', hintText: 'Please enter',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Street is required";
                                    } else {
                                      return null;
                                    }
                                  }),

                              SizedBox(height: 15,),
                              TextFormFieldWithLabel(firstText: 'City', hintText: 'Please enter',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "City is required";
                                  }else if (!GetUtils.isAlphabetOnly(value)){
                                    return " City name must only contain letters";
                                  }
                                  else {
                                    return null;
                                  }
                                },),

                              SizedBox(height: 15,),
                              TextFormFieldWithLabel(firstText: 'Postal Code', hintText: 'Please enter', keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Postal code is required";
                                  }else {
                                    return null;
                                  }
                                },),

                              SizedBox(height: 15,),
                              DropdownWithLabel(firstText:'Country', list: ['Germany', 'india'], width: Get.mediaQuery.size.width, controllerValue: controller.country,),
                              if(controller.countryError.value)
                                CustomError(text: 'Country is required',),

                              SizedBox(height: 35,),
                              Text('Select Payment Method', style: TextStylesCustom.textStyles_16.apply(fontWeightDelta: 2),),
                              if(controller.paymentError.value)
                                CustomError(text: 'Select payment method is required',),
                              SizedBox(height: 23,),

                              Container(
                                // height: 89,
                                width: Get.mediaQuery.size.width,
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorStyle.grey_DAE1E7),
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        controller.paymentMethod.value = 'paypal';
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 14),
                                        child: Row(
                                          children: [
                                            controller.paymentMethod.value == 'paypal' ?
                                            Icon(Icons.radio_button_checked, color: ColorStyle.grey_DAE1E7,):
                                            Icon(Icons.circle_outlined, color: ColorStyle.grey_DAE1E7,),
                                            SizedBox(width: 8,),
                                            Expanded(child: Text('Paypal', style: TextStylesCustom.textStyles_16.apply(fontWeightDelta: 2),)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height: 1,
                                        width: Get.mediaQuery.size.width,
                                        color: ColorStyle.grey_DAE1E7
                                    ),
                                    InkWell(
                                      onTap: (){
                                        controller.paymentMethod.value = 'visa/master card';
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 14),
                                        child: Row(
                                          children: [
                                            controller.paymentMethod.value == 'visa/master card' ?
                                            Icon(Icons.radio_button_checked, color: ColorStyle.grey_DAE1E7,):
                                            Icon(Icons.circle_outlined, color: ColorStyle.grey_DAE1E7,),
                                            SizedBox(width: 8,),
                                            Expanded(child: Text('VISA/Master Card', style: TextStylesCustom.textStyles_16.apply(fontWeightDelta: 2),)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 39,),
                              InkWell(
                                onTap: (){
                                  controller.termsAndCondition.value = !controller.termsAndCondition.value;
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:2.0),
                                      child:
                                      controller.termsAndCondition.value ?
                                      Icon(Icons.check_box, color: ColorStyle.grey_DAE1E7,):
                                      Icon(Icons.check_box_outline_blank, color: ColorStyle.grey_A8B0B5,),
                                    ),
                                    SizedBox(width: 8,),
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          // text: 'I have read the ',
                                          // style: TextStylesCustom.textStyles_12,
                                          children:  <TextSpan>[
                                            TextSpan(text: 'I have read the ', style: TextStylesCustom.textStyles_15.apply(color: Colors.black)),
                                            TextSpan(text: 'General Terms and Conditions', style:TextStylesCustom.textStyles_15.apply(color: ColorStyle.primaryColor_1570A5)),
                                            TextSpan(text: ' and ', style: TextStylesCustom.textStyles_15.apply(color: Colors.black)),
                                            TextSpan(text: 'Privacy Policy', style:TextStylesCustom.textStyles_15.apply(color: ColorStyle.primaryColor_1570A5)),
                                            TextSpan(text: ' and agree to the storage of the above data. ', style: TextStylesCustom.textStyles_15.apply(color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              if(controller.termsError.value)
                                CustomError(text: 'Terms and conditions is required',),

                              SizedBox(height: 10,),
                              InkWell(
                                onTap: (){
                                  controller.secondTerm.value = !controller.secondTerm.value;
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:2.0),
                                      child:
                                      controller.secondTerm.value ?
                                      Icon(Icons.check_box, color: ColorStyle.grey_DAE1E7,):
                                      Icon(Icons.check_box_outline_blank,color: ColorStyle.grey_A8B0B5,),
                                    ),
                                    SizedBox(width: 8,),
                                    Expanded(
                                      child: Text('I agree that the service can be performed before the end of the right of withdrawal and I am aware that the right of withdrawal ends with the specified withdrawal period.', style: TextStylesCustom.textStyles_15.apply(color: Colors.black)),
                                    )
                                  ],
                                ),
                              ),
                              if(controller.agreementError.value)
                                CustomError(text: 'Agreement checkbox is required',),

                              SizedBox(height: 72,),

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

