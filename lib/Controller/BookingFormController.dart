import 'package:bbz/Views/PersistentBottomNavBarCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';
import '../Views/PersistentBottomNavBarCustom.dart';
import '../Utils/Constant.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import './ExamDetailController.dart';
import '../Views/BookingConfirmation.dart';
import 'package:http/http.dart' as http;

class BookingFormController extends GetxController {
  void initMethods() {
    reset();
    Future.delayed(const Duration(microseconds: 100), () {
      getUserDetails();
    });
  }

  String endpoint = 'api/register-exam';

  final examDetailController = Get.put(ExamDetailController());

  Rx<File> image = File('').obs;
  RxString imageURL = ''.obs;

  RxString paymentMethod = ''.obs;
  RxBool termsAndCondition = false.obs;
  RxBool privacyPolicy = false.obs;
  RxBool secondTerm = false.obs;
  RxBool salutationError = false.obs;
  RxBool motherToungueError = false.obs;
  RxBool countryError = false.obs;
  RxBool paymentError = false.obs;
  RxBool termsError = false.obs;
  RxBool privacyError = false.obs;
  RxBool agreementError = false.obs;

  //drowpdown variables
  RxString event_id = ''.obs;
  RxString salutation = ''.obs;
  Rx<TextEditingController> academic_title = TextEditingController().obs;
  Rx<TextEditingController> birth_date = TextEditingController().obs;
  Rx<TextEditingController> first_name = TextEditingController().obs;
  Rx<TextEditingController> last_name = TextEditingController().obs;
  Rx<TextEditingController> identification_number = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  RxString birthDate = ''.obs;
  Rx<TextEditingController> birth_place = TextEditingController().obs;
  Rx<TextEditingController> country_of_birth = TextEditingController().obs;

  RxString motherToungue = ''.obs;
  Rx<TextEditingController> telephone = TextEditingController().obs;
  Rx<TextEditingController> mobile = TextEditingController().obs;

  //address fields
  Rx<TextEditingController> co = TextEditingController().obs;
  Rx<TextEditingController> street = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> postal_code = TextEditingController().obs;
  RxString country = ''.obs;
  RxString countryCode = ''.obs;

  //booking confirmation variables
  RxString amount = ''.obs;
  RxString code = ''.obs;

// -----------------------------------------------------Book exam ----------------------------------->
  registerExam() async {
    print(examDetailController.examDetailData.value['id']);
    print(salutation.value);
    print(academic_title.value.text);
    print(first_name.value.text);
    print(last_name.value.text);
    print(identification_number.value.text);
    print(email.value.text);
    print(birth_date.value.text);
    print(birth_place.value.text);
    print(country_of_birth.value.text);
    print(motherToungue.value);
    print(telephone.value.text);
    print(mobile.value.text);
    print(co.value.text);
    print(street.value.text);
    print(city.value.text);
    print(postal_code.value.text);
    print(country.value);
    print(paymentMethod.value);
    print(termsAndCondition.value);
    print(privacyPolicy.value);
    print(secondTerm.value);

    // reset();
    //----------------------------------------------Signup api----------------------------------->
    // if(kTOKENSAVED == ''){
    //
    //   final params = {
    //     'first_name': first_name.value.text,
    //     'last_name': last_name.value.text,
    //     'email': email.value.text,
    //     'password': mobile.value.text,
    //     'phone': mobile.value.text,
    //     'term': 'true'
    //   };
    //
    //   final response = await API.instance.post(endPoint: 'api/signup', params: params);
    //
    //   debugPrint(response.toString());
    //
    //   if (response!.isNotEmpty) {
    //       if(response!['error'] != null){
    //         response['error'].toString().showError();
    //       }else{
    //         response['message'].toString().showSuccess();
    //       }
    //   }
    // }

    //----------------------------------------------Booking form api----------------------------->

    // if (image.value.path.isEmpty) {
    //   "ID Proof Image is required".showError();
    // } else {
       uploadImage();

      final params = {
        '_method': 'post',
        'id_proof': image.value.path,
        'email': email.value.text,
        'event_id': '${examDetailController.examDetailData.value['id']}',
        'salutation': salutation.value,
        'academic_title': academic_title.value.text,
        'first_name': first_name.value.text,
        'last_name': last_name.value.text,
        'identification_number': (identification_number.value.text).trim(),
        'birth_date': birth_date.value.text,
        'birth_place': birth_place.value.text,
        'country_of_birth': country_of_birth.value.text,
        'mother_tongue': motherToungue.value,
        'tele_phone': telephone.value.text,
        'phone': mobile.value.text,
        'c/o': co.value.text,
        'address_line_1': first_name.value.text,
        'street': street.value.text,
        'city': city.value.text,
        'zip_code': postal_code.value.text,
        'country': country.value,
        'payment_gateway': paymentMethod.value,
        'term_conditions_1': '${termsAndCondition.value}',
        'term_conditions': '${privacyPolicy.value}',
        'term_conditions_2': '${secondTerm.value}'
      };

      final response =
          await API.instance.post(endPoint: endpoint, params: params);
      print(response);

      if (response!.isNotEmpty) {
        debugPrint(response.toString());
        // response['message'].toString().showSuccess();
        if (response['status'] == 1) {
          if (response['message'].toString() ==
              'You Booking has been processed successfully.Redirect To Payment') {
            "Your Booking has been processed successfully.Redirect To Payment"
                .tr
                .showSuccess();
          } else {
            response['message'].toString().showSuccess();
          }
          event_id.value = response['event_id'].toString();
          amount.value = response['amount'].toString();
          code.value = response['code'].toString();
          print('hellow hterher');
          
        if (paymentMethod.value == 'paypal') {
          usePaypal();
        } else {
          useStripe();
        }
        } else if (response['message'] != null) {
          if (response['message'].toString() == 'Email already exists') {
            "Email already exists".tr.showError();
          } else {
            response['message'].toString().showError();
          }
        }else if(response['errors'] != null){
          response['errors'].toString().showError();
        }else{
          debugPrint('Booking form error: '+ response.toString());
        }
        // final response1 = await API.instance.get(endPoint: 'api/profile');
        // print(response1);
        //
        // if (response1!.isNotEmpty) {
        //   dictUserSaved = response;
        // }

        // navigateToBack(Get.context);
      }
    // }
  }

  // -------------------------------------------upload image------------------------------------->

  uploadImage() async {
    print("img print");
    print(image.value.path.isEmpty);
    final params = {
      '_method': 'post',
    };
print(image.value.path);
    final response = await API.instance.postImage(
      endPoint: "api/bookingImage",
      params: params,
      fileParams: "id_proof",
      file: image.value,
    );

    if (response!.isNotEmpty) {
      if (response['message'].toString() == 'Image Uploaded') {
        "Image Uploaded".tr.showSuccess();
      } else {
        response['message'].toString().showSuccess();
      }
    }
  }

// ....................................................Get logged in User details ............------------------>
  getUserDetails() {
    debugPrint('token ${kTOKENSAVED}');
    debugPrint('endpoint $endpoint');
    if (kTOKENSAVED != '') {
      first_name.value.text = dictUserSaved['first_name'];
      last_name.value.text = dictUserSaved['last_name'];
      email.value.text = dictUserSaved['email'];
      mobile.value.text = dictUserSaved['phone'] != null
          ? dictUserSaved['phone'].toString().replaceAll('-', '')
          : '';
      endpoint = 'api/auth-register-exam';
    } else {
      endpoint = 'api/register-exam';
    }
    debugPrint('endpoint $endpoint');
  }

  // --------------------------------------------------------Reset variables---------------------------------------->
  reset() {
    salutation.value = '';
    academic_title.value.text = '';
    first_name.value.text = '';
    last_name.value.text = '';
    identification_number.value.text = '';
    email.value.text = '';
    birth_date.value.text = '';
    birth_place.value.text = '';
    country_of_birth.value.text = '';
    motherToungue.value = '';
    telephone.value.text = '';
    mobile.value.text = '';
    image.value = File('');
    imageURL.value = '';
    co.value.text = '';
    street.value.text = '';
    city.value.text = '';
    postal_code.value.text = '';
    country.value = '';
    paymentMethod.value = '';
    termsAndCondition.value = false;
    privacyPolicy.value = false;
    secondTerm.value = false;
  }

  
  Future<String?> fetchPaymentIntent() async {
    try {
      http.Response response = await http.post(
          Uri.parse("https://bbzstage.addwebprojects.com/api/paymentIntent"),
          body: {
            "email": email.value.text,
            "name": '${first_name.value.text} ${last_name.value.text}',
            "phone": mobile.value.text,
            "currency": 'EUR',
            "address": street.value.text,
            "postal_code": postal_code.value.text,
            "country": countryCode.value,
            "city": city.value.text,
            "amount": amount.value,
            'line1': "line1"
          });
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['clientSecret'];
      } else {
        'Error ${response.statusCode.toString()}';
        return null;
        
      }
    } catch (e) {
      e.toString().showError();
    }

