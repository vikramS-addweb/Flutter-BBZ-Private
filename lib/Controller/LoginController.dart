import 'dart:convert';

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



class LoginController extends GetxController {
  RxBool check3 = false.obs;
  RxBool loggedIn = false.obs;

  Rx<TextEditingController> useremail = TextEditingController().obs;
  Rx<TextEditingController> userPassword = TextEditingController().obs;

  checkIsLoggedIn() {
    final storage = GetStorage();
    // debugPrint('user : ${storage.read(kUserDetails)}');
    final strUserSAVED = storage.read(kUserDetails);

    if( strUserSAVED != null) {
      isLoggedIn = true;

      dictUserSaved = Map<String, dynamic>.from(jsonDecode(strUserSAVED));
      print(dictUserSaved);

      kSavedUserID = dictUserSaved[kUserID].toString();
      kTOKENSAVED = dictUserSaved[kTOKEN];

      return true;
    } else {
      return false;
    }
  }

  logout(){
    isLoggedIn = false;
    GetStorage().remove(kUserDetails);
    kTOKENSAVED = '';
    dictUserSaved = {};
    indexSelectedTab.value = 1;
    PersistentBottomNavBarCustom().navigateToCustom(Get.context,);
  }

  // validation() async {
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
      'email': useremail.value.text,
      'password': userPassword.value.text
    };

    final response = await API.instance.post(endPoint: 'api/login', params: params);
    // log(response.toString());

    print(response);
    if (response!.isNotEmpty) {
      isLoggedIn = true;

      if(check3.value) {
        GetStorage().write('user', jsonEncode(response));
      }

      dictUserSaved = response;
      kSavedUserID = dictUserSaved[kUserID].toString();
      kTOKENSAVED = dictUserSaved[kTOKEN];
      useremail.value.text = '';
      userPassword.value.text = '';

      // TabbarScreen().navigateToCustom(Get.context);
      indexSelectedTab.value = 0;

      PersistentBottomNavBarCustom(initialIndex: 0,).navigateToCustom(Get.context, isNavBarActive: true);
    }
  }

  RememberMe() {
    check3.value = !check3.value;
  }
}


