import 'package:bbz/Views/PersistentBottomNavBarCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';
import '../Views/PersistentBottomNavBarCustom.dart';
import '../Utils/Constant.dart';



class ContactUsController extends GetxController {

  Rx<TextEditingController> userName = TextEditingController().obs;
  Rx<TextEditingController> userEmail = TextEditingController().obs;
  Rx<TextEditingController> userMessage = TextEditingController().obs;

  validation() async {
    Get.focusScope!.unfocus();

    if (userName.value.text.isNotEmpty && userEmail.value.text.isNotEmpty && userMessage.value.text.isNotEmpty) {
      if (!GetUtils.isEmail(userEmail.value.text))
        'Enter a Valid Email !'.showError();
      else {
        sendMessage();
      }
    } else
      'Please Enter Your Name, Email & Password !'.showError();
  }

  sendMessage() async {
    Get.focusScope!.unfocus();
    final params = {
      'full_name': userName.value.text,
      'email': userEmail.value.text,
      'message': userMessage.value.text
    };

    final response = await API.instance.post(endPoint: 'api/contact-us', params: params);

    if (response!.isNotEmpty) {
      // isLoggedIn = true;
      if(response['success'].toString() == 'Your message has been sent successfully.'){
        "Your message has been sent successfully.".tr.showSuccess();
      }
      else{
        response['success'].toString().showSuccess();
      }
      userName.value.text = '';
      userEmail.value.text = '';
      userMessage.value.text = '';

      // PersistentBottomNavBarCustom().navigateToCustom(Get.context, withNavBar: false);
    }
  }

}
