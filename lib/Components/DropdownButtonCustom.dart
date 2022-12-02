import 'package:bbz/Styles/ColorStyle.dart';
import 'package:bbz/Styles/ImageStyle.dart';
import 'package:flutter/material.dart';
import '../Styles/TextStyles.dart';

class DropdownButtonCustom extends StatefulWidget {
  final Function(String)? onChanged;

  final double? width;
  final double? height;
  final List? list;
  final EdgeInsets? padding;
  final Color? colorIcon;
  final ImageProvider? icon;
  final TextStyle? textStyle;
  final String? hintText;

  DropdownButtonCustom(
      {Key? key,
        this.onChanged,
        this.width = 150,
        this.height = 50,
        this.list = const [{'name' : 'One'}, {'name' : 'Two'}, { 'name':'Three'}],
        this.padding = const EdgeInsets.all(0),
        this.colorIcon = Colors.red,
        this.textStyle = const TextStyle(color: Colors.red),
        this.hintText = 'Type your hint text here',
        required this.icon
      }) : super(key: key);

  @override
  State<DropdownButtonCustom> createState() => _DropdownButtonCustomState();
}

class _DropdownButtonCustomState extends State<DropdownButtonCustom> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      child: Row(
        children: [
          // Icon(
          //   widget.icon,
          //   color: ColorStyle.primaryColor_1570A5,
          //   size: 26,
          // ),
          SizedBox(height:20, width: 26, child: Row(
            children: [
              Image(image: widget.icon!,),
              Expanded(child: SizedBox(width: 6)),
            ],
          )),

          Expanded(
              child: DropdownButton<String>(
                icon: Icon(
                  Icons.expand_more,
                  size: 35,
                  color: widget.colorIcon,
                ),
                value: dropdownValue,
                isExpanded: true,
                elevation: 16,
                style: widget.textStyle,
                hint: Text(
                  widget.hintText!,
                  style: widget.textStyle!.apply(color: ColorStyle.grey_A8B0B5),
                  textAlign: TextAlign.center,
                ),
                underline: Container(
                  height: 0,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (value) {
                  dropdownValue = value;

                  setState(() {

                  });
                },
                items: widget.list!.map((e) => DropdownMenuItem<String>(
                  value: e['name'],
                  child: Text(
                    e['name'],
                    style: widget.textStyle!.apply(color: Colors.black),
                  ),
                )).toList(),
              ))
        ],
      ),
    );
  }
}

// class DropdownButtonCustom extends StatelessWidget {
//   final Function(String)? onChanged;
//
//   final double? width;
//   final double? height;
//   final List? list;
//   final String? dropdownValue;
//   final EdgeInsets? padding;
//   final Color? colorIcon;
//   final TextStyle? textStyle;
//
//   DropdownButtonCustom(
//       {Key? key,
//       this.onChanged,
//       this.width = 150,
//       this.height = 50,
//       this.list = const ['One', 'Two', 'Three'],
//       this.dropdownValue, // = 'One',
//       this.padding = const EdgeInsets.all(0),
//       this.colorIcon = Colors.red,
//       this.textStyle = const TextStyle(color: Colors.red)})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       padding: padding,
//       child: Row(
//         children: [
//           Icon(
//             Icons.location_on,
//             color: ColorStyle.primaryColor_1570A5,
//             size: 26,
//           ),
//           const SizedBox(width: 6),
//           Expanded(
//               child: DropdownButton<String>(
//             icon: Icon(
//               Icons.expand_more,
//               size: 35,
//               color: colorIcon,
//             ),
//             value: dropdownValue,
//             isExpanded: true,
//             elevation: 16,
//             style: textStyle,
//             hint: Text(
//               'Select Month',
//               style: textStyle!.apply(color: ColorStyle.grey_A8B0B5),
//               textAlign: TextAlign.center,
//             ),
//             underline: Container(
//               height: 0,
//               color: Colors.deepPurpleAccent,
//             ),
//             onChanged: (value) {
//               // onChanged!(value!);
//             },
//             items: list!
//                 .map((e) => DropdownMenuItem<String>(
//                       value: e,
//                       child: Text(
//                         e,
//                         style: textStyle!.apply(color: Colors.black),
//                       ),
//                     ))
//                 .toList(),
//           ))
//         ],
//       ),
//     );
//   }
// }

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
        SizedBox(
          width: width,
          height: height,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: ColorStyle.grey_DAE1E7),
                //border of dropdown button
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<String>(
              value: list!.first,
              isExpanded: true,
              icon: Icon(
                Icons.expand_more,
                size: 35,
                color: ColorStyle.primaryColor_1570A5,
              ),
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
        )
      ],
    );
  }
}
