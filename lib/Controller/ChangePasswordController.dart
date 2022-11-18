import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';

class ChangePasswordController extends GetxController {
  Rx<TextEditingController> currentPass = TextEditingController().obs;
  Rx<TextEditingController> newPass = TextEditingController().obs;
  Rx<TextEditingController> confirmPass = TextEditingController().obs;

  resetPassword() {
    Get.focusScope!.unfocus();
    final params = {
      'currentpassword': currentPass.value.text,
    };
    if (currentPass.value.text.isNotEmpty) {
      
        final response =
            API.instance.post(endPoint: '', params: params);

        // print('response ==========${response}');
        if (response != null) {
          'Password successfully changed'.showSuccess();
        
      }
    } else
      'Please Enter Your password!'.showError();
  }
}
