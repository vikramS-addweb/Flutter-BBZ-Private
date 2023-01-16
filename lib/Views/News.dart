import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:intl/intl.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../Controller/ExamScreenController.dart';
import 'NewsDetail.dart';

import '../Views/DrawerScreen.dart';
import '../Utils/Constant.dart';
import '../Utils/Global.dart';
import '../Components/BottomNavBarCustom.dart';
import '../Controller/NewsController.dart';
import 'package:flutter_html/flutter_html.dart';


class News extends StatefulWidget {
  News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final controller = Get.put(NewsController());

  GlobalKey<ScaffoldState> keyDrawer = GlobalKey();
  
   @override
  void initState() {
    final examScreenController = Get.find<ExamScreenController>();
     examScreenController.drawerIndex.value = 4;
    super.initState();
  }

  @override
  void dispose() {
     final examScreenController = Get.find<ExamScreenController>();
     examScreenController.drawerIndex.value = 10;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loaderController = Get.find<ExamScreenController>();
    return Scaffold(
      backgroundColor: ColorStyle.white,
      key: keyDrawer,
      drawer: DrawerScreen(),
      // bottomNavigationBar: bottomNavBarCustom(),
      appBar: AppBarStyle(
        title: 'News'.tr,
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
        styleTitle: TextStylesCustom.textStyles_22.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
        ),
        elevation: 2,
      ),
      body: GetBuilder(
        initState: (state) {
          controller.initMethods();
        },
        init: controller,
        builder: ((controller) =>
            Obx(() =>
            controller.newsData.length == 0 ?
                Center(child:
                loaderController.loaderPoped.value ? CircularProgressIndicator(): Text('No News is Available!'.tr, style: TextStylesCustom.textStyles_18,)):
                ListView.separated(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 32, bottom: 32),
              itemCount: controller.newsData.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  // color: Colors.red,
                  height: 40,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    NewsDetail(id: controller.newsData[index]['id']).navigateToCustom(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.newsData[index]['media'] != null && controller.newsData[index]['media']['file_path'] != null ?
                      Image.network(
                        '$kBaseURL_Image${controller.newsData[index]['media']['file_path']}',
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ):
                      controller.newsData[index].toString().isNotEmpty ?
                       Image.asset(
                        ImageStyle.newArticle,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ) : const SizedBox(),
                      const SizedBox(
                        height: 25,
                      ),
                      controller.newsData[index]['created_at'] != null ?
                      Text(
                        '${DateFormat('dd/MM/yyyy').format(DateTime.parse('${controller.newsData[index]['created_at']}'))}',
                        style: TextStylesCustom.textStyles_12.apply(
                          color: ColorStyle.primaryColor_1570A5,
                        ),
                      ):
                      const SizedBox(),
                      const SizedBox(
                        height: 7,
                      ),
                      controller.newsData[index]['title'] != null ?
                      Text(
                        '${controller.newsData[index]['title']}',
                        style: TextStylesCustom.textStyles_14
                            .apply(color: Colors.black, fontWeightDelta: 1),
                      ):
                      const SizedBox(),
                      const SizedBox(
                        height: 9,
                      ),
                      controller.newsData[index]['contentInEn'] != null ?
                      
                      Text(
                        Get.locale.toString().contains('de') ? '${controller.newsData[index]['contentInDe']}...' : '${controller.newsData[index]['contentInEn']}...',
                        style: TextStylesCustom.textStyles_13.apply(
                          color: ColorStyle.grey_5E6D77,
                          overflow: TextOverflow.ellipsis,
                          
                        ),
                        maxLines: 3,
                      ):
                      const SizedBox(),
                    ],
                  ),
                );
              },
            )
            )
        ),
      ),

    );
  }
}
