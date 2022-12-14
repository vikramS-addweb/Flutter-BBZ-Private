
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Controller/ExamScreenController.dart';
import '../Styles/TextStyles.dart';
import '../Utils/Global.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/ColorStyle.dart';
import '../Views/DrawerScreen.dart';



class Location extends StatefulWidget {
  final String urlCustom;
  Location({Key? key, this.urlCustom = 'https://bbzstage.addwebprojects.com/page/locations'}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
   late WebViewController _webViewController;

   GlobalKey<ScaffoldState> keyDrawer = GlobalKey();


  //   @override
   @override
  Widget build(BuildContext context) {
    return   Scaffold(
      key: keyDrawer,
      drawer: DrawerScreen(),
      backgroundColor: Colors.transparent,
      // extendBodyBehindAppBar: true,
      appBar: AppBarStyle(
        title: 'Location'.tr,
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
        styleTitle: TextStylesCustom.textStyles_20.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
        ),
        elevation: 1,
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white.withOpacity(0.1),
        ),
        child:
        /*WebView(
          initialUrl: widget.urlCustom,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
          },
        ),
        */
        WebView(
          initialUrl: widget.urlCustom,
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          backgroundColor: Colors.white,
          onWebViewCreated: (WebViewController webViewController) {
              _webViewController = webViewController;
              webViewController1 = _webViewController;
          },
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          navigationDelegate: (NavigationRequest request) async {
            if (request.url.startsWith('https://www.google.com/maps/')) {
             var split = request.url.split('/').last;
              MapsLauncher.launchQuery(split);
              return NavigationDecision.prevent;
            }
            if (request.url.startsWith('https://maps.google.com/')) {
              var uri = Uri.parse(request.url);
              var uriQ= uri.queryParameters['q'];
              MapsLauncher.launchQuery(uriQ!);
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to $request');
            return NavigationDecision.navigate;
          },

          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
            showLoaderGetX();
            Timer(const Duration(seconds: 4), () {
              hideLoader();
            });
          },

          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');

            // Removes header and footer from page
            // _webViewController
            //     .evaluateJavascript("javascript:(function() { " +
            //     "var cookiesDiv = document.getElementsByclassName('booking_cookie_agreement')[0];" +
            //     "cookiesDiv.classList.remove('booking_cookie_agreement', 'p-3', 'd-flex', 'fixed-bottom');" +
            //     "cookiesDiv.classList.add('d-none');" +
            //     // "footer.parentNode.removeChild(footer);" +
            //     "})()")
            //     .then((value) => debugPrint('Page finished loading Javascript'))
            //     .catchError((onError) => debugPrint('$onError'));
             _webViewController.runJavascript(
                "document.getElementsByClassName('bravo_header')[0].style.display='none'");
             _webViewController.runJavascript(
                "document.getElementsByClassName('bravo_footer')[0].style.display='none'");
            _webViewController.runJavascript(
                "document.getElementsByTagName('h1')[0].style.display='none'");
            _webViewController.runJavascript(
                "document.getElementsByClassName('booking_cookie_agreement')[0].parentNode.removeChild(document.getElementsByClassName('booking_cookie_agreement')[0])");

           // var xx=  _webViewController.runJavascript(
           //      "document.getElementsByClassName('location-btn btn btn-success w-100')[0].style.display='none'");

            //MapsLauncher.launchQuery('1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA');

            // _webViewController.runJavascript(
            //     "document.getElementsByClassName('fixed-bottom')[0].style.display='none'");


            // _webViewController.runJavascript(
            //   "document.getElementsByClassName('booking_cookie_agreement')[0].classList.remove('booking_cookie_agreement', 'p-3', 'd-flex', 'fixed-bottom').addClass('d-none')"
            // );
            // hideLoader();
          },

        ),

      ),
    );
  }
}

// ------------------------------------------------------------old code for location ------------------------------->

// import 'package:bbz/Utils/Constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../Components/AppBarStyle.dart';
// import '../Styles/ColorStyle.dart';
// import '../Styles/TextStyles.dart';
// import '../Utils/Global.dart';
// import '../Styles/ImageStyle.dart';
// import 'DrawerScreen.dart';
// import '../Controller/LocationController.dart';
//
// class Location extends StatelessWidget {
//   Location({Key? key}) : super(key: key);
//
//   final controller = Get.put(LocationController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: keyDrawer,
//       drawer: DrawerScreen(),
//       appBar: AppBarStyle(
//         title: 'Location',
//         leading: IconButton(
//           icon: Icon(
//             Icons.menu,
//             color: ColorStyle.primaryColor_1570A5,
//             size: 30,
//           ),
//           onPressed: () {
//             keyDrawer.currentState!.openDrawer();
//             // navigateToBack(context);
//           },
//         ),
//         styleTitle: TextStylesCustom.textStyles_20.apply(
//           color: ColorStyle.primaryColor_1570A5,
//           fontWeightDelta: 1,
//         ),
//         elevation: 2,
//       ),
//       body: GetBuilder(
//         init: controller,
//         initState: (state){
//           controller.initMethods();
//         },
//         builder: (controller) {
//           return Obx(()=> SingleChildScrollView(
//             child: Column(
//               children: [
//                 Text(
//                   controller.testing.value,
//                   style: TextStylesCustom.textStyles_18
//                       .apply(fontWeightDelta: 1),
//                 ),
//                 ListView.separated(
//                   padding: const EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
//                   itemBuilder: ((context, index){
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         if(controller.locationData[index].name != null)
//                         Text(
//                           controller.locationData[index].name!,
//                           style: TextStylesCustom.textStyles_18
//                               .apply(fontWeightDelta: 1),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'GutleutstraBe 34-36',
//                           style: TextStylesCustom.textStyles_14
//                               .apply(color: ColorStyle.grey_5E6D77),
//                         ),
//                         Text(
//                           '60329 Frankfurt am Main',
//                           style: TextStylesCustom.textStyles_14
//                               .apply(color: ColorStyle.grey_5E6D77),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           '1hr Ansprechpartner:',
//                           style: TextStylesCustom.textStyles_14
//                               .apply(color: ColorStyle.grey_5E6D77),
//                         ),
//                         Text(
//                           'Herr Wiersch',
//                           style: TextStylesCustom.textStyles_14
//                               .apply(color: ColorStyle.grey_5E6D77),
//                         ),
//                         if(controller.locationData[index].phoneNumber != null)
//                         Text(
//                           'Telefon: ${controller.locationData[index].phoneNumber}',
//                           style: TextStylesCustom.textStyles_14
//                               .apply(color: ColorStyle.grey_5E6D77),
//                         ),
//                         if(controller.locationData[index].email != null)
//                         Row(
//                           children: [
//                             Text(
//                               'E-mail: ',
//                               style: TextStylesCustom.textStyles_14
//                                   .apply(color: ColorStyle.grey_5E6D77),
//                             ),
//
//                             Text(
//                               controller.locationData[index].email!,
//                               style: TextStylesCustom.textStyles_14
//                                   .apply(color: ColorStyle.green_008428),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
// // -------------------------------------------------------Map Container------------------------------------------->
//                         Container(
//                           width: Get.mediaQuery.size.width,
//                           height: 400,
//                           color: ColorStyle.grey_DAE1E7,
//                           child: const Center(
//                             child: Text('location block'),
//                           ),
//                         )
//                       ],
//                     );
//                   }), separatorBuilder: ((context, index){
//                   return const SizedBox(height: 20,);
//                 }),
//                   itemCount: controller.locationData.length,
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                 )
//               ],
//             ),
//           ));
//         },
//       )
//
//
//     );
//   }
// }
//
