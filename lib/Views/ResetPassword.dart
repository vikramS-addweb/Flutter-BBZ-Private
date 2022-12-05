import 'package:bbz/Components/BGImage.dart';
import 'package:bbz/Components/BottomNavBarCustom.dart';
import 'package:flutter/material.dart';
import '../../Components/AppBarStyle.dart';
import '../../Components/TextFieldBase.dart';
import '../../Components/PasswordFieldBase.dart';
import '../../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import '../../Controller/LoginController.dart';
import '../../Controller/ResetPasswordController.dart';
import '../Views/SignUp.dart';
import '../Views/WelcomeScreen.dart';
import '../../Styles/TextStyles.dart';
import '../../Components/TextFieldCustom.dart';
import '../../Components/TextRichCustom.dart';
import '../../Styles/ColorStyle.dart';
import '../../Styles/EffectStyle.dart';
import '../../Utils/Global.dart';
import '../../Components/BottomNavBarCustom.dart';


class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = ResetPasswordController();
    return Scaffold(
      appBar: AppBarStyle(
        title: 'Reset Your Password',
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
          fontWeightDelta: 2,
        ),
        elevation: 2,
      ),
      // bottomNavigationBar: bottomNavBarCustom(),
      body: Stack(
        children: [
          const BGImage(),
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              decoration: boxDecorationAuthBox(),
              child: Form(
                key: fromkey,
                child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Kindly enter your registered E-mail Address to continue to Reset your password.',
                    style: TextStylesCustom.textStyles_14
                        .apply(fontWeightDelta: -1),
                  ),
                  // -----------------------Email Feild---------------------------->
                  const SizedBox(
                    height: 30,
                  ),

                  TextFormFieldOutline(
                    controller: controller.useremail.value,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email address',
                    textStyle: TextStylesCustom.textStyles_14
                        .apply(fontWeightDelta: -1),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    colorBoder: ColorStyle.grey_DAE1E7,
                    radiusBorder: 4,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      }else if(!GetUtils.isEmail(value)){
                        return "Email is invalid";
                      } else {
                        return null;
                      }
                    },
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  // -----------------------Login button---------------------------->
                  ElevatedButtonCustom(
                    text: 'SEND PASSWORD RESET LINK',
                    size: Size(MediaQuery.of(context).size.width - 30, 50),
                    styleText: TextStylesCustom.textStyles_15.apply(
                      fontWeightDelta: 2,
                    ),
                    onTap: () {
                      if(fromkey.currentState!.validate()){
                        // debugPrint('yay you logged in successfully');
                        controller.resetPassword();
                      }

                      // Get.to(const Login());
                    },
                  ),
                ],
              ),
            ),)
          ),
        ],
      ),
    );
  }
}
