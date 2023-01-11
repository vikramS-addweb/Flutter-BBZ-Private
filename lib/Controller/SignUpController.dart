import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';
import '../Utils/Constant.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:bbz/Views/PersistentBottomNavBarCustom.dart';


class SignUpController extends GetxController {

  void initMethods() {
    Future.delayed(const Duration(microseconds: 100), () {
      reset();
    });
  }

  final check = false.obs;

  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> mobile = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> cPassword = TextEditingController().obs;

  userSignUp() async {
    Get.focusScope!.unfocus();

    final params = {
      'first_name': firstName.value.text,
      'last_name': lastName.value.text,
      'email': email.value.text,
      'password': password.value.text,
      'phone': mobile.value.text,
      'term': '${check.value}'
    };

    // final params = {
    //   'first_name': "first name",
    //   'last_name': "last name",
    //   'email': "raja1@gmail.comeee3233",
    //   'password': "12345678",
    //   'phone': "123456789012121231233",
    //   'term': 'true'
    // };

    final response = await API.instance.post(endPoint: 'api/signup', params: params);

    debugPrint(response.toString());

    if (response!.isNotEmpty) {


      if (response['error'] != null) {
        final dictMessage = Map<String, dynamic>.from(response['messages']);

        if (dictMessage['email'] != null) {
          final arrEmail = dictMessage['email'];
          if(arrEmail[0].toString() == 'The email has already been taken.'){
            "The email has already been taken.".tr.showError();
          }
          else{
            arrEmail[0].toString().showError();
          }


          return;
        } else if (dictMessage['phone'] != null) {
          final arrPhone = dictMessage['phone'];
          arrPhone[0].toString().showError();

          return;
        }
      } else {
        GetStorage().write('user', jsonEncode(response));
        isLoggedIn = true;
        dictUserSaved = response;
        kSavedUserID = dictUserSaved[kUserID].toString();
        kTOKENSAVED = dictUserSaved[kTOKEN];

        indexSelectedTab.value = 0;
        Get.offAll(()=> PersistentBottomNavBarCustom(initialIndex: 0));
        // PersistentBottomNavBarCustom(initialIndex: 0,).navigateToCustom(Get.context,);
      }
    }

  }

  isTermsConditions() {
    check.value = !check.value;
  }

  reset(){
    firstName.value.text = '';
   lastName.value.text = '';
    email.value.text = '';
    password.value.text = '';
    mobile.value.text = '';
    check.value = false;
  }

}




