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
import 'BookingForm.dart';

class ExamDetail extends StatelessWidget {
  ExamDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        title: 'Exam Detail',
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
              Text('Fee', style: TextStylesCustom.textStyles_12.apply(color: ColorStyle.grey_5E6D77),),
              const SizedBox(width: 13,),
              Text('7,50 €', style: TextStylesCustom.textStyles_22.apply(color: ColorStyle.primaryColor_1570A5),),
              const SizedBox(width: 35,),
              Expanded(
                  child: ElevatedButtonCustoms(
                    onTap: (){
                      BookingForm().navigateToCustom(context, withNavBar: false);
                    },
                    text: 'BOOK NOW',
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 13),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImageStyle.examBG),
                              fit: BoxFit.fill)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'A2-B1 Level',
                            style: TextStylesCustom.textStyles_21
                                .apply(color: Colors.white),
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
                                  child: Image.asset(ImageStyle.user,fit: BoxFit.fill,),
                                ),
                                const SizedBox(width: 10,),
                                Text('Seats Available  |', style: TextStylesCustom.textStyles_14.apply(color: Colors.green, fontWeightDelta: 1),),
                                const SizedBox(width: 10,),
                                Text('400/500', style: TextStylesCustom.textStyles_14.apply(color: Colors.green),)
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
                                Text('Exam Date', style: TextStylesCustom.textStyles_14.apply( fontWeightDelta: 1),),
                                const SizedBox(width: 10,),
                                Text('25/03/2022 (SAT)', style: TextStylesCustom.textStyles_14.apply(color: ColorStyle.primaryColor_1570A5),)
                              ],
                            ),
                            const SizedBox(height: 30,),
                            Row(
                              children: [
                                SizedBox(
                                  width: 28,
                                  height: 28,
                                  child: Image.asset(ImageStyle.hourglass,fit: BoxFit.fill,),
                                ),
                                const SizedBox(width: 10,),
                                Text('Reg. Until  |', style: TextStylesCustom.textStyles_14.apply(color: ColorStyle.orange_C16D00, fontWeightDelta: 1),),
                                const SizedBox(width: 10,),
                                Text('25/03/2022', style: TextStylesCustom.textStyles_14.apply(color: ColorStyle.orange_C16D00),)
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
                                Text('Exam Time  |', style: TextStylesCustom.textStyles_14.apply(fontWeightDelta: 1),),
                                const SizedBox(width: 10,),
                                Text('09:30 AM', style: TextStylesCustom.textStyles_14.apply(color: ColorStyle.primaryColor_1570A5),)
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
                  Text('Libero sem vitae sed donec conubia integer nisi integer rhoncus imperdiet orci odio libero est integer a integer tincidunt sollicitudin blandit fusce nibh leo vulputate lobortis egestas dapibus faucibus metus conubia maecenas cras potenti cum hac arcu rhoncus nullam eros dictum torquent integer cursus bibendum sem sociis molestie tellus purus Quam fusce convallis ipsum malesuada amet velit aliquam urna nullam vehicula fermentum id morbi dis magnis porta sagittis euismod etiam',style: TextStylesCustom.textStyles_14,),
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
    );
  }
}

