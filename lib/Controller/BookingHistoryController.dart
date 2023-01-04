import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import 'package:flutter/cupertino.dart';
import '../Utils/Constant.dart';


class BookingHistoryController extends GetxController {
  RxList upcomingExamHistoryData = [].obs;
  RxList pastExamHistoryData = [].obs;
  RxMap bookingDetails = {}.obs;

  void initMethods() {
    Future.delayed(Duration(microseconds: 100), () {
      fetchUpcomingExamHistory();
      fetchPastExamHistory();
    });
  }

  // String code = '65F4B64C97C67DEC33AA3354304818';

  Future fetchUpcomingExamHistory() async {
    upcomingExamHistoryData.value = [];
    final response = await API.instance.get(endPoint: 'api/upcoming-exams/${dictUserSaved['id']}');
    if (response!.isNotEmpty) {
      debugPrint(' upcoming history response count ${response['data'].length}');
      // print(response['data']);
      for(int i=0; i < response['data'].length; i++){
        if(response['data'][i]['status'] == 'paid'){
          print('hi');
          upcomingExamHistoryData.add(response['data'][i]);
        }
      }
      update();
    }
  }

  Future fetchPastExamHistory() async {
    final response = await API.instance.get(endPoint: 'api/past-exams/${dictUserSaved['id']}');
    if (response!.isNotEmpty) {
      debugPrint('Past history response count ${response['data'].length}');
      pastExamHistoryData.value = response['data'];
      update();
    }
  }

  Future fetchBookingDetail(id) async {
    bookingDetails.clear();
    final response = await API.instance.get(endPoint: 'api/booking-detail/$id');
    if (response!.isNotEmpty) {
      debugPrint('booking details response count ${response.length}');
      bookingDetails.value = response;
      update();
    }
  }
}
