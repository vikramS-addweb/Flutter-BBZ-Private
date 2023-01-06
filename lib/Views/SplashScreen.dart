import 'package:bbz/Controller/ExamScreenController.dart';
import 'package:bbz/Styles/ImageStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Views/WelcomeScreen.dart';
import '../Utils/Global.dart';
import 'PersistentBottomNavBarCustom.dart';
import '../Controller/LoginController.dart';
import 'package:bbz/Utils/Constant.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.put(LoginController());
  final examScreen = Get.put(ExamScreenController());
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      final isLoggedIn = controller.checkIsLoggedIn();
       indexSelectedTab.value = 0;
      // if (isLoggedIn) {
      //   indexSelectedTab.value = 0;
      // } else {
      //   indexSelectedTab.value = 1;
      // }

      gotToWelcomeScree(indexSelectedTab.value);
    });

  }

  gotToWelcomeScree(int index) {
    Future.delayed(const Duration(seconds: 3), () {
      // PersistentBottomNavBarCustom(initialIndex: index,).navigateToCustom(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PersistentBottomNavBarCustom(initialIndex: index)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageStyle.background),
            fit: BoxFit.cover,
          ),
        ),
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              ImageStyle.logoBBZ,
              width: 138,
            ),
          ],
        ),
      ),
    );
  }
}
