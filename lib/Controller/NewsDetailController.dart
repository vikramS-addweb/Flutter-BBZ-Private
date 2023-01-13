import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';



class NewsDetailController extends GetxController {
  RxMap newsDetailData = {}.obs;
  RxBool content = false.obs;

  void initMethods(id){
    Future.delayed(Duration(microseconds: 200), () {
      print('HI/$id');
      content.value = false;
      newsDetailData.value = {};
      fetchNewsDetails(id);
    });
  }

  Future fetchNewsDetails(id) async {
    var endpoint = 'api/news/$id';


    final response = await API.instance.get(endPoint: endpoint);

    if (response!.isNotEmpty) {
      debugPrint('response count ${response['data'].length}');
      var body = response['data'];
      var bodycontent = response['data']['content'];
      content.value = response['data']['content'].toString().isNotEmpty;
      print(content);
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
