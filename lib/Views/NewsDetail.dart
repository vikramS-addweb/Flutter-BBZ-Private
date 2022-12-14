import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import 'package:intl/intl.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../Utils/Global.dart';
import '../Controller/NewsDetailController.dart';
import '../Utils/Constant.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  NewsDetail({Key? key, required this.id}) : super(key: key);

  final controller = Get.put(NewsDetailController());
  final int id;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        initState: (state){
          controller.initMethods(id);
        },
        init: controller,
        builder: ((controller)=> Obx(() => Scaffold(
          backgroundColor: ColorStyle.white,
          appBar: AppBarStyle(


            title: controller.newsDetailData['title'] ?? 'News Detail'.tr,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: ColorStyle.primaryColor_1570A5,
                size: 30,
              ),
              onPressed: () {
                navigateToBack(context);
              },
            ),
            styleTitle: TextStylesCustom.textStyles_16.apply(
              color: ColorStyle.primaryColor_1570A5,
              fontWeightDelta: 1,
            ),
            elevation: 2,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.newsDetailData['media'] != null && controller.newsDetailData['media']['file_path'] != null?
                
                Image.network(
                  '$kBaseURL_Image${controller.newsDetailData['media']['file_path']}',
                  height: 260,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ):
                 controller.content.value ?
                 
                  Image.asset(
                  ImageStyle.newArticle,
                  height: 260,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ):
                  const SizedBox(),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child:
                      controller.newsDetailData['created_at'] != null ?
                      Text(
                        DateFormat('dd/MM/yyyy').format(DateTime.parse('${controller.newsDetailData['created_at']}')),
                        style: TextStylesCustom.textStyles_12.apply(
                          color: ColorStyle.primaryColor_1570A5,
                        ),
                      )      :
                  const SizedBox(),
                ),
                const SizedBox(
                  height: 9,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child:
                  controller.newsDetailData['contentInEn'] != null ?
                  Html(
                      style: {
                        'p':Style.fromTextStyle(TextStylesCustom.textStyles_13.apply(
                          color: ColorStyle.grey_5E6D77,
                          // backgroundColor: ColorStyle.white_F3F3F3
                        )),
                        "body": Style(margin: Margins.zero, padding: EdgeInsets.zero,),
                      },
                      data:Get.locale.toString().contains('de') ? controller.newsDetailData['contentInDe'] :  controller.newsDetailData['contentInEn'],
                      onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, dom.Element? element)async {
                    //open URL in webview, or launch URL in browser, or any other logic here
                        await launchUrl(Uri.parse(url!));
                      }
                  ):
                  const SizedBox(),
                ),
              ],
            ),
          ),
        ))
        ));
  }
}
