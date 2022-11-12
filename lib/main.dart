import 'package:flutter/material.dart';
import 'package:bbz/Styles/TextStyles.dart';
import './Views/WelcomeScreen.dart';
import './Components/AppBarStyle.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Container(child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          title: 'Log In/Sign Up',
          titleColor: Colors.blueAccent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blueAccent,
            ),
            onPressed: () {
              // Get.back();
            },
          ),
        ),
        // AppBarStyle(title: 'Log In/Sign Up', titleColor: Colors.blueAccent),
        body: WelcomeScreen()

        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Text('You have pushed the button this many times:',
        //           style: TextStylesCustom.textStyles_16.apply()),
        //     ],
        //   ),
        // ),
        );
  }
}
