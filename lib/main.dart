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

import 'package:flutter_stripe/flutter_stripe.dart';


void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  Stripe.publishableKey = 'stripePublishableKey';

  runApp(const MyApp());
}
//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: ColorStyle.primaryColor_1570A5.toMaterialColor()),
      // home: BookingForm(),
      home: PaymentScreen(),
      // home: SplashScreen(),
    );
  }
}


// payment_screen.dart
class PaymentScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CardField(
            onCardChanged: (card) {
              print(card);
            },
          ),
          TextButton(
            onPressed: () async {
              // create payment method

              final paymentMethod = await Stripe.instance.createPaymentMethod(
                  params: PaymentMethodParams.card(paymentMethodData: PaymentMethodData())
              );
            },
            child: Text('pay'),
          )
        ],
      ),
    );
  }
}