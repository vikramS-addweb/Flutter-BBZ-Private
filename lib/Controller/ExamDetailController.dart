
import 'package:bbz/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import '../Views/BookingForm.dart';
import './MyProfileController.dart';
import '../Views/MyProfile.dart';
import '../Views/BookingHistory.dart';
import '../Views/ChangePassword.dart';

class ExamDetailController extends GetxController {
  final controllerMyProfile = Get.put(MyProfileController());

  RxMap examDetailData = {}.obs;
  RxBool isBooked = false.obs;

  void initMethods(id) {
    examDetailData.clear();
    Future.delayed(Duration(microseconds: 100), () {


      fetchExamDetails(id);
      if (kTOKENSAVED.isNotEmpty) fetchBookingStatus(id);
    });
  }

  Future fetchExamDetails(id) async {
    final response = await API.instance.get(endPoint: 'api/exam-detail/$id');

    if (response!.isNotEmpty) {
      debugPrint('response count ${response['data'].length}');
      var body = response['data'];
      var bodycontent = response['data']['content'];
      if(bodycontent != null) {
        var searchSrc = 'src=\"/uploads';
        var replaceSrc = 'src=\"${API.instance.baseURL()}uploads';
        body['content'] = bodycontent.replaceAll(searchSrc, replaceSrc);
      }
      examDetailData.value = body;
      update();
    }
  }

  Future fetchBookingStatus(id) async {
    final response = await API.instance.get(endPoint: 'api/bookedExam/$id');

    if (response!.isNotEmpty) {
      if (response['check'] != 'paid') {
        isBooked.value = false;
      } else {
        isBooked.value = true;
      }
      update();
    }
  }

  //-----------------------------------------------verify email api---------------------------->

  Future bookNowVerityEmail() async {
    final response = await API.instance.get(endPoint: 'api/user-verify');

    if (response!.isNotEmpty) {
      if (response['flag'] != null) {
        if (response['flag'] == 0) {
          BookingForm(
            examDetails: examDetailData.value,
          ).navigateToCustom(Get.context, withNavBar: false);
        } else {
          'verification mail sent on your email, please verify first'
              .tr
              .showSuccess();
        }
      } else {
        response.toString().showError();
      }

      update();
    }
  }

  Future isVerityEmail(index) async {
    final response = await API.instance.get(endPoint: 'api/user-verify');

    if (response!.isNotEmpty) {
      if (response['flag'] != null) {
        if (response['flag'] == 0) {
          switch (index) {
            case 0:
              // MyProfile().navigateToCustom(context, withNavBar: false);

              Get.to(MyProfile())!.then((value) {
                controllerMyProfile.updateOnMyProfile();
              });

              break;
            case 1:
              BookingHistory().navigateToCustom(Get.context);
              break;
            case 2:
              ChangePassword().navigateToCustom(Get.context, withNavBar: false);
              break;
            default:
              break;
          }
          // BookingForm(examDetails: examDetailData.value,).navigateToCustom(Get.context, withNavBar: false);
        } else {
          'verification mail sent on your email, please verify first'.tr
              .showSuccess();
        }
      } else {
        response.toString().showError();
      }

      update();
    }
  }
}
