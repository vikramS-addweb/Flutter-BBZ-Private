import 'dart:convert';
import 'dart:io';
import 'dart:math';

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
  RxString imageURL = ''.obs;

  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> co = TextEditingController().obs;
  Rx<TextEditingController> street = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> telephone = TextEditingController().obs;
  Rx<TextEditingController> postalCode = TextEditingController().obs;
  Rx<TextEditingController> birthDate = TextEditingController().obs;
  // Rx<TextEditingController> country = TextEditingController().obs;
  RxString country = ''.obs;

  RxString name = ''.obs;
  RxBool countryError = false.obs;

  void initMethods() {
    Future.delayed(const Duration(microseconds: 100), () {
      getProfile();
    });
  }

  getProfile() async {
    final response = await API.instance.get(endPoint: 'api/profile');
    // print(response);

    if (response!.isNotEmpty) {
      dictUserSaved = response;

      profileData.value = response;
      firstName.value.text = profileData['first_name'] ?? '';
      lastName.value.text = profileData['last_name'] ?? '';
      email.value.text = profileData['email'] ?? '';
      city.value.text = profileData['city'] ?? '';
      country.value = profileData['country'] ?? '';
      co.value.text = profileData['address'] ?? '';
      street.value.text = profileData['address2'] ?? '';
      telephone.value.text = profileData['phone'] ?? '';
      birthDate.value.text = profileData['birthday'] ?? '';
      postalCode.value.text = profileData['zip_code'] != null
          ? profileData['zip_code'].toString()
          : '';

      if (profileData['media'] != null) {
        final dictMedia = Map<String, dynamic>.from(profileData['media']);
        print(dictMedia['file_name'].toString());
        imageURL.value = kBaseURL_Image + dictMedia['file_name'].toString();
      }else {
        image.value = File('');
        imageURL.value = '' ;
      }

      // https://bbzstage.addwebprojects.com/uploads/image_picker_E2DC2F7C-A3F9-4B59-8B19-C3C8CADF915B-2786-0000001BF293E94E.jpg
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
      'country': country.value,
      'address': co.value.text,
      'address2': street.value.text,
      'city': city.value.text,
      'zipCode': postalCode.value.text
    };

    final response =
        await API.instance.put(endPoint: 'api/edit-profile', params: params);
    print(response);

    if (response!.isNotEmpty) {
      print(response['message']);

      final response1 = await API.instance.get(endPoint: 'api/profile');

      if (response1!.isNotEmpty) {
        dictUserSaved = response1;
      }

      navigateToBack(Get.context);
    }
  }

  editProfileImage() async {
    final params = {'_method': 'post'};

    final response = await API.instance.postImage(
      endPoint: "api/profileImage",
      params: params,
      fileParams: "avatar",
      file: image.value,
    );

    if (response!.isNotEmpty) {
      if (response['message'].toString() == 'Image Uploaded') {
        "Image Uploaded".tr.showSuccess();
      } else {
        response['message'].toString().showSuccess();
      }
    }
  }

  updateOnMyProfile() {
    name.value = dictUserSaved['name'].toString();
  }

  String? requiredFieldValidator(input) {
    if (input == null || input.isEmpty) {
      return "this field is required";
    }
    return null;
  }
}
