import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class ExamController extends GetxController {
  RxList upcomingExamData = [].obs;
  RxMap searchDetails = {}.obs;

  TextEditingController search = TextEditingController();
  RxString location = ''.obs;
  RxString language = ''.obs;
  RxString dateFrom = 'From'.obs;
  RxString dateTo = 'To'.obs;

  void initMethods() {
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

  searchExam() {
    print("clicking ...");

    if (search.text.isEmpty && location.isEmpty && (dateFrom == 'From') && (dateTo == 'To') && language.isEmpty) {
      showAlertDialog(Get.context!);
    } else {
      print(search.text);
      print(location);
      print(dateFrom.value);
      print(dateTo.value);
      print(language.value);
    }

  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("Ok", style: TextStylesCustom.textStyles_20.apply(fontWeightDelta: 1),),
      onPressed: () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error!", style: TextStylesCustom.textStyles_18.apply(fontWeightDelta: 1),),
      content: Text("Please choose at least one option.", style: TextStylesCustom.textStyles_16,),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
