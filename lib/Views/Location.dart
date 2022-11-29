
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Styles/TextStyles.dart';
import '../Utils/Global.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/ColorStyle.dart';


class Location extends StatefulWidget {
  final String urlCustom;
  const Location({Key? key, this.urlCustom = 'https://www.sprachtestcenter.de/page/locations'}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
   late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // extendBodyBehindAppBar: true,
      appBar: AppBarStyle(
        title: 'Location',
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
        child: WebView(
          initialUrl: widget.urlCustom,
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          backgroundColor: const Color(0x00000000),
          onWebViewCreated: (WebViewController webViewController) {
              this._webViewController = webViewController;
          },
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
            showLoaderGetX();
          },
          // onPageFinished: (String url) {
          //   debugPrint('Page finished loading: $url');
          //   hideLoader();
          // },

          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');

            // Removes header and footer from page
            // _webViewController
            //     .evaluateJavascript("javascript:(function() { " +
            //     "var head = document.getElementsByTagName('header')[0];" +
            //     "head.parentNode.removeChild(head);" +
            //     "var footer = document.getElementsByTagName('footer')[0];" +
            //     "footer.parentNode.removeChild(footer);" +
            //     "})()")
            //     .then((value) => debugPrint('Page finished loading Javascript'))
            //     .catchError((onError) => debugPrint('$onError'));

            _webViewController.runJavascript(
                "document.getElementsByClassName('bravo_header')[0].style.display='none'");
            _webViewController.runJavascript(
                "document.getElementsByClassName('bravo_footer')[0].style.display='none'");
            // _webViewController.runJavascript(
            //     "document.getElementsByTagName('h1')[0].style.display='none'");
            _webViewController.runJavascript(
                "document.getElementsByTagName('h1')[0].parentNode.removeChild(document.getElementsByTagName('h1')[0])");
            hideLoader();
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
