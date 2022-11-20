import 'package:bbz/Components/BGImage.dart';
import 'package:bbz/Controller/SignUpController.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:flutter/material.dart';
import '../Components/AppBarStyle.dart';
import '../Components/TextFieldBase.dart';
import '../Components/PasswordFieldBase.dart';
import '../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
// import '../WelcomeScreen.dart';
// import '../../Controller/LoginController.dart';
// import '../Auth/SignUp.dart';
// import '../Auth/ResetPassword.dart';
import '../Styles/TextStyles.dart';
import '../Components/TextFieldCustom.dart';
import '../Components/TextRichCustom.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Utils/Global.dart';


class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = LoginController();
    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Text('label'),),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButtonCustoms(onTap: (){}, text: 'SAVE CHANGES', colorBG: ColorStyle.primaryColor_1570A5,),
      ),
      appBar: AppBarStyle(
        title: 'Change Password',
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorStyle.primaryColor_1570A5,
          ),
          onPressed: () {
            // Get.back();
            navigateToBack(context);
          },
        ),
        styleTitle: TextStylesCustom.textStyles_16.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
        ),
        elevation: 1,
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
                    children: const [

                      SizedBox(
                        height: 48,
                      ),



                      // -----------------------Email Field---------------------------->
                      TextFieldWithLabel(firstText: 'Current Password', hintText: 'Johndoe@gmail.com',),
                      SizedBox(height: 15,),
                      // -----------------------Telephone Field---------------------------->
                      TextFieldWithLabel(firstText: 'New Password', hintText: 'Please enter',),
                      SizedBox(height: 15,),
                      // -----------------------Birth Date Field---------------------------->
                      TextFieldWithLabel(firstText: 'Confirm Password', hintText: 'dd-mm-yy',),
                      SizedBox(height: 14,),



                    ],

                  ),
                ),
                const SizedBox(height: 100,),

              ],
            ),
          )
        ],
      ),
    );
  }
}



