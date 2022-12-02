import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';



class ExamController extends GetxController {
  RxList upcomingExamData = [].obs;
  RxMap searchDetails = {}.obs;

  void initMethods(){
    Future.delayed(Duration(microseconds: 100), () {
      fetchUpcomingExam();
      fetchSearchDetails();
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

  Future fetchSearchDetails() async {


    final response = await API.instance.get(endPoint: 'api/exam-search-detail');

    if (response!.isNotEmpty) {
      debugPrint('SearchDetails response count ${response['data'].toList().length}');
      searchDetails.value = response['data'];
      update();
    }
  }
}
