
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class BGImage extends StatelessWidget {
  const BGImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.mediaQuery.size.width,
      height: Get.mediaQuery.size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/Images/background.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
