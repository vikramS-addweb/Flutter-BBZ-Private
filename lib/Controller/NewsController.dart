import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';



class NewsController extends GetxController {
  RxList newsData = [].obs;

  void initMethods(){
    Future.delayed(Duration(microseconds: 200), () {
      newsData.value = [];
      fetchNews();
    });
  }

  Future fetchNews() async {
    String endpoint = 'api/news';


    final response = await API.instance.get(endPoint: endpoint);

    if (response!.isNotEmpty) {
      debugPrint('response count ${response['data'].toList().length}');
      newsData.value = response['data'];
      update();
    }
  }

}
