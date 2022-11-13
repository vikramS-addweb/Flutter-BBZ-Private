import '../Styles/ColorStyle.dart';
import '../Styles/SizeStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final Function()? onTap;
  final String? text;

  const ElevatedButtonCustom({
    Key? key,
    this.onTap,
    this.text = "Elevated Button",
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
        fixedSize: Size(MediaQuery.of(context).size.width - 30, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        text!,
        style: TextStylesCustom.textStyles_14.apply(
          fontWeightDelta: 2
        ),
      ),
      onPressed: onTap,
    );
  }
}

class ElevatedButtonCustoms extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final Color? colorBG;
  final Color? colorText;
  final double? width;
  final double? height;

  const ElevatedButtonCustoms({
    Key? key,
    this.onTap,
    this.text = "Elevated Button",
    this.colorBG = Colors.blue,
    this.colorText = Colors.white,
    this.width = 50,
    this.height = 50,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorBG,
        elevation: 0,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        fixedSize: Size(width!, height!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeStyle.size_14),
        ),
      ),
      child: Text(
        text!,
        style: TextStyle(
          color: ColorStyle.secondryColor,
        ),
      ),
      onPressed: onTap,
    );
  }
}