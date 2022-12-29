

import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import '../Utils/Global.dart';
import 'dart:io';
import 'package:country_picker/country_picker.dart';


class PickerCustom {
  static countryPicker(Function(String) onSelected, Function(String) onCountryCodeSelected) async {

    showCountryPicker(
      context: Get.context!,
      showPhoneCode: true, // optional. Shows phone code before the country name.
      onSelect: (Country country) {
        debugPrint('Select country: ${country.name}');
        onSelected(country.name);
        onCountryCodeSelected(country.countryCode);
        // return country.name;
      },
    );
  }

  static datePicker(
      {required String dateFormat, required DateTime selectedDate, required DateTime firstDate, required DateTime lastDate,}) async {

    // DateTime? selectedDate = DateTime(1919);

    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate,
    );

    // if (picked != null && picked != selectedDate) {
    if (picked != null) {
      selectedDate = picked;
      final DateFormat format = DateFormat(dateFormat);
      return format.format(picked);
    }

  }

  static imagePicker(Function(File) onSelected) {
    Get.bottomSheet(InkWell(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.camera_alt),
                title: Text(
                  'From Camera'.tr,
                    style: TextStylesCustom.textStyles_16
                        .apply(color: Colors.black)
                ),
                onTap: () async {
                  navigateToBack(Get.context);

                  final ImagePicker _picker = ImagePicker();
                  final imageFile = await _picker.pickImage(
                      source: ImageSource.camera,
                      // maxHeight:  200 ,
                      // maxWidth: 500
                  );

                  onSelected(File(imageFile!.path));
                },
              ),
              ListTile(
                leading: new Icon(Icons.photo),
                title: Text(
                  'From Photo'.tr,
                    style: TextStylesCustom.textStyles_16
                        .apply(color: Colors.black)
                ),
                onTap: () async {
                  navigateToBack(Get.context);

                  final ImagePicker _picker = ImagePicker();
                  final imageFile = await _picker.pickImage(
                      source: ImageSource.gallery,
                      // maxHeight:  200 ,
                      // maxWidth: 500
                  );

                  onSelected(File(imageFile!.path));

                  // Image.file(File(imageFile.path));
                  // File(imageFile.path);
                },
              ),
              Container(
                  margin: EdgeInsets.only(top: 16, bottom: 16),
                  height: 1,
                  color: ColorStyle.primaryColor_1570A5),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: 44,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorStyle.primaryColor_1570A5,
                      borderRadius: BorderRadius.circular(25)),
                  alignment: Alignment.center,
                  child: Text(
                    'Cancel'.tr,
                      style: TextStylesCustom.textStyles_16
                          .apply(color: Colors.white)
                  ),
                ),
                onTap: () {
                  navigateToBack(Get.context);
                },
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
      onTap: () {
        navigateToBack(Get.context);
      },
    ));
  }
}
