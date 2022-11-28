import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'TextFieldCustom.dart';
import '../Styles/ImageStyle.dart';

class DateFieldCustom extends StatelessWidget {
  const DateFieldCustom({Key? key, this.firstText = 'hint text', this.secondText = '*', this.hintText = 'hintText'}) : super(key: key);
  final String? firstText;
  final String? secondText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(firstText!, style: TextStylesCustom.textStyles_14,),
            Text(secondText!, style: TextStylesCustom.textStyles_14.apply(color: ColorStyle.red_ED0925),),
          ],
        ),
        const SizedBox(height: 14,),

        Stack(
          children: [
            TextFieldOutline(hintText: hintText!, radiusBorder: 4, colorBoder: ColorStyle.grey_DAE1E7, padding: const EdgeInsets.only(left: 14),colorHint: ColorStyle.grey_DAE1E7,textStyle: TextStylesCustom.textStyles_14.apply(color: ColorStyle.grey_5E6D77),),
            Positioned(
                top: 13,
                right: 25,
                child: SizedBox(width: 20, height: 21 , child: Image.asset(ImageStyle.calendar, color: ColorStyle.primaryColor_1570A5, fit: BoxFit.fill,),))
          ],
        )
      ],
    );
  }
}