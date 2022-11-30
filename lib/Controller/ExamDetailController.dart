import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';



class ExamDetailController extends GetxController {
  RxMap examDetailData = {}.obs;

  void initMethods(id){
    Future.delayed(Duration(microseconds: 100), () {
      fetchExamDetails(id);
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

}
