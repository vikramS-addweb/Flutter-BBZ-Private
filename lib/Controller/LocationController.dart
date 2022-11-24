import 'package:bbz/Views/PersistentBottomNavBarCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';
import '../Views/PersistentBottomNavBarCustom.dart';
import '../Utils/Constant.dart';
import '../Models/LocationModel.dart';



class LocationController extends GetxController {
  RxString testing = 'Checking ...'.obs;

  RxList<LocationModel> locationData = <LocationModel>[].obs;


  RxInt count = 0.obs;

  void initMethods(){
    Future.delayed(Duration(microseconds: 100), () {
      fetchLocation();

    });
  }

  Future fetchLocation() async {


    final response = await API.instance.get(endPoint: 'api/location');

    if (response!.isNotEmpty) {
      List filterData = response['data'].where((item) {
        return (item['map_lat'] != null && item['map_lng'] != null);
      }).toList();
      count.value = response['data'].toList().length;
      debugPrint('response count ${response['data'].toList().length}');
      debugPrint('filterData count ${filterData.length}');
      count.value = filterData.length;
      debugPrint('countvalue count ${count.value}');


      locationData.value = List<LocationModel>.from(filterData.map((x) => LocationModel.fromJson(x)));
      debugPrint('locationData count ${locationData.value.length}');

update();
    }
  }

}
