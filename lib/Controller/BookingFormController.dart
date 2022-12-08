import 'package:bbz/Views/PersistentBottomNavBarCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';
import '../Views/PersistentBottomNavBarCustom.dart';
import '../Utils/Constant.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import './ExamDetailController.dart';



class BookingFormController extends GetxController {

  final examDetailController = Get.put(ExamDetailController());

  Rx<File> image = File('').obs;
  RxString imageURL = ''.obs;

  RxString paymentMethod = ''.obs;
  RxBool termsAndCondition = false.obs;
  RxBool secondTerm = false.obs;
  RxBool salutationError = false.obs;
  RxBool motherToungueError = false.obs;
  RxBool countryError = false.obs;
  RxBool paymentError = false.obs;
  RxBool termsError = false.obs;
  RxBool agreementError = false.obs;

  //drowpdown variables
  RxInt event_id= 0.obs;
  RxString salutation = ''.obs;
  Rx<TextEditingController> academic_title = TextEditingController().obs;
  Rx<TextEditingController> birth_date = TextEditingController().obs;
  Rx<TextEditingController> first_name = TextEditingController().obs;
  Rx<TextEditingController> last_name = TextEditingController().obs;
  Rx<TextEditingController> identification_number = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  RxString birthDate = ''.obs;
  Rx<TextEditingController> birth_place = TextEditingController().obs;
  Rx<TextEditingController> country_of_birth = TextEditingController().obs;

  RxString motherToungue = ''.obs;
  Rx<TextEditingController> telephone = TextEditingController().obs;
  Rx<TextEditingController> mobile = TextEditingController().obs;

  //address fields
  Rx<TextEditingController> co = TextEditingController().obs;
  Rx<TextEditingController> street = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> postal_code = TextEditingController().obs;
  RxString country = ''.obs;





  registerExam() async{
    print(examDetailController.examDetailData.value['id']);
    print(salutation.value);
    print(academic_title.value.text);
    print(first_name.value.text);
    print(last_name.value.text);
    print(identification_number.value.text);
    print(email.value.text);
    print(birth_date.value.text);
    print(birth_place.value.text);
    print(country_of_birth.value.text);
    print(motherToungue.value);
    print(telephone.value.text);
    print(mobile.value.text);
    print(co.value.text);
    print(street.value.text);
    print(city.value.text);
    print(postal_code.value.text);
    print(country.value);
    print(paymentMethod.value);
    print(termsAndCondition.value);
    print(secondTerm.value);

    final params = {
      '_method': 'post',
      'id_proof': image.value.path,
      'email': email.value.text,
      'event_id': '${examDetailController.examDetailData.value['id']}',
      'salutation': salutation.value,
      'academic_title': academic_title.value.text,
      'first_name': first_name.value.text,
      'last_name': last_name.value.text,
      'identification_number': identification_number.value.text,
      'birth_date': birth_date.value.text,
      'birth_place': birth_place.value.text,
      'country_of_birth': country_of_birth.value.text,
      'mother_tongue': motherToungue.value,
      'telephone': telephone.value.text,
      'phone': mobile.value.text,
      'c/o': co.value.text,
      'address_line_1': first_name.value.text,
      'street': street.value.text,
      'city': city.value.text,
      'zip_code': postal_code.value.text,
      'country': country.value,
      'payment_gateway': paymentMethod.value,
      'term_conditions_1': '${termsAndCondition.value}',
      'term_conditions': '${secondTerm.value}',
      'term_conditions_2': 'true'
    };

    final response =
        await API.instance.post(endPoint: 'api/register-exam', params: params);
    print(response);

    if (response!.isNotEmpty) {
      response['message'].toString().showSuccess();
      final response1 = await API.instance.get(endPoint: 'api/profile');
      print(response1);

      if (response1!.isNotEmpty) {
        dictUserSaved = response;
      }

      // navigateToBack(Get.context);
    }


  }

  uploadImage() async {
    debugPrint(image.value.path);
    final params = {
      '_method': 'post',
    };

    final response = await API.instance.postImage(
      endPoint: "api/bookingImage",
      params: params,
      fileParams: "id_proof",
      file: image.value,
    );

    if (response!.isNotEmpty) {
      response['message'].toString().showSuccess();
    }
  }
  //
  // sendMessage() async {
  //   Get.focusScope!.unfocus();
  //   final params = {
  //     'full_name': userName.value.text,
  //     'email': userEmail.value.text,
  //     'message': userMessage.value.text
  //   };
  //
  //   final response = await API.instance.post(endPoint: 'api/contact-us', params: params);
  //
  //   if (response!.isNotEmpty) {
  //     // isLoggedIn = true;
  //     response['success'].toString().showSuccess();
  //     userName.value.text = '';
  //     userEmail.value.text = '';
  //     userMessage.value.text = '';
  //
  //     // PersistentBottomNavBarCustom().navigateToCustom(Get.context, withNavBar: false);
  //   }
  // }

}
