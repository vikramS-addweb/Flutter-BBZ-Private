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

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = LoginController();
    return Scaffold(
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButtonCustoms(
          onTap: () {},
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
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  decoration: boxDecorationAuthBox(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 5),
                        height: 115,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: ColorStyle.grey_DAE1E7)),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                  ImageStyle.myProfilePhoto),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: ElevatedButtonCustoms(
                              onTap: () {},
                              text: 'EDIT PICTURE',
                              styleText: TextStylesCustom.textStyles_16.apply(
                                  color: ColorStyle.primaryColor_1570A5,
                                  fontWeightDelta: 1),
                              colorBG: Colors.white,
                              colorBorder: ColorStyle.primaryColor_1570A5,
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
                        children: const [
                          Expanded(
                              child: TextFormFieldWithLabel(
                            firstText: 'First Name',
                            hintText: 'John',
                          )),
                          SizedBox(
                            width: 21,
                          ),
                          Expanded(
                              child: TextFormFieldWithLabel(
                            firstText: 'Last Name',
                            hintText: 'Doe',
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // -----------------------Email Field---------------------------->
                      const TextFormFieldWithLabel(
                        firstText: 'Email',
                        hintText: 'Johndoe@gmail.com',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // -----------------------Telephone Field---------------------------->
                      const TextFormFieldWithLabel(
                        firstText: 'Telephone',
                        secondText: '',
                        hintText: 'Please enter',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // -----------------------Birth Date Field---------------------------->
                      const TextFormFieldWithLabel(
                        firstText: 'Birth Date',
                        hintText: 'dd-mm-yy',
                      ),
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
                      const TextFormFieldWithLabel(
                        firstText: 'C/o',
                        secondText: '',
                        hintText: 'Please enter',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // -----------------------Street field---------------------------->
                      const TextFormFieldWithLabel(
                        firstText: 'Street',
                        hintText: 'Please enter',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // -----------------------City field---------------------------->
                      const TextFormFieldWithLabel(
                        firstText: 'City',
                        hintText: 'Please enter',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // -----------------------Postal field---------------------------->
                      const TextFormFieldWithLabel(
                        firstText: 'Postal Code',
                        hintText: 'Please enter',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // -----------------------Country field---------------------------->
                      const TextFormFieldWithLabel(
                        firstText: 'Country',
                        hintText: 'Please enter',
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      //------------------------Change password button----------------------->
                      ElevatedButtonCustoms(
                        onTap: () {
                          const ChangePassword().navigateToCustom(context);

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
          )
        ],
      ),
    );
  }
}
