import '../Controller/TabbarScreenController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Styles/ImageStyle.dart';
import '../Views/Exam.dart';
import '../Views/Profile.dart';
import '../Views/WelcomeScreen.dart';
import '../Utils/Constant.dart';



class TabbarScreen extends StatelessWidget {
  TabbarScreen({Key? key}) : super(key: key);

  double iconSize = 24;

  List<Widget> arrBody = [
    const Exam(),
    isLoggedIn ? const Profile() : const WelcomeScreen(),
  ];

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {

    Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
      return {
        '/': (context) {
          return [
            const Exam(),
            const Profile(),
          ].elementAt(index);
        },
      };
    }

    Widget _buildOffstageNavigator(int index) {
      var routeBuilders = _routeBuilders(context, index);

      return Offstage(
        offstage: indexSelectedTab != index,
        child: Navigator(
          key: _navigatorKeys[index],
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name]!(context),
            );
          },
        ),
      );
    }

    return GetBuilder(
      init: TabbarScreenController(),
      builder: (auth) {
        return Obx(() => Scaffold(
              backgroundColor: Colors.white,

              // body: Navigator(
              //   onGenerateRoute: (settings) {
              //     // Widget page = Page1();
              //     //
              //     // if (settings.name == 'page2')
              //     //   page = Page2();
              //
              //     return MaterialPageRoute(builder: (_) => const WelcomeScreen());
              //   },
              // ),

          // body: arrBody[indexSelectedTab.value],

              body: Stack(
                children: arrBody,
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.history_edu_rounded,
                      size: 24,
                      color: (indexSelectedTab.value == 0)
                          ? ColorStyle.primaryColor_1570A5
                          : ColorStyle.grey_5E6D77,
                    ),

                    //       Image.asset(
                    //         ImageStyle.Group1669,
                    // height: 24,
                    //         color: (controller.index.value == 0)
                    //             ? ColorStyle.primaryColor_1570A5
                    //             : ColorStyle.grey,
                    //       ),
                    label: 'Exam',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_circle,
                      size: 24,
                      color: (indexSelectedTab.value == 1)
                          ? ColorStyle.primaryColor_1570A5
                          : ColorStyle.grey_5E6D77,
                    ),

                    //       Image.asset(
                    //         ImageStyle.Group1669,
                    // height: 24,
                    //         color: (controller.index.value == 0)
                    //             ? ColorStyle.primaryColor_1570A5
                    //             : ColorStyle.grey,
                    //       ),
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
                currentIndex: indexSelectedTab.value,
                elevation: 0,
                onTap: (index) {
                  indexSelectedTab.value = index;
                },
              ),
            )
        );
      },
    );
  }
}
