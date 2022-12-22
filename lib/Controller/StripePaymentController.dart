import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StripePaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment(
      {required String amount,
      required String currency,
      required String name,
      required String country,
      required String city,
      required String postalCode,
      required String line1}
      ) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency,name,country,city,postalCode,line1);
      print(paymentIntentData);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Prospects',
          customerId: paymentIntentData!['customer'],
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US',
            testEnv: true,
          ),
          // applePay: const PaymentSheetApplePay(
          //   merchantCountryCode: 'DE',
          // ),
        ));
        displayPaymentSheet();
      }
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      Get.snackbar('Payment', 'Payment Successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2));
    } on Exception catch (e) {
      if (e is StripeException) {
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        print("Unforeseen error: ${e}");
      }
    } catch (e) {
      print("exception:$e");
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency,String name,String country,String city,String postalCode,String line1) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
        'description': 'Software development services',
        'shipping[name]': name,
        'shipping[address][line1]': line1,
        'shipping[address][postal_code]': postalCode,
        'shipping[address][city]': city,
        'shipping[address][state]': 'CA',
        'shipping[address][country]': country
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51KizhOSCX1pYzccDRYPfksOOXreQXtoo2aJ8alvStXPFL43lKbeGEzy79hUAHrHxRoH4wOl8m6Jz2GFXQ4xh8XHO00ZByqA027',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print("===========paid===========");
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
