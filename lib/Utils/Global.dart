import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../Controller/PersistentNavBarController.dart';
import 'package:get/get.dart';

final controller = Get.put(PersistentNavBarController());

showLoaderGetX() {
  Get.dialog(
    Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 60,
          margin: const EdgeInsets.only(left: 40, right: 40),
          decoration: BoxDecoration(
              color: ColorStyle.primaryColor_1570A5,
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              Container(
                width: 16,
              ),
              Text("Loading ...".tr,
                  style: TextStylesCustom.textStyles_16
                      .apply(color: Colors.white)),
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

hideLoader() {
  Navigator.pop(Get.context!);
}

extension SnackBar on String {
  showError() {
    Get.snackbar(
      "Error!".tr,
      this,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  showSuccess() {
    Get.snackbar(
      "Success!".tr,
      this,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}

goToAnotherScreen(Widget page) {
  GetPage(
    name: "/second",
    page: () => page,
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
    curve: Curves.fastOutSlowIn,
  );
}

extension NavigateCustom on Widget {
  navigateToCustom(context,
      {bool withNavBar = true, bool isNavBarActive = false }) {
    controller.isNavBarActive.value = isNavBarActive;
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: this,
      withNavBar: withNavBar,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );

    // Navigator.push(context, CupertinoPageRoute(builder: (context) => this));
    // Navigator.push(context, MaterialPageRoute(builder: (context) => this));
  }
}

navigateToBack(context) {
  // Navigator.of(context).popUntil((route) {
  //   return route.isActive;
  // });
  // Get.previousRoute
 
  Navigator.pop(context!);
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("Login"),
    onPressed: () {
      navigateToBack(Get.context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Alert!",
      style: TextStylesCustom.textStyles_14.apply(fontWeightDelta: 1),
    ),
    content: Text(
      "Password reset link is sent to your email.",
      style: TextStylesCustom.textStyles_12,
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

registrationColor(DateTime from) {
  // from = DateTime(from.year, from.month, from.day);
  DateTime tenhrLater = from.add(Duration(hours: 10));
  // to = DateTime.now();
  int remainingMinutes = tenhrLater.difference(DateTime.now()).inMinutes;
  print('${tenhrLater.difference(DateTime.now()).inMinutes}');
  if (remainingMinutes <= (24 * 60)) {
    return Colors.red;
  } else if (remainingMinutes > (24 * 60) &&
      remainingMinutes <= (24 * 60 * 5)) {
    return Colors.orange;
  } else {
    return Colors.green;
  }
}

circleColor(value) {
  if (value <= 10) {
    return Colors.red;
  } else if (value > 10 && value <= 30) {
    return Colors.orange;
  } else {
    return Colors.green;
  }
}
