// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import '../Styles/TextStyles.dart';
// import '../Utils/Global.dart';
//
//
// class AboutUs extends StatefulWidget {
//   final String urlCustom;
//   const AboutUs({Key? key, this.urlCustom = 'https://flutter.dev'}) : super(key: key);
//
//   @override
//   State<AboutUs> createState() => _AboutUsState();
// }
//
// class _AboutUsState extends State<AboutUs> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       // extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leadingWidth: 100,
//         title: Text(
//           'About Us',
//           style: TextStylesCustom.textStyles_20.apply(color: Colors.white, fontWeightDelta: 3),
//         ),
//         leading: ElevatedButton.icon(
//           onPressed: () => Navigator.of(context).pop(),
//           icon: const Icon(
//               Icons.chevron_left
//           ),
//           label: const Text('Back'),
//           style: ElevatedButton.styleFrom(
//             elevation: 0,
//             backgroundColor: Colors.transparent,
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(
//             Radius.circular(10),
//           ),
//           color: Colors.white.withOpacity(0.1),
//         ),
//         child: WebView(
//           initialUrl: widget.urlCustom,
//           javascriptMode: JavascriptMode.unrestricted,
//           gestureNavigationEnabled: true,
//           backgroundColor: const Color(0x00000000),
//           onWebViewCreated: (WebViewController webViewController) {
//
//           },
//           onProgress: (int progress) {
//             debugPrint('WebView is loading (progress : $progress%)');
//           },
//           navigationDelegate: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               debugPrint('blocking navigation to $request}');
//               return NavigationDecision.prevent;
//             }
//             debugPrint('allowing navigation to $request');
//             return NavigationDecision.navigate;
//           },
//           onPageStarted: (String url) {
//             debugPrint('Page started loading: $url');
//             showLoaderGetX();
//           },
//           onPageFinished: (String url) {
//             debugPrint('Page finished loading: $url');
//             hideLoader();
//           },
//         ),
//       ),
//     );
//   }
// }

// ------------------------------------------------------old about us screen---------------------------->
import 'package:bbz/Controller/ExamDetailController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';

import '../Controller/ExamScreenController.dart';
import '../Views/DrawerScreen.dart';
import '../Utils/Constant.dart';
import '../Components/BottomNavBarCustom.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  GlobalKey<ScaffoldState> keyDrawer = GlobalKey();

   @override
  void initState() {
    final examScreenController = Get.find<ExamScreenController>();
     examScreenController.drawerIndex.value = 0;
    super.initState();
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
      backgroundColor: ColorStyle.white_F3F3F3,
      key: keyDrawer,
      drawer: DrawerScreen(),
      // bottomNavigationBar: bottomNavBarCustom(),
      appBar: AppBarStyle(
        title: 'About Us'.tr,
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
        styleTitle: TextStylesCustom.textStyles_23.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  ImageStyle.examBG,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 27,
                      ),
                      Text(
                        'Know Who we are!'.tr,
                        style: TextStylesCustom.textStyles_26.apply(
                          color: Colors.white,
                          // fontWeightDelta: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                Container(
                  // height: 320,
                  width: Get.mediaQuery.size.width,
                  margin: const EdgeInsets.only(top: 95, left: 16, right: 16),
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: ColorStyle.grey_DAE1E7,
                          // spreadRadius: 1,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 16),
                        width: Get.mediaQuery.size.width,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          width: 2,
                          color: ColorStyle.grey_DAE1E7,
                        ))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '''${'The BBZ Language Schools are part of the Kiry Group of Companies, which has been working continuously and successfully in the areas of training, coaching and implementation of activation and placement measures since 1987. As an integration course provider recognized by the Federal Office for Migration and Refugees (BAMF), we offer courses at all levels at our locations in Koblenz, Bonn, Gelsenkirchen and Frankfurt am Main. Our services also include job-related German language support.'.tr}"



${"Whether it's a classic integration course with or without literacy or specifically for second language learners, or job-related German language support - our focus is always on the language learner. With our needs-based German courses, experienced German language specialists specifically promote the basic skills of reading, listening, writing, and speaking.".tr}



${"In addition, we deploy language support staff within various placement-oriented measures, e.g. KomBer (job-related language course with certificate), PerF or Aktivcenter as well as other offers in which the practical use of the German language in a professional context is trained or an initial assessment of German language skills takes place.".tr}''',
                              style: TextStylesCustom.textStyles_12.apply(
                                color: ColorStyle.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
