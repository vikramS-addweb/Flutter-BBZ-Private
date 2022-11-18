
import 'package:bbz/Styles/ImageStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Views/WelcomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    gotToWelcomeScree();
  }

  gotToWelcomeScree() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(const WelcomeScreen());
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
            const SizedBox(height: 100,),
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
