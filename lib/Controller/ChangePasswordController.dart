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



class ChangePasswordController extends GetxController {
  RxBool check3 = false.obs;
  RxBool loggedIn = false.obs;

  Rx<TextEditingController> currentPassword = TextEditingController().obs;
  Rx<TextEditingController> newPassword = TextEditingController().obs;
  Rx<TextEditingController> confirmPassword = TextEditingController().obs;

  // checkIsLoggedIn(){
  //   final storage = GetStorage();
  //   debugPrint('userId : ${storage.read('userId')}');
  //
  //   if( storage.read('userId') != null){
  //     isLoggedIn = true;
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // logout(){
  //   isLoggedIn = false;
  //   GetStorage().remove('userId');
  //   PersistentBottomNavBarCustom(initialIndex: 0,).navigateToCustom(Get.context,);
  // }

  // validation() async {
  //   // checkIsLoggedIn();
  //   Get.focusScope!.unfocus();
  //
  //   if (useremail.value.text.isNotEmpty && userPassword.value.text.isNotEmpty) {
  //     if (!GetUtils.isEmail(useremail.value.text))
  //       'Enter a Valid Email !'.showError();
  //     else {
  //       userLogin();
  //     }
  //   } else
  //     'Please Enter Your Email & Password !'.showError();
  // }

  userLogin() async {
    final params = {
      'old_password': currentPassword.value.text,
      'new_password': newPassword.value.text,
      'new_password_confirmation': confirmPassword.value.text
    };

    final response = await API.instance.post(endPoint: 'api/change-password', params: params);

    if (response!.isNotEmpty) {
      // isLoggedIn = true;
      //
      // if(check3.value) {
      //   GetStorage().write('userId', response['id']);
      //   debugPrint('userId : ${GetStorage().read('userId')}');
      // }
      // TabbarScreen().navigateToCustom(Get.context);
      PersistentBottomNavBarCustom().navigateToCustom(Get.context,);
    }
  }

  RememberMe() {
    check3.value = !check3.value;
  }
}
