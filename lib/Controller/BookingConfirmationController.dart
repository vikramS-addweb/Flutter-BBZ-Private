import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import 'package:flutter/cupertino.dart';


class BookingConfirmationController extends GetxController {
  RxMap bookingConfirmationData = {}.obs;

  void initMethods(code) {
    Future.delayed(Duration(microseconds: 100), () {
      fetchBookingConfirmationData(code);
    });
  }

  // String code = '65F4B64C97C67DEC33AA3354304818';

  Future fetchBookingConfirmationData(code) async {
    final response = await API.instance.get(endPoint: 'api/get-booking/$code');
    if (response!.isNotEmpty) {
      debugPrint('response count ${response.length}');
      bookingConfirmationData.value = response;
      update();
    }
  }
}
