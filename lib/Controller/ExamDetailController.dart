import 'package:bbz/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';



class ExamDetailController extends GetxController {
  RxMap examDetailData = {}.obs;
  RxBool isBooked = false.obs;

  void initMethods(id){
    Future.delayed(Duration(microseconds: 100), () {
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



}
