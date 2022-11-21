import '../Controller/TabbarScreenController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Styles/ImageStyle.dart';
import '../Views/Exam.dart';
import '../Views/Profile.dart';
import 'package:custom_top_navigator/custom_scaffold.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({Key? key}) : super(key: key);

  @override
  _TabbarScreenState createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  double iconSize = 24;

  final arrBody = [
    const Exam(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabbarScreenController());

    return CustomScaffold(
      children: arrBody,
      onItemTap: (index) {
        controller.index.value = index;
      },
      scaffold: Scaffold(
        backgroundColor: Colors.white,
        body: arrBody[controller.index.value],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  ImageStyle.test,
                  fit: BoxFit.fill,
                ),
              ),
              label: 'Exam',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  ImageStyle.account,
                  fit: BoxFit.fill,
                ),
              ),
              label: 'Profile',
            ),
          ],
          selectedLabelStyle: TextStylesCustom.textStyles_14.apply(
            fontWeightDelta: 1,
          ),
          unselectedLabelStyle: TextStylesCustom.textStyles_14.apply(
            fontWeightDelta: 1,
          ),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorStyle.primaryColor_1570A5,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          currentIndex: controller.index.value,
          onTap: (index) {
            controller.index.value = index;
          },
        ),
      ),
    );
  }
}




// class TabbarScreen extends StatefulWidget {
//   @override
//   _TabbarScreenState createState() => _TabbarScreenState();
// }

// class _TabbarScreenState extends State<TabbarScreen> {
//   final controller = Get.put(TabbarScreenController());
//
//   int _selectedIndex = 0;
//
//   List<GlobalKey<NavigatorState>> navigatorKeys = [
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//
//     return WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//
//       child: Scaffold(
//           backgroundColor: Colors.white,
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: _selectedIndex,
//             showSelectedLabels: false,
//             showUnselectedLabels: false,
//             items: [
//                   BottomNavigationBarItem(
//                     icon:  Icon(
//                       Icons.history_edu_rounded,
//                       size: 24,
//                       color: (controller.index.value == 0)
//                           ? ColorStyle.primaryColor_1570A5
//                           : ColorStyle.grey_5E6D77,
//                     ),
//                     label: 'Exam',
//                   ),
//                   BottomNavigationBarItem(
//                     label: 'Profile',
//                     icon: Icon(
//                       Icons.account_circle,
//                       size: 24,
//                       color: (controller.index.value == 1)
//                           ? ColorStyle.primaryColor_1570A5
//                           : ColorStyle.grey_5E6D77,
//                     ),
//                   )
//             ],
//             onTap: (index) {
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//           ),
//           body: Stack(
//           children: [
//             _buildOffstageNavigator(1),
//             _buildOffstageNavigator(1),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // void _next() {
//   //   Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
//   // }
//
//   Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
//     return {
//       '/': (context) {
//         return [
//            Exam(),
//           Profile(),
//         ].elementAt(index);
//       },
//     };
//   }
//
//   Widget _buildOffstageNavigator(int index) {
//     var routeBuilders = _routeBuilders(context, index);
//
//     return Offstage(
//       offstage: _selectedIndex != index,
//       child: Navigator(
//         key: navigatorKeys[_selectedIndex],
//         onGenerateRoute: (setting){
//           Widget myroute = Container(
//
//           );
//           if(setting.name == 'Exam'){
//             myroute =   const Exam();
//           }else if(setting.name == 'Profile'){
//             myroute =   const Profile();
//           }
//           return MaterialPageRoute(
//             builder: (_) => myroute,
//           );
//         },
//         // onGenerateRoute: (routeSettings) {
//         //   return MaterialPageRoute(
//         //     builder: (context) => routeBuilders[routeSettings.name]!(context),
//         //   );
//         // },
//       ),
//     );
//   }
// }



// class TabbarScreen extends StatelessWidget {
//   final int? indexSelected;
//
//   TabbarScreen({Key? key, this.indexSelected = 0}) : super(key: key);
//
//   double iconSize = 24;
//
//   final arrBody = [
//     const Exam(),
//     const Profile(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(TabbarScreenController());
//
//     return GetBuilder(
//       init: TabbarScreenController(),
//       builder: (auth) {
//         return Obx(() => Scaffold(
//               backgroundColor: Colors.white,
//               body: arrBody[controller.index.value],
//               bottomNavigationBar: BottomNavigationBar(
//                 items: [
//                   BottomNavigationBarItem(
//                     icon: Icon(
//                       Icons.history_edu_rounded,
//                       size: 24,
//                       color: (controller.index.value == 0)
//                           ? ColorStyle.primaryColor_1570A5
//                           : ColorStyle.grey_5E6D77,
//                     ),
//                     label: 'Exam',
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Icon(
//                       Icons.account_circle,
//                       size: 24,
//                       color: (controller.index.value == 1)
//                           ? ColorStyle.primaryColor_1570A5
//                           : ColorStyle.grey_5E6D77,
//                     ),
//                     label: 'Profile',
//                   ),
//                 ],
//                 selectedLabelStyle: TextStylesCustom.textStyles_14.apply(
//                   fontWeightDelta: 1,
//                 ),
//                 unselectedLabelStyle: TextStylesCustom.textStyles_14.apply(
//                   fontWeightDelta: 1,
//                 ),
//                 type: BottomNavigationBarType.fixed,
//                 selectedItemColor: ColorStyle.primaryColor_1570A5,
//                 unselectedItemColor: Colors.grey,
//                 backgroundColor: Colors.white,
//                 currentIndex: controller.index.value,
//                 onTap: (index) {
//                   controller.index.value = index;
//                 },
//               ),
//             ));
//       },
//     );
//   }
//
// }
