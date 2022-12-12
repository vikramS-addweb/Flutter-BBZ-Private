import 'package:bbz/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import '../Views/BookingForm.dart';



class ExamDetailController extends GetxController {
  RxMap examDetailData = {}.obs;
  RxBool isBooked = false.obs;

  void initMethods(id){
    Future.delayed(Duration(microseconds: 100), () {
      examDetailData.clear();

      fetchExamDetails(id);
      if(kTOKENSAVED.isNotEmpty)
      fetchBookingStatus(id);
    });
  }

  Future fetchExamDetails(id) async {


    final response = await API.instance.get(endPoint: 'api/exam-detail/$id');

    if (response!.isNotEmpty) {
      debugPrint('response count ${response['data'].length}');
      examDetailData.value = response['data'];
      update();
    }
  }

  Future fetchBookingStatus(id) async {


    final response = await API.instance.get(endPoint: 'api/bookedExam/$id');

    if (response!.isNotEmpty) {
      if(response['status'] != null){
        if(response['status'] == 'Not'){
          isBooked.value = false;
        }else if(response['status'] == 'booked'){
          isBooked.value = true;
        }else{
          response['status'].toString().showError();
        }
      }else{
        response['message'].toString().showError();
      }
      update();
    }
  }

  //-----------------------------------------------verify email api---------------------------->

  Future bookNowVerityEmail() async {
    final response = await API.instance.get(endPoint: 'api/user-verify');

    if (response!.isNotEmpty) {
      if(response['flag'] != null){
        if(response['flag'] == 0){
          BookingForm(examDetails: examDetailData.value,).navigateToCustom(Get.context, withNavBar: false);
        }else{
          'verification mail sent on your email, please verify first'.showError();
        }
      }else{
        response.toString().showError();
      }

      update();
    }
  }



}
