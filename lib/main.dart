import 'package:bbz/Views/AboutUs.dart';
import 'package:bbz/Views/BookingDetails.dart';
import 'package:bbz/Views/ContactUs.dart';
import 'package:bbz/Views/HowWeWork.dart';
import 'package:bbz/Views/Profile.dart';
import './Views/WelcomeScreen.dart';
import './Views/SplashScreen.dart';
import './Views/TabbarScreen.dart';
import 'package:flutter/material.dart';
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

  Stripe.publishableKey = 'pk_test_51KizhOSCX1pYzccDD8rNXEZcHl8hv8WoAzOsNv0vDl0IiYQnO1vS9xuI1NjgCsZWQsjzBeCsHasUmM2UtRRAFzYx004PAjsCFM';
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';

  await Stripe.instance.applySettings();

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: ColorStyle.primaryColor_1570A5.toMaterialColor()),
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
              // final paymentMethod = await Stripe.instance.createPaymentMethod(
              //     params: PaymentMethodParams.card(paymentMethodData: NoWebhookPaymentCardFormScreen())
              // );
            },
            child: Text('pay'),
          )
        ],
      ),
    );
  }
}


