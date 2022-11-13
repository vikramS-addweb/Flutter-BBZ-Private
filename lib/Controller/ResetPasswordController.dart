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
    if (useremail.value.text.isNotEmpty) {
      if (!GetUtils.isEmail(useremail.value.text))
        'Enter a Valid Email !'.showError();
      else {
        final response =
            API.instance.post(endPoint: 'api/reset-password', params: params);

        // print('response ==========${response}');
        if (response != null) {
          'Your Reset Password Request is sent on your email'.showSuccess();
          Get.back();
        }
      }
    } else
      'Please Enter Your Email!'.showError();
  }
}
