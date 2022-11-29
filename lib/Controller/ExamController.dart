import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';



class ExamController extends GetxController {
  RxList upcomingExamData = [].obs;

  void initMethods(){
    Future.delayed(Duration(microseconds: 100), () {
      fetchUpcomingExam();
    });
  }

  Future fetchUpcomingExam() async {


    final response = await API.instance.get(endPoint: 'api/exams');

    if (response!.isNotEmpty) {
      debugPrint('response count ${response['data'].toList().length}');
      upcomingExamData.value = response['data'];
      update();
    }
  }

}
