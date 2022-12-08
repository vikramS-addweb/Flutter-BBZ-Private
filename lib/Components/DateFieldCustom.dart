import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'TextFieldCustom.dart';
import '../Styles/ImageStyle.dart';
import './PickerCustom.dart';

class DateFieldCustom extends StatelessWidget {
  const DateFieldCustom({Key? key, this.firstText = 'hint text', this.secondText = '*', this.hintText = 'hintText', this.controller}) : super(key: key);
  final String? firstText;
  final String? secondText;
  final String? hintText;
  final TextEditingController? controller;

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
            TextFormFieldOutline(controller: controller, hintText: hintText!, radiusBorder: 4, colorBoder: ColorStyle.grey_DAE1E7, padding: const EdgeInsets.only(left: 14),colorHint: ColorStyle.grey_DAE1E7,textStyle: TextStylesCustom.textStyles_14.apply(color: ColorStyle.grey_5E6D77),),
            Positioned(
                top: 13,
                right: 25,
                child: InkWell(
                    onTap: () async {
                      controller!.text =
                      await PickerCustom.datePicker(
                        dateFormat: 'yyyy-MM-dd',
                        selectedDate: DateTime.parse('2006-12-31 20:18:04Z'),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.parse('2006-12-31'),
                      );
                      debugPrint(
                          controller!.text);
                    },
                    child: SizedBox(width: 20, height: 21 , child: Image.asset(ImageStyle.calendar, color: ColorStyle.primaryColor_1570A5, fit: BoxFit.fill,),)))
          ],
        )
      ],
    );
  }
}