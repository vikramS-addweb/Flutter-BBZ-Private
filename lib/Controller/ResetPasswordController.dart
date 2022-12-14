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
      if (response['status'].toString() == 'error') {
        if(response['message'] == 'Email not found'){
          'Email not found'.tr.showError();
        }else{
          response['message'].toString().showError();
        }
      } else {
        'We have emailed your password reset link!'.tr.showSuccess();
        debugPrint(response['message'].toString());
        useremail.value.text = '';
        Future.delayed(const Duration(seconds: 1), () {
          Login().navigateToCustom(Get.context);
        });
      }

      // "Password reset link is sent to your email.".showSuccess();


    }
  }
}


