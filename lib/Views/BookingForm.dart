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

class BookingForm extends StatelessWidget {
  BookingForm({Key? key}) : super(key: key);



  List examDetail = [
    {'item': 'Exam Level:', 'value': 'A2-B1'},
    {'item': 'Exam date:', 'value': '03/31/2022 (SAT)'},
    {'item': 'Exam Time:', 'value': '09:30 AM'},
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        title: '''Deutschtest für Zuwanderer
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
                      BookingConfirmation().navigateToCustom(context, withNavBar: false);
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
                                  .apply(color: Colors.white),
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
                                  style: TextStylesCustom.textStyles_12
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Contact Information', style: TextStylesCustom.textStyles_15.apply(fontWeightDelta: 2),),
                      SizedBox(height: 40,),

                      DropdownWithLabel(firstText:'Salutation', ontap: (){}, list: ['Please select'], width: Get.mediaQuery.size.width, dropdownValue: 'Please select',),
                      SizedBox(height: 15,),

                      TextFieldWithLabel(firstText: 'Academic Title', hintText: 'Please enter',),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Expanded(child: TextFieldWithLabel(firstText: 'First Name', hintText: 'Please enter',),),
                          SizedBox(width: 20,),
                          Expanded(child: TextFieldWithLabel(firstText: 'Last Name', hintText: 'Please enter',),)
                        ],
                      ),
                      SizedBox(height: 15,),
                      TextFieldWithLabel(firstText: 'Identification Number', hintText: 'Please enter',),

                      SizedBox(height: 15,),
                      TextFieldWithLabel(firstText: 'Email', hintText: 'Please enter',),

                      SizedBox(height: 15,),
                      DateFieldCustom(firstText: 'Birth Date', hintText: 'dd-mm-yy',),

                      SizedBox(height: 15,),
                      TextFieldWithLabel(firstText: 'Birth Place', hintText: 'Please enter',),

                      SizedBox(height: 15,),
                      TextFieldWithLabel(firstText: 'Country Of Birth', hintText: 'Please enter',),

                      SizedBox(height: 15,),
                      TextFieldWithLabel(firstText: 'Mother Tongue', hintText: 'Please enter',),

                      SizedBox(height: 15,),
                      TextFieldWithLabel(firstText: 'Telephone', secondText: '', hintText: 'Please enter',),

                      SizedBox(height: 15,),
                      TextFieldWithLabel(firstText: 'Mobile', secondText: '', hintText: 'Please enter',),

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
                      TextFieldWithLabel(firstText: 'C/o',secondText: '', hintText: 'Please enter',),

                      SizedBox(height: 15,),
                      TextFieldWithLabel(firstText: 'Street', hintText: 'Please enter',),

                      SizedBox(height: 15,),
                      TextFieldWithLabel(firstText: 'City', hintText: 'Please enter',),

                      SizedBox(height: 15,),
                      TextFieldWithLabel(firstText: 'Postal Code', hintText: 'Please enter',),

                      SizedBox(height: 15,),
                      TextFieldWithLabel(firstText: 'Country', hintText: 'Please enter',),

                      SizedBox(height: 35,),
                      Text('Select Payment Method', style: TextStylesCustom.textStyles_16.apply(fontWeightDelta: 2),),
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
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 14),
                              child: Row(
                                children: [
                                  Icon(Icons.circle_outlined, color: ColorStyle.grey_DAE1E7,),
                                  SizedBox(width: 8,),
                                  Expanded(child: Text('Paypal', style: TextStylesCustom.textStyles_16.apply(fontWeightDelta: 2),)),
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              width: Get.mediaQuery.size.width,
                              color: ColorStyle.grey_DAE1E7
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 14),
                              child: Row(
                                children: [
                                  Icon(Icons.circle_outlined, color: ColorStyle.grey_DAE1E7,),
                                  SizedBox(width: 8,),
                                  Expanded(child: Text('VISA/Master Card', style: TextStylesCustom.textStyles_16.apply(fontWeightDelta: 2),)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 39,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:2.0),
                            child: Icon(Icons.check_box_outline_blank, color: ColorStyle.grey_A8B0B5,),
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
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:2.0),
                            child: Icon(Icons.check_box_outline_blank,color: ColorStyle.grey_A8B0B5,),
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Text('I agree that the service can be performed before the end of the right of withdrawal and I am aware that the right of withdrawal ends with the specified withdrawal period.', style: TextStylesCustom.textStyles_15.apply(color: Colors.black)),
                          )
                        ],
                      ),
                      
                      SizedBox(height: 72,),

                    ],
                  ),
                ),


              ],
            )

          ],
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

