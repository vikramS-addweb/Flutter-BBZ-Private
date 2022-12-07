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

    final response = await API.instance.post(endPoint: 'api/reset-password', params: params);

    if (response!.isNotEmpty) {
      "Password reset link is sent to your email.".showSuccess();

      Future.delayed(const Duration(seconds: 1), () {
        Login().navigateToCustom(Get.context);
      });
    }
  }
}