    return null;
  }

  // -------------------------------------------------------Booking confimation api------------------------------------>
  bookingConfirm() async {
    final params = {
      'amount': amount.value,
      'code': code.value,
      'event_id': '${examDetailController.examDetailData.value['id']}'
    };

    final response = await API.instance
        .post(endPoint: 'api/confirm/:gateways', params: params);
    print(response);

    if (response!.isNotEmpty) {
      // response['message'].toString().showSuccess();
      if (response['message'] != null) {
        if (response['message'].toString() == 'Payment Successfully Done') {
          "Payment Successfully Done".tr.showSuccess();
        } else {
          response['message'].toString().showSuccess();
        }
        BookingConfirmation(
          code: code.value,
        ).navigateToCustom(Get.context);
      } else if (response['errors'] != null) {
        response['errors'].toString().showSuccess();
      }
    }
  }
    void usePaypal() {
    Get.to(() => UsePaypal(
        sandboxMode: true,
        clientId:
            "AXEu7yfDuX_iWlKKvD25YLqe-YP5dWUcaEfgQZS-GpwjYPcNfHgxVUxZGOhzy6Uz-wpnkjavMTdrkT1n",
        secretKey:
            "EAFFLldjnX0wIQX6oJVIYZ9TZe1MulpmC65RkrBQ99OaNW5vvBmA3EgotzhJzGf3FomfxInoJ0FI79TW",
        returnURL: "https://samplesite.com/return",
        cancelURL: "https://samplesite.com/cancel",
        transactions: [
          {
            "amount": {
              "total": amount.value,
              "currency": 'EUR',
              "details": {
                "subtotal": amount.value,
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                {
                  "name": '${first_name.value.text} ${last_name.value.text}',
                  "quantity": 1,
                  "price": amount.value,
                  "currency": 'EUR'
                }
              ],

              // shipping address is not required though
              // "shipping_address": {
              //   "recipient_name": "Jane Foster",
              //   "line1": "Travis County",
              //   "line2": "",
              //   "city": "Austin",
              //   "country_code": "US",
              //   "postal_code": "73301",
              //   "phone": "+00000000",
              //   "state": "Texas"
              // },
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          // "Payment Successful".showSuccess();
          print("onSuccess: $params");
          reset();
          bookingConfirm();
        },
        onError: (error) {
          "$error".showError();
          print("onError: $error");
        },
        onCancel: (params) {
          '$params'.showError();
          print('cancelled: $params');
        }));
  }

  void useStripe() async {
    try {
      var paymentIntentData = await fetchPaymentIntent();
      // var paymentIntentData = await createPaymentIntent('1000', 'EUR', 'name' ,'ET','city','1000','line1');
      print('paymeny intent data');
      print(paymentIntentData);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Prospects',
          customerId: null,
          paymentIntentClientSecret: paymentIntentData,
          customerEphemeralKeySecret: null,

          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'INR',
            testEnv: true,
          ),
          // applePay: const PaymentSheetApplePay(
          //   merchantCountryCode: 'DE',
          // ),
        ));
        print('hi');
        displayPaymentSheet();
      }
    } on StripeConfigException catch (e) {
      print(e.message);
      e.toString().showError();
    }
  }

  void displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      // Get.snackbar('Payment', 'Payment Successful',
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.green,
      //     colorText: Colors.white,
      //     margin: const EdgeInsets.all(10),
      //     duration: const Duration(seconds: 2));

      reset();
      bookingConfirm();
    } on Exception catch (e) {
      if (e is StripeException) {
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        print("Unforeseen error: ${e}");
      }
    } catch (e) {
      print('sheet error');
      print("exception:$e");
    }
  }
}
