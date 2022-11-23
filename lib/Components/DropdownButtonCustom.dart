import 'package:bbz/Styles/ColorStyle.dart';
import 'package:flutter/material.dart';
import '../Styles/TextStyles.dart';

class DropdownButtonCustom extends StatelessWidget {
  final Function()? ontap;
  // final Color? colorBG;
  final double? width;
  final double? height;
  final List? list;
  final String? dropdownValue;

  // final List demoData = ['one', 'two', 'three'];

  DropdownButtonCustom({
    Key? key,
    this.ontap,
    this.width = 150,
    this.height = 50,
    this.list,
    this.dropdownValue = '',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: ColorStyle.grey_DAE1E7), //border of dropdown button
            borderRadius: BorderRadius.circular(5)),
        child: DropdownButton<String>(
          value: list!.first, isExpanded: true,
          icon: Icon(Icons.expand_more,size: 35, color: ColorStyle.primaryColor_1570A5,),
          elevation: 16,
          style: TextStyle(color: ColorStyle.grey_DAE1E7),
          underline: Container(
            height: 0,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            // setState(() {
            //   dropdownValue = value!;
            // });
          },
          items: list!
              .map((e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          ))
              .toList(),
        ),
      ),
    );
  }
}

class DropdownWithLabel extends StatelessWidget {
  const DropdownWithLabel({
    Key? key,
    this.firstText = 'hint text',
    this.secondText = '*',
    // this.hintText = 'hintText',
    this.ontap,
    this.width = 150,
    this.height = 50,
    this.list,
    this.dropdownValue = '',
  }) : super(key: key);

  final String? firstText;
  final String? secondText;
  // final String? hintText;
  final Function()? ontap;
  // final Color? colorBG;
  final double? width;
  final double? height;
  final List? list;
  final String? dropdownValue;

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
    SizedBox(
    width: width,
    height: height,
    child: Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
    border: Border.all(color: ColorStyle.grey_DAE1E7), //border of dropdown button
    borderRadius: BorderRadius.circular(5)),
    child: DropdownButton<String>(
    value: list!.first, isExpanded: true,
    icon: Icon(Icons.expand_more,size: 35, color: ColorStyle.primaryColor_1570A5,),
    elevation: 16,
    style: TextStyle(color: ColorStyle.grey_DAE1E7),
    underline: Container(
    height: 0,
    color: Colors.deepPurpleAccent,
    ),
    onChanged: (String? value) {
    // This is called when the user selects an item.
    // setState(() {
    //   dropdownValue = value!;
    // });
    },
    items: list!
        .map((e) => DropdownMenuItem<String>(
    value: e,
    child: Text(e),
    ))
        .toList(),
    ),
    ),
    )    ],
    );
  }
}