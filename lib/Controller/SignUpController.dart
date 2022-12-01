import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';
import '../Utils/Constant.dart';

class SignUpController extends GetxController {
  final check = false.obs;

  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> mobile = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> cPassword = TextEditingController().obs;

  userSignUp() async {
    Get.focusScope!.unfocus();

    // final params = {
    //   'first_name': firstName.value.text,
    //   'last_name': lastName.value.text,
    //   'email': email.value.text,
    //   'password': password.value.text,
    //   'phone': mobile.value.text,
    //   'term': '${check.value}'
    // };

    final params = {
      'first_name': "first name",
      'last_name': "last name",
      'email': "rajaa@gmail.com",
      'password': "123456",
      'phone': "123456",
      'term': 'true'
    };

    final response = await API.instance.post(endPoint: 'api/signup', params: params);

    debugPrint(response.toString());

    if (response!.isNotEmpty) {
      isLoggedIn = true;

      'You are Registered Successfully'.showSuccess();
    }

  }

  RememberMe() {
    check.value = !check.value;
  }
}
