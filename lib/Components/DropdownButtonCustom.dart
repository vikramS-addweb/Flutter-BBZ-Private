import 'package:bbz/Styles/ColorStyle.dart';
import 'package:bbz/Styles/ImageStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Styles/TextStyles.dart';

class DropdownButtonCustom extends StatefulWidget {
  final Function(String?)? onChanged;

  final double? width;
  final double? height;
  final List? list;
  final EdgeInsets? padding;
  final Color? colorIcon;
  final ImageProvider? icon;
  final TextStyle? textStyle;
  final String? hintText;
  final RxString? controllerValue;

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
        this.controllerValue,
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
                value: widget.controllerValue!.value == '' ? null : widget.controllerValue!.value,
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
                onChanged: (value){
                  setState(() { dropdownValue = value; });
                  widget.controllerValue!.value = value!;
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

class DropdownWithLabel extends StatefulWidget {
   DropdownWithLabel({
    Key? key,
    this.firstText = 'hint text',
    this.secondText = '*',
    // this.hintText = 'hintText',
    // this.ontap,
    this.width = 150,
    this.height = 50,
    this.list,
    // this.dropdownValue = '',
    this.onChanged,
     this.controllerValue,
     // required this.icon,
     // this.onChanged,
     // this.width = 150,
     // this.height = 50,
     // this.list = const ['One', 'Two', 'Three'],
     this.padding = const EdgeInsets.all(0),
     this.colorIcon = Colors.red,
     this.textStyle = const TextStyle(color: Colors.red),
     this.hintText = 'Type your hint text here',
     this.validator,
     this.colorFill = Colors.white,
     this.colorBoder = Colors.black,
     this.colorHint = Colors.grey,
     this.colorText = Colors.black,
     this.radiusBorder = 4.0,
     this.maxLines = 1,
     this.enabled = true,
  }) : super(key: key);

  final String? firstText;
  final String? secondText;
  final RxString? controllerValue;

  // final String? hintText;
  // final Function()? ontap;

  // final Color? colorBG;
  final double? width;
  final double? height;
  final List? list;
  // final String? dropdownValue;
  void Function(String?)? onChanged;

   String? Function(String?)? validator;
   // final Function(String)? onChanged;

   // final Widget? icon;
   final EdgeInsets? padding;
   final Color? colorIcon;
   final TextStyle? textStyle;
   final String? hintText;

   final Color? colorFill;
   final Color? colorBoder;
   final Color? colorText;
   final Color? colorHint;
   final double? radiusBorder;
   final int? maxLines;
   final bool? enabled;

  @override
  State<DropdownWithLabel> createState() => _DropdownWithLabelState();
}

class _DropdownWithLabelState extends State<DropdownWithLabel> {

  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.firstText!,
              style: TextStylesCustom.textStyles_14,
            ),
            Text(
              widget.secondText!,
              style: TextStylesCustom.textStyles_14
                  .apply(color: ColorStyle.red_ED0925),
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        SizedBox(
          width: widget.width,
          height: widget.height,
          // child:
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   decoration: BoxDecoration(
          //       border: Border.all(color: ColorStyle.grey_DAE1E7),
          //       //border of dropdown button
          //       borderRadius: BorderRadius.circular(5)),
            child: DropdownButtonFormField<String>(
              // icon: widget.icon,
              value: widget.controllerValue!.value ==''? null : dropdownValue,
              isExpanded: true,
              elevation: 16,
              style: widget.textStyle,
              validator: widget.validator,
              hint: Text(
                widget.hintText!,
                style: widget.textStyle!.apply(color: ColorStyle.grey_DAE1E7),
                textAlign: TextAlign.center,
              ),
              decoration: InputDecoration(
                  fillColor: widget.colorFill,
                  contentPadding: widget.padding,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.radiusBorder!),
                      borderSide: BorderSide(color: widget.colorBoder!, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.radiusBorder!),
                      borderSide: BorderSide(color: widget.colorBoder!, width: 1)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.radiusBorder!),
                      borderSide: BorderSide(color: widget.colorBoder!, width: 1)
                  ),
                  hintText: widget.hintText,
                  hintStyle: widget.textStyle!.apply(color: widget.colorHint)),
              onChanged: (value) {
                dropdownValue = value;

                setState(() {

                });
              },
              items: widget.list!.map((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  style: widget.textStyle!.apply(color: Colors.black),
                ),
              )).toList(),
            )

