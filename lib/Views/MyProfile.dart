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
            Get.back();
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
        child: ElevatedButtonCustoms(onTap: (){}, text: 'SAVE CHANGES', colorBG: ColorStyle.primaryColor_1570A5,),
      ),
      body: Stack(
        children: [
          const BGImage(),
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  decoration: boxDecorationAuthBox(),
                  child: Column(
                    children: [

                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                        height: 115,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:Border.all(color : ColorStyle.grey_A8B0B5)
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network("https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),),
                            const SizedBox(width: 28,),
                            ElevatedButtonCustoms(onTap: (){}, text: 'EDIT PICTURE', colorText: ColorStyle.primaryColor_1570A5,colorBG: Colors.white, width: Get.mediaQuery.size.width*0.45, colorBorder: ColorStyle.primaryColor_1570A5,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: const [
                          Expanded(child: TextFieldWithLabel(firstText: 'First Name', hintText: 'Joe',)),
                          SizedBox(width: 21,),
                          Expanded(child: TextFieldWithLabel(firstText: 'Last Name',hintText: 'Doe',)),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      // -----------------------Email Field---------------------------->
                      const TextFieldWithLabel(firstText: 'Email', hintText: 'Johndoe@gmail.com',),
                      const SizedBox(height: 15,),
                      // -----------------------Telephone Field---------------------------->
                      const TextFieldWithLabel(firstText: 'Telephone',secondText: '', hintText: 'Please enter',),
                      const SizedBox(height: 15,),
                      // -----------------------Birth Date Field---------------------------->
                      const TextFieldWithLabel(firstText: 'Birth Date', hintText: 'dd-mm-yy',),
                      const SizedBox(height: 14,),


                      const SizedBox(height: 28,),
                      // -----------------------C/o field---------------------------->
                      const TextFieldWithLabel(firstText: 'C/o',secondText: '', hintText: 'Please enter',),
                      const SizedBox(height: 15,),
                      // -----------------------Street field---------------------------->
                      const TextFieldWithLabel(firstText: 'Street', hintText: 'Please enter',),
                      const SizedBox(height: 15,),
                      // -----------------------City field---------------------------->
                      const TextFieldWithLabel(firstText: 'City', hintText: 'Please enter',),
                      const SizedBox(height: 15,),
                      // -----------------------Postal field---------------------------->
                      const TextFieldWithLabel(firstText: 'Postal Code', hintText: 'Please enter',),
                      const SizedBox(height: 15,),
                      // -----------------------Country field---------------------------->
                      const TextFieldWithLabel(firstText: 'Country', hintText: 'Please enter',),
                      const SizedBox(height: 40,),
                      //------------------------Change password button----------------------->
                      ElevatedButtonCustoms(onTap: (){
                        Get.to(()=>const ChangePassword());
                      }, text: 'CHANGE PASSWORD', colorText: ColorStyle.primaryColor_1570A5,colorBG: Colors.white, width: Get.mediaQuery.size.width, colorBorder: ColorStyle.primaryColor_1570A5,),
                      const SizedBox(height: 40,),
                    ],

                  ),
                ),
                const SizedBox(height: 100,)
              ],
            ),
          )
        ],
      ),
    );
  }
}




