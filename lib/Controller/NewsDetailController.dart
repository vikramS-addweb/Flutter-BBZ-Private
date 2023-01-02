import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';



class NewsDetailController extends GetxController {
  RxMap newsDetailData = {}.obs;

  void initMethods(id){
    Future.delayed(Duration(microseconds: 100), () {
      fetchNewsDetails(id);
    });
  }

  Future fetchNewsDetails(id) async {


    final response = await API.instance.get(endPoint: 'api/news/$id');

    if (response!.isNotEmpty) {
      debugPrint('response count ${response['data'].length}');
      var body = response['data'];
      var bodycontent = response['data']['content'];
      if(bodycontent != null) {
        var searchSrc = 'src=\"/uploads';
        var replaceSrc = 'src=\"${API.instance.baseURL()}uploads';
        body['content'] = bodycontent.replaceAll(searchSrc, replaceSrc);
      }
      newsDetailData.value = body;
      update();
    }
  }

}
