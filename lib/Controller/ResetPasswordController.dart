import 'package:bbz/Views/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';
import '../Views/PersistentBottomNavBarCustom.dart';

class ResetPasswordController extends GetxController {
  Rx<TextEditingController> useremail = TextEditingController().obs;

  resetPassword() async{
    Get.focusScope!.unfocus();

    final params = {
      'email': useremail.value.text,
    };

    final response = await
    API.instance.post(endPoint: 'api/reset-password', params: params);

    if (response != null) {
      // 'profile updated'.showSuccess();
      // Future.delayed(Duration(seconds: 1), () {
      //   showAlertDialog(Get.context!);
      // });
      "Password reset link is sent to your email.".showSuccess();

      Future.delayed(Duration(seconds: 1), (){
        Login().navigateToCustom(Get.context);
      });

      // navigateToBack(Get.context);

      // PersistentBottomNavBarCustom(initialIndex: 1,).navigateToCustom(Get.context,);
    }else {
      'Please Enter Your Email!'.showError();
    }
  }
}


