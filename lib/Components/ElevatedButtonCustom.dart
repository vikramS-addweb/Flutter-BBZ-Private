
import '../Styles/ColorStyle.dart';
import '../Styles/SizeStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final Size size;
  final TextStyle? styleText;



  const ElevatedButtonCustom({
    Key? key,
    this.onTap,
    this.text = "Elevated Button",
    this.size = const Size(100, 50),
    this.styleText = const TextStyle()
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorStyle.primaryColor_1570A5,
        elevation: 0,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        fixedSize: size,
        // fixedSize: Size(MediaQuery.of(context).size.width - 30, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text!,
        style: styleText,
      ),
    );
  }
}

class ElevatedButtonCustoms extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final TextStyle? styleText;
  final Color? colorBG;
  final Color? colorText;
  final Color? colorBorder;
  final double? radiusBorder;
  final double? width;
  final double? height;
  final int? fontWeight;
  final double? textSize;

  const ElevatedButtonCustoms({
    Key? key,
    this.onTap,
    this.text = "Elevated Button",
    this.styleText,
    this.colorBG = Colors.blue,
    this.colorText = Colors.white,
    this.colorBorder = Colors.white,
    this.radiusBorder = 5,
    this.width = 50,
    this.height = 50,
    this.fontWeight = 2,
    this.textSize = 14,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorBG,
        elevation: 0,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        fixedSize: Size(width!, height!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusBorder!),
          side: BorderSide(color: colorBorder!)
        ),
      ),
      onPressed: onTap,
      child: Text(
        text!,
        style: styleText != null? styleText : TextStylesCustom.textStyles_14.apply(color: colorText, fontWeightDelta: 1),
      ),
    );
  }
}
