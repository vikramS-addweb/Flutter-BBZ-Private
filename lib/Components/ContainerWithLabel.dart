import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerWithLabel extends StatelessWidget {
  const ContainerWithLabel(
      {
        Key? key,
        this.firstText = 'first text',
        this.secondText = '*',
        this.hintText = 'hintText',
        this.isError = false,
        this.colorhintText,
        this.colorBorder,
      }) : super(key: key);

  final String? firstText;
  final String? secondText;
  final String? hintText;
  final bool? isError;
  final Color? colorhintText;
  final Color? colorBorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              firstText!,
              style: TextStylesCustom.textStyles_14,
            ),
            Text(
              secondText!,
              style: TextStylesCustom.textStyles_14
                  .apply(color: ColorStyle.red_ED0925),
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        !isError! ?
        Container(
          width: Get.size.width,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            border: Border.all(color: ColorStyle.grey_DAE1E7),
            borderRadius: BorderRadius.circular(4)
          ),
          child:Text( hintText!, style: TextStylesCustom.textStyles_14.apply(color: colorhintText),)
          ,
        ):
        Container(
          width: Get.size.width,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
              border: Border.all(color: ColorStyle.white_FAFAFA),
              borderRadius: BorderRadius.circular(4)
          ),
          child:Text( hintText!, style: TextStylesCustom.textStyles_14.apply(color: colorhintText),)
          ,
        )
      ],
    );
  }
}
