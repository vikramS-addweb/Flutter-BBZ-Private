import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';

class ResetPasswordController extends GetxController {
  Rx<TextEditingController> useremail = TextEditingController().obs;

  resetPassword() {
    Get.focusScope!.unfocus();

    final params = {
      'email': useremail.value.text,
    };

    final response =
    API.instance.post(endPoint: 'api/reset-password', params: params);

    if (response != null) {
      // 'profile updated'.showSuccess();
      // Future.delayed(Duration(seconds: 1), () {
      //   showAlertDialog(Get.context!);
      // });
      "Password reset link is sent to your email.".showSuccess();

      // navigateToBack(Get.context);

      // PersistentBottomNavBarCustom().navigateToCustom(Get.context,);
    }else {
      'Please Enter Your Email!'.showError();
    }
  }
}


