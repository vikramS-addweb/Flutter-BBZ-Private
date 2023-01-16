import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
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
import '../Utils/Constant.dart';
import '../Utils/Global.dart';
import 'package:http/http.dart' as http;

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
      fetchUpcomingAndSearchExams();
    });
  }

  getSearchResult() async {
    if (language.value != '') {
      final searchExamLevel = searchDetails['exam_level']
          .firstWhere((element) => element['name'] == language.value);
      languageId.value = searchExamLevel['id'];
    }

    if (location.value != '') {
      final searchLocation = searchDetails['locations']
          .firstWhere((element) => element['name'] == location.value);
      locationId.value = searchLocation['id'];
    }

    // debugPrint(' exam level id : ${searchExamLevel}');
    // debugPrint(' location id : ${searchLocation}');

    final params = {
      'location_id': location.value != '' ? '${locationId.value}' : '',
      'from_date': dateFrom.value == 'From' ? '' : dateFrom.value,
      'to_date': dateTo.value == 'To' ? '' : dateTo.value,
      'exam_level_id': language.value != '' ? '${languageId.value}' : '',
      'term': search.text,
    };

    final response =
        await API.instance.post(endPoint: 'api/search', params: params);

    if (response!.isNotEmpty) {
      debugPrint('response count ${response['data'].toList().length}');
      searchResultData.value = response['data'];
      showSearchData.value = true;
      update();
    }
  }

  clear() {
    showSearchData.value = false;
    language.value = '';
    location.value = '';
    dateTo.value = 'To';
    dateFrom.value = 'From';
    search.text = '';
    dateFromMinDateForTo.value = DateTime.now();
    update();
  }

  Future fetchUpcomingAndSearchExams()async{
     final response = await fetchUpcomingExamAndfetchSearchDetails(endPoint1: 'api/exams', endPoint2: 'api/exam-search-detail');
    if (response!.isNotEmpty) {
      debugPrint('response count ${response[0]['data'].toList().length}');
      debugPrint('response count ${response[1]}');
      upcomingExamData.value = response[0]['data'];
      searchDetails.value = response[1];

      print("SEARCH");
      print(searchDetails['locations']);
      update();
    }
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

    if (search.text.isEmpty &&
        location.isEmpty &&
        (dateFrom == 'From') &&
        (dateTo == 'To') &&
        language.isEmpty) {
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
      child: Text(
        "Ok",
        style: TextStylesCustom.textStyles_20.apply(fontWeightDelta: 1),
      ),
      onPressed: () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Error!".tr,
        style: TextStylesCustom.textStyles_18.apply(fontWeightDelta: 1),
      ),
      content: Text(
        "Please choose at least one option".tr,
        style: TextStylesCustom.textStyles_16,
      ),
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


  Future fetchUpcomingExamAndfetchSearchDetails({required String endPoint1, required String endPoint2}) async {
    final _kBaseURL = 'https://bbzstage.addwebprojects.com/';
    if (!await _checkInternet()) {
      return null;
    }

    final url1 = Uri.parse('${_kBaseURL}${endPoint1}');
    final url2 = Uri.parse('${_kBaseURL}${endPoint2}');

    final headers = {'Authorization': 'Bearer $kTOKENSAVED'};

    try {
      showLoaderGetX();
      final response1 = await http.get(url1, headers: headers);
      final response2 = await http.get(url2, headers: headers);
      hideLoader();

      debugPrint(response1.statusCode.toString());
      debugPrint(response2.statusCode.toString());
      // debugPrint(response.body);

      final parsed1 = json.decode(response1.body);
      final parsed2 = json.decode(response2.body);
      return [parsed1, parsed2];
    } on Exception catch (exception) {
      hideLoader();
      debugPrint('Exception is:-' + exception.toString());
      return null;
    } catch (error) {
      hideLoader();
      debugPrint('Error is:-' + error.toString());
      return null;
    }
  }



    Future<bool> _checkInternet() async {
    try {
      showLoaderGetX();
      var connectivityResult = await (Connectivity().checkConnectivity());
      hideLoader();
      if (connectivityResult == ConnectivityResult.mobile) {
        debugPrint('Mobile data is connected');
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        debugPrint('WiFi connected');
        return true;
      } else {
        debugPrint('Internet is not connected');
        'Internet is not connected'.tr.showError();
        return false;
      }
    } catch (error) {
      debugPrint(error.toString());
      error.toString().showError();
      hideLoader();
      return false;
    }
  }


}
