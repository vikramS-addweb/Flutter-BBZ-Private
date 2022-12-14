import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../Controller/ExamScreenController.dart';
import '../Controller/PersistentNavBarController.dart';
import '../Styles/ColorStyle.dart';
import '../Utils/Global.dart';
import '../Styles/TextStyles.dart';
import '../Components/ElevatedButtonCustom.dart';
import './DrawerScreen.dart';
import 'package:get_storage/get_storage.dart';

class Language extends StatefulWidget {
  Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  GlobalKey<ScaffoldState> keyDrawer = GlobalKey();

  String language = 'english';

  @override
  void initState() {
    setState(() {
       final examScreenController = Get.find<ExamScreenController>();
     examScreenController.drawerIndex.value = 5;
      // print('langungae : ' + Get.locale.toString());
      if (Get.locale.toString().contains('de')) {
        setState(() {
          this.language = 'deutsch';
        });
      }
    });
  }



  @override
  void dispose() {
    final examScreenController = Get.put(ExamScreenController());
     examScreenController.drawerIndex.value = 10;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: keyDrawer,
        drawer: DrawerScreen(),
        appBar: AppBarStyle(
          title: 'Language'.tr,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: ColorStyle.primaryColor_1570A5,
              size: 30,
            ),
            onPressed: () {
              keyDrawer.currentState!.openDrawer();
            },
          ),
          styleTitle: TextStylesCustom.textStyles_16.apply(
            color: ColorStyle.primaryColor_1570A5,
            fontWeightDelta: 1,
          ),
          elevation: 2,
        ),
        body: Container(
          color: ColorStyle.grey_DAE1E7,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              ElevatedButtonCustoms(
                text: 'English'.tr,
                onTap: () {
                  var local = Locale('en', 'US');
                  print(Get.locale);
                  Get.updateLocale(local);
                  setState(() {
                    this.language = 'english';
                  });
                  GetStorage().write('setLanguage', 'english');
                  final navbarController = Get.find<PersistentNavBarController>();
                  navbarController.isNavBarActive.value = true;
                  navigateToBack(context);
                },
                width: Get.size.width,
                colorBG: this.language == 'english'
                    ? ColorStyle.primaryColor_1570A5
                    : Colors.white,
                colorText:
                this.language == 'english' ? Colors.white : Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButtonCustoms(
                text: 'Deutsch'.tr,
                onTap: () {
                  var local = Locale('de');
                  print(Get.locale);
                  Get.updateLocale(local);
                  setState(() {
                    this.language = 'deutsch';
                  });
                  GetStorage().write('setLanguage', 'deutsch');
                  final navbarController = Get.find<PersistentNavBarController>();
                  navbarController.isNavBarActive.value = true;
                  navigateToBack(context);
                },
                width: Get.size.width,
                colorBG: this.language == 'deutsch'
                    ? ColorStyle.primaryColor_1570A5
                    : Colors.white,
                colorText:
                this.language == 'deutsch' ? Colors.white : Colors.black,
              ),
            ],
          ),
        ));
  }
}
