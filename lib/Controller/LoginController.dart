import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool check3 = true.obs;

  RememberMe() {
    check3.value = !check3.value;
    print('done');
  }

}
