import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';

class SignUpController extends GetxController {
  final check = false.obs;

  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> mobile = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> cPassword = TextEditingController().obs;

  userSignUp() {
    Get.focusScope!.unfocus();
    print(check.value.runtimeType);
    final params = {
      'first_name': firstName.value.text,
      'last_name': lastName.value.text,
      'email': email.value.text,
      'password': password.value.text,
      'phone': mobile.value.text,
      'term': '${check.value}'
    };
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (firstName.value.text.isEmpty ||
        lastName.value.text.isEmpty ||
        email.value.text.isEmpty ||
        password.value.text.isEmpty ||
        cPassword.value.text.isEmpty)
      'All Fields are Required'.showError();
    else if (password.value.text.length < 8)
      'Password should have atleast 8 characters'.showError();
    else if (!regex.hasMatch(password.value.text))
      'Enter a stronger password'.showError();
    else if (!GetUtils.isEmail(email.value.text))
      'Enter a Valid Email Address'.showError();
    else if (password.value.text != cPassword.value.text)
      'Confimation password does not match the entered password'.showError();
    else if (!check.value)
      'Please Read Terms and Privacy Policy'.showError();
    else {
      final response =
          API.instance.post(endPoint: 'api/signup', params: params);

      if (response != null) {
        'You are Registered Successfully'.showSuccess();
        navigateToBack(Get.context);
      }
      // 'You are Registered Successfully'.showSuccess();
      // signUp();
    }
  }

  RememberMe() {
    check.value = !check.value;
  }
}
