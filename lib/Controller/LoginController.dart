import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';
import '../Views/TabbarScreen.dart';

class LoginController extends GetxController {
  RxBool check3 = false.obs;

  Rx<TextEditingController> useremail = TextEditingController().obs;
  Rx<TextEditingController> userPassword = TextEditingController().obs;

  validation() async {
    Get.focusScope!.unfocus();

    if (useremail.value.text.isNotEmpty && userPassword.value.text.isNotEmpty) {
      if (!GetUtils.isEmail(useremail.value.text))
        'Enter a Valid Email !'.showError();
      else {
        userLogin();
      }
    } else
      'Please Enter Your Email & Password !'.showError();
  }

  userLogin() async {
    final params = {
      'email': useremail.value.text,
      'password': userPassword.value.text
    };

    final response = await API.instance.post(endPoint: 'api/login', params: params);

    if (response!.isNotEmpty) {
      Get.to(TabbarScreen());
    }
  }

  RememberMe() {
    check3.value = !check3.value;
  }
}
