import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../Controller/PersistentNavBarController.dart';


class ExamController extends GetxController {

  final navBarController = Get.put(PersistentNavBarController());

  RxList upcomingExamData = [].obs;
  RxList searchResultData = [].obs;
  RxBool showSearchData = false.obs;

  RxMap searchDetails = {}.obs;

  TextEditingController search = TextEditingController();
  RxString location = ''.obs;
  RxString language = ''.obs;
  RxString dateFrom = 'From'.obs;
  RxString dateTo = 'To'.obs;
  RxInt locationId = 0.obs;
  RxInt languageId = 0.obs;

  Rx<DateTime> dateFromMinDateForTo = DateTime.now().obs;

  void initMethods() {
    Future.delayed(Duration(microseconds: 100), () {
      navBarController.isNavBarActive.value = true;
      fetchUpcomingExam();
      fetchSearchDetails();
    });
  }

  getSearchResult() async {

    if(language.value != ''){
      final searchExamLevel =  searchDetails['exam_level'].firstWhere((element) => element['name'] == language.value);
      languageId.value = searchExamLevel['id'];
    }

    if(location.value != ''){
      final searchLocation =  searchDetails['locations'].firstWhere((element) => element['name'] == location.value);
      locationId.value = searchLocation['id'];
    }

    // debugPrint(' exam level id : ${searchExamLevel}');
    // debugPrint(' location id : ${searchLocation}');

    final params = {
      'location_id': location.value != '' ? '${locationId.value}' : ''  ,
      'from_date': dateFrom.value == 'From' ? '' : dateFrom.value,
      'to_date':  dateTo.value == 'To' ? '' : dateTo.value,
      'exam_level_id' : language.value != '' ? '${languageId.value}' : '',
      'term' : search.text,
    };

    final response = await API.instance.post(endPoint: 'api/search', params: params);

    if (response!.isNotEmpty) {
      debugPrint('response count ${response['data'].toList().length}');
      searchResultData.value = response['data'];
      showSearchData.value = true;
      update();
    }
  }

  clear(){
    showSearchData.value = false;
    language.value = '';
    location.value = '';
    dateTo.value = 'To';
    dateFrom.value = 'From';
    search.text = '';
    update();
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
      debugPrint('SearchDetails response count ${response.length}');
      searchDetails.value = response;
      update();
    }
  }






  searchExam() {
    print("clicking ...");
    // getSearchResult();

    if ( search.text.isEmpty && location.isEmpty && (dateFrom == 'From') && (dateTo == 'To') && language.isEmpty) {
      showAlertDialog(Get.context!);
    } else {
      getSearchResult();
      // print(search.text);
      // print(location);
      // print(dateFrom.value);
      // print(dateTo.value);
      // print(language.value);
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


  // ----------------------------------------reg date difference----------------------------->




}
