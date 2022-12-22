import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'TextFieldCustom.dart';
import '../Styles/ImageStyle.dart';
import 'package:get/get.dart';

class CustomError extends StatelessWidget {
  const CustomError(
      {
    Key? key,
        this.text = 'hint text',
      }
      ) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      // height:
      padding: const EdgeInsets.only(top: 10.0, bottom: 13,),
      decoration: BoxDecoration(
        // color: Colors.red,

          border: Border(
              top: BorderSide(color: Colors.red)
          )
      ),
      child: Text(text!, style: TextStylesCustom.textStyles_11.apply(color: Colors.red),),

    );
  }
}