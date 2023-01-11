import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';



class NewsController extends GetxController {
  RxList newsData = [].obs;

  void initMethods(){
    Future.delayed(Duration(microseconds: 100), () {
      fetchNews();
    });
  }

  Future fetchNews() async {

    final response = await API.instance.get(endPoint: 'api/news');

    if (response!.isNotEmpty) {
      debugPrint('response count ${response['data'].toList().length}');
      newsData.value = response['data'];
      update();
    }
  }

}
