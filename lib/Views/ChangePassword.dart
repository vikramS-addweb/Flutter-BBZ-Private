import 'package:bbz/Components/BGImage.dart';
import 'package:bbz/Components/ElevatedButtonCustom.dart';
import 'package:flutter/material.dart';
import '../../Components/AppBarStyle.dart';

import 'package:get/get.dart';
import '../../Controller/ChangePasswordController.dart';

import '../../Styles/TextStyles.dart';
import '../../Components/TextFieldCustom.dart';
import '../../Styles/ColorStyle.dart';
import '../../Styles/EffectStyle.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ChangePasswordController();
    return Scaffold(
      appBar: AppBarStyle(
        title: 'Change Password',
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
      body: Stack(
        children: [
          const BGImage(),
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              decoration: boxDecorationAuthBox(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30, 
                  ),
                  Text(
                    'Current Password *',
                    style: TextStylesCustom.textStyles_14
                        .apply(fontWeightDelta: -1),
                  ),
                  // -----------------------Email Feild---------------------------->
                  const SizedBox(
                    height: 10,
                  ),

                  TextFieldOutline(
                    controller: controller.currentPass.value,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email address',
                    textStyle: TextStylesCustom.textStyles_14
                        .apply(fontWeightDelta: -1),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    colorBoder: ColorStyle.grey_DAE1E7,
                    radiusBorder: 4,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'New Password *',
                    style: TextStylesCustom.textStyles_14
                        .apply(fontWeightDelta: -1),
                  ),
                  // -----------------------Email Feild---------------------------->
                  const SizedBox(
                    height: 10,
                  ),

                  TextFieldOutline(
                    controller: controller.newPass.value,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email address',
                    textStyle: TextStylesCustom.textStyles_14
                        .apply(fontWeightDelta: -1),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    colorBoder: ColorStyle.grey_DAE1E7,
                    radiusBorder: 4,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Confirm Password *',
                    style: TextStylesCustom.textStyles_14
                        .apply(fontWeightDelta: -1),
                  ),
                  // -----------------------Email Feild---------------------------->
                  const SizedBox(
                    height: 10,
                  ),

                  TextFieldOutline(
                    controller: controller.confirmPass.value,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email address',
                    textStyle: TextStylesCustom.textStyles_14
                        .apply(fontWeightDelta: -1),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    colorBoder: ColorStyle.grey_DAE1E7,
                    radiusBorder: 4,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                 ElevatedButtonCustom(
                    text: 'CHANGE PASSWORD',
                    size: Size(MediaQuery.of(context).size.width - 30, 50),
                    onTap: () {
                      controller.resetPassword();
                      // Get.to(const Login());
                    },
                  ),
                ],
                
              ),
            ),
            
          ),
          
        ],
      ),
    );
  }
}