            // DropdownButton<String>(
            //   // value: list!.first,
            //   value: dropdownValue,
            //   hint: Padding(
            //     padding: const EdgeInsets.only(left:5.0),
            //     child: Text('Please select', style: TextStylesCustom.textStyles_14.apply(color: ColorStyle.grey_DAE1E7),),
            //   ),
            //   isExpanded: true,
            //   icon: Icon(
            //     Icons.expand_more,
            //     size: 35,
            //     color: ColorStyle.primaryColor_1570A5,
            //   ),
            //   elevation: 16,
            //   style: TextStyle(color: ColorStyle.grey_DAE1E7),
            //   underline: Container(
            //     height: 0,
            //     color: Colors.deepPurpleAccent,
            //   ),
            //   onChanged:
            //       (String? value) {
            //     widget.controllerValue!.value = value!;
            //     // This is called when the user selects an item.
            //     setState(() {
            //       dropdownValue = value!;
            //     });
            //   },
            //   items: widget.list!
            //       .map((e) => DropdownMenuItem<String>(
            //             value: e,
            //             child: Text(e),
            //           ))
            //       .toList(),
            // ),
          ),
        // )
      ],
    );
  }
}


class DropdownFormFieldCustom extends StatefulWidget {
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  final Widget? icon;
  final double? width;
  final double? height;
  final List? list;
  final EdgeInsets? padding;
  final Color? colorIcon;
  final TextStyle? textStyle;
  final String? hintText;

  final Color? colorFill;
  final Color? colorBoder;
  final Color? colorText;
  final Color? colorHint;
  final double? radiusBorder;
  final int? maxLines;
  final bool? enabled;

  DropdownFormFieldCustom(
      {Key? key,
        required this.icon,
        this.onChanged,
        this.width = 150,
        this.height = 50,
        this.list = const ['One', 'Two', 'Three'],
        this.padding = const EdgeInsets.all(0),
        this.colorIcon = Colors.red,
        this.textStyle = const TextStyle(color: Colors.red),
        this.hintText = 'Type your hint text here',
        this.validator,
        this.colorFill = Colors.white,
        this.colorBoder = Colors.black,
        this.colorHint = Colors.grey,
        this.colorText = Colors.black,
        this.radiusBorder = 8.0,
        this.maxLines = 1,
        this.enabled = true,
      }) : super(key: key);

  @override
  State<DropdownFormFieldCustom> createState() => _DropdownFormFieldCustomState();
}

class _DropdownFormFieldCustomState extends State<DropdownFormFieldCustom> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: widget.icon,
      value: dropdownValue,
      isExpanded: true,
      elevation: 16,
      style: widget.textStyle,
      validator: (value) => value == null ? 'field required' : null,
      hint: Text(
        widget.hintText!,
        style: widget.textStyle!.apply(color: ColorStyle.grey_A8B0B5),
        textAlign: TextAlign.center,
      ),
      decoration: InputDecoration(
          fillColor: widget.colorFill,
          contentPadding: widget.padding,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radiusBorder!),
              borderSide: BorderSide(color: widget.colorBoder!, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radiusBorder!),
              borderSide: BorderSide(color: widget.colorBoder!, width: 1)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radiusBorder!),
              borderSide: BorderSide(color: widget.colorBoder!, width: 1)
          ),
          hintText: widget.hintText,
          hintStyle: widget.textStyle!.apply(color: widget.colorHint)),
      onChanged: (value) {
        dropdownValue = value;

        setState(() {

        });
      },
      items: widget.list!.map((e) => DropdownMenuItem<String>(
        value: e,
        child: Text(
          e,
          style: widget.textStyle!.apply(color: Colors.black),
        ),
      )).toList(),
    );
  }
}



