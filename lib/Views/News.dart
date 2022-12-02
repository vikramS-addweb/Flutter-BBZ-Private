import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:intl/intl.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';
import 'NewsDetail.dart';

import '../Views/DrawerScreen.dart';
import '../Utils/Constant.dart';
import '../Utils/Global.dart';
import '../Components/BottomNavBarCustom.dart';
import '../Controller/NewsController.dart';
import 'package:flutter_html/flutter_html.dart';


class News extends StatelessWidget {
  News({Key? key}) : super(key: key);
  final controller = Get.put(NewsController());


  GlobalKey<ScaffoldState> keyDrawer = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      key: keyDrawer,
      drawer: DrawerScreen(),
      // bottomNavigationBar: bottomNavBarCustom(),
      appBar: AppBarStyle(
        title: 'News',
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
                        '$networkImage${controller.newsData[index]['media']['file_path']}',
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ):
                      Image.asset(
                        ImageStyle.newArticle,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
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
                      Text(
                        '03/30/022',
                        style: TextStylesCustom.textStyles_12.apply(
                          color: ColorStyle.primaryColor_1570A5,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      controller.newsData[index]['title'] != null ?
                      Text(
                        '${controller.newsData[index]['title']}',
                        style: TextStylesCustom.textStyles_14
                            .apply(color: Colors.black, fontWeightDelta: 1),
                      ):
                      Text(
                        'Lorem ipsum dolor sit amet ',
                        style: TextStylesCustom.textStyles_14
                            .apply(color: Colors.black, fontWeightDelta: 1),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      controller.newsData[index]['content'] != null ?
                      SizedBox(
                        height: 48,
                        child: Html(
                            style: {

                              "body": Style(margin: Margins.zero, padding: EdgeInsets.zero,),
                              '#': Style(
                                maxLines: 3,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                              'p':Style.fromTextStyle(TextStylesCustom.textStyles_13.apply(
                                color: ColorStyle.grey_5E6D77,
                              )),
                            },
                            data: controller.newsData[index]['content']
                        ),
                      ):
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
                        style: TextStylesCustom.textStyles_13.apply(
                          color: ColorStyle.grey_5E6D77,
                        ),
                      ),
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
