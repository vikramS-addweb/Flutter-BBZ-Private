import 'package:bbz/Views/AboutUs.dart';
import 'package:bbz/Views/BookingDetails.dart';
import 'package:bbz/Views/ContactUs.dart';
import 'package:bbz/Views/HowWeWork.dart';
import 'package:bbz/Views/Profile.dart';
import 'package:flutter/material.dart';
import './Views/WelcomeScreen.dart';
import './Views/SplashScreen.dart';
import './Views/TabbarScreen.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import './Views/News.dart';
import './Views/BookingForm.dart';
import './Views/NewsDetail.dart';
import './Views/ChangePassword.dart';
import './Views/BookingConfirmation.dart';
import './Views/Ticket.dart';
import 'package:bbz/Views/PersistentBottomNavBarCustom.dart';
import 'package:get_storage/get_storage.dart';
import './Views/language.dart';
import './Utils/LocaleString.dart';
import 'package:devicelocale/devicelocale.dart';


void main() async {

  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Future<void> _getCurrentLocale() async {
    if(await GetStorage().read('setLanguage') != null){
      if(await GetStorage().read('setLanguage') == 'english'){
        var local = Locale('en','US');
        Get.updateLocale(local);
      }else{
        var local = Locale('de');
        Get.updateLocale(local);
      }
    }else {
      try {
        final currentLocale = await Devicelocale.currentLocale;
        print((currentLocale != null)
            ? currentLocale
            : "Unable to get currentLocale");
        if (currentLocale!.contains('de')) {
          var local = Locale('de');
          Get.updateLocale(local);
        } else {
          var local = Locale('en', 'US');
          Get.updateLocale(local);
        }
        // setState(() => _currentLocale = currentLocale);
      } on PlatformException {
        print("Error obtaining current locale");
      }
    }
  }

  @override
  initState()  {
    print("initState Called");
    _getCurrentLocale();

  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: ColorStyle.primaryColor_1570A5.toMaterialColor()),
      // home: BookingConfirmation(code: '65F4B64C97C67DEC33AA3354304818',),
      home: SplashScreen(),
    );
  }
}
