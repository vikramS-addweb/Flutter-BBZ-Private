import 'package:bbz/Views/PersistentBottomNavBarCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';
import '../Views/TabbarScreen.dart';
import '../Utils/Constant.dart';
import 'package:get_storage/get_storage.dart';
import '../Views/WelcomeScreen.dart';
import '../Views/Profile.dart';
import './LoginController.dart';



class ChangePasswordController extends GetxController {
  RxBool check3 = false.obs;
  RxBool loggedIn = false.obs;

  Rx<TextEditingController> currentPassword = TextEditingController().obs;
  Rx<TextEditingController> newPassword = TextEditingController().obs;
  Rx<TextEditingController> confirmPassword = TextEditingController().obs;

  final loginController = Get.put(LoginController());



  changePassword() async {
    final params = {
      'old_password': currentPassword.value.text,
      'new_password': newPassword.value.text,
      'new_password_confirmation': confirmPassword.value.text
    };
    debugPrint(currentPassword.value.text);
    debugPrint(newPassword.value.text);
    debugPrint(confirmPassword.value.text);

    final response = await API.instance.post(endPoint: 'api/change-password', params: params);

    if (response!.isNotEmpty) {
      'password changed successfully'.showSuccess();
      loginController.logout();


      // PersistentBottomNavBarCustom().navigateToCustom(Get.context,);
    }
  }


}
