import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';

class LoginController extends GetxController {
  RxBool check3 = false.obs;

  Rx<TextEditingController> useremail = TextEditingController().obs;
  Rx<TextEditingController> userPassword = TextEditingController().obs;

  userLogin() async {
    Get.focusScope!.unfocus();
    final params = {
      'email': useremail.value.text,
      'password': userPassword.value.text
    };
    if (useremail.value.text.isNotEmpty && userPassword.value.text.isNotEmpty) {
      if (!GetUtils.isEmail(useremail.value.text))
        'Enter a Valid Email !'.showError();
      else {
        final response = await API.instance.post(endPoint: 'api/login', params: params);

        print(response);
      }
    } else
      'Please Enter Your Email & Password !'.showError();
  }

  RememberMe() {
    check3.value = !check3.value;
  }
}
