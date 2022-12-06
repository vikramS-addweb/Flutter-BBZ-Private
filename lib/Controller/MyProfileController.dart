import 'dart:convert';
import 'dart:io';

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


class MyProfileController extends GetxController {

  RxMap<dynamic, dynamic> profileData = {}.obs;

  Rx<File> image = File('').obs;

  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> co = TextEditingController().obs;
  Rx<TextEditingController> street = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> telephone = TextEditingController().obs;
  Rx<TextEditingController> postalCode = TextEditingController().obs;
  Rx<TextEditingController> birthDate = TextEditingController().obs;
  Rx<TextEditingController> country = TextEditingController().obs;

  RxString name = ''.obs;

  void initMethods() {
    Future.delayed(const Duration(microseconds: 100), () {
      getProfile();
    });
  }

  getProfile() async {
    final response = await API.instance.get(endPoint: 'api/profile');
    print(response);

    if (response!.isNotEmpty) {
      dictUserSaved = response;

      debugPrint('getProfile response count ${response.length}');
      profileData.value = response;
      firstName.value.text = profileData['first_name'] ?? '';
      lastName.value.text = profileData['last_name'] ?? '';
      email.value.text = profileData['email'] ?? '';
      city.value.text = profileData['city'] ?? '';
      country.value.text = profileData['country'] ?? '';
      co.value.text = profileData['address'] ?? '';
      street.value.text = profileData['address2'] ?? '';
      telephone.value.text = profileData['phone'] ?? '';
      birthDate.value.text = profileData['birthday'] ?? '';
      postalCode.value.text = profileData['zip_code'] ?? '';
      image.value = profileData['avatar_id'] ?? File('');

      update();
    }
  }

  editProfile() async {
    final params = {
      'first_name': firstName.value.text,
      'last_name': lastName.value.text,
      'email': email.value.text,
      'phone': telephone.value.text,
      'birthday': birthDate.value.text,
      'country': country.value.text,
      'address': co.value.text,
      'address2': street.value.text,
      'city': city.value.text,
      'zip_code': postalCode.value.text
    };

    final response = await API.instance.put(
        endPoint: 'api/edit-profile', params: params);
    print(response);

    if (response!.isNotEmpty) {
      final response = await API.instance.get(endPoint: 'api/profile');
      print(response);

      if (response!.isNotEmpty) {
        dictUserSaved = response;
      }

      navigateToBack(Get.context);
    }
  }

  editProfileImage() async {
  final params = {
    '_method': 'post'
  };

  final response = await API.instance.postImage(
    endPoint: "profileImage",
    params: params,
    fileParams: "avatar_id",
    file: image.value,
  );

  print(response);

  if (response!.isNotEmpty) {
    response['message'].toString().showSuccess();
  }
}

  updateOnMyProfile() {
    name.value = dictUserSaved['name'].toString();
  }

}
