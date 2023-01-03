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
import '../Controller/PersistentNavBarController.dart';
import '../Styles/TextStyles.dart';
import '../Components/TextFieldCustom.dart';
import '../Components/TextRichCustom.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Utils/Global.dart';
import '../Controller/ChangePasswordController.dart';


class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final fromkey = GlobalKey<FormState>();
  final controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    // final controller = LoginController();
    return GetBuilder(
        initState: (state){

        },
        init: controller,
        builder: ((controller)=>Obx(() => WillPopScope(
          onWillPop: () async {
            // Do something here
            final navbarController = Get.find<PersistentNavBarController>();
            navbarController.isNavBarActive.value = true;
            print("After clicking the Android Back Button");
            controller.reset();
            return true;
          },
          child: Scaffold(
            // floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Text('label'),),

            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButtonCustoms(
                onTap: (){
                  if(fromkey.currentState!.validate()){
                    debugPrint('yay you logged in successfully');
                    controller.changePassword();
                    // controller.validation();
                  }
                },
                text: 'SAVE CHANGES'.tr,
                styleText: TextStylesCustom.textStyles_16,
                colorBG: ColorStyle.primaryColor_1570A5,
              ),
            ),
            appBar: AppBarStyle(
              title: 'Change Password'.tr,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorStyle.primaryColor_1570A5,
                ),
                onPressed: () {
                  // Get.back();
                  controller.reset();
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
                          child: Form(
                            key: fromkey,
                            child:Column(
                              children: [

                                SizedBox(
                                  height: 48,
                                ),



                                // -----------------------current password Field---------------------------->
                                TextFormFieldWithLabel(
                                  controller: controller.currentPassword.value,
                                  obscureText: true,
                                  firstText: 'Current Password'.tr,
                                  hintText: 'Please enter'.tr,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Current password is required".tr;
                                    } else if(value.trim().length < 8){
                                      return "Current password must be at least 8 characters".tr;
                                    }else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: 15,),
                                // -----------------------New Password---------------------------->
                                TextFormFieldWithLabel(
                                  controller: controller.newPassword.value,
                                  obscureText: true,
                                  firstText: 'New Password'.tr,
                                  hintText: 'Please enter'.tr,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "New password is required".tr;
                                    } else if(value.trim().length < 8){
                                      return "New password must be at least 8 characters".tr;
                                    }else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: 15,),
                                // -----------------------confirm password Field---------------------------->
                                TextFormFieldWithLabel(
                                  controller: controller.confirmPassword.value,
                                  obscureText: true,
                                  firstText: 'Confirm Password'.tr,
                                  hintText: 'Please enter'.tr,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Confirm password is required".tr;
                                    } else if(value.trim().length < 8){
                                      return "Confirm password must be at least 8 characters".tr;
                                    } else if(value != controller.newPassword.value.text){
                                      return "Confirm password must be same as new password".tr;
                                    }
                                    else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: 14,),



                              ],

                            ),
                          )
                      ),
                      const SizedBox(height: 100,),

                    ],
                  ),
                )
              ],
            ),
          ),
        )))
    );

  }
}



