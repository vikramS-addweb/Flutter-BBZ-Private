import 'package:bbz/Styles/ImageStyle.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';

class TextFormFieldUnderline extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final EdgeInsets? padding;
  final String? hintText;
  final Color? colorFill;
  final Color? colorBoder;
  final Color? colorText;
  final Color? colorHint;
  final TextStyle? textStyle;
  final double? radiusBorder;
  final int? maxLines;
  final String? Function(String?)? validator;

  TextFormFieldUnderline({
    Key? key,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.colorFill = Colors.white,
    this.colorBoder = Colors.black,
    this.colorHint = Colors.grey,
    this.colorText = Colors.black,
    this.textStyle = const TextStyle(),
    this.radiusBorder = 8.0,
    this.maxLines = 1,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: 1,
      decoration: InputDecoration(
          fillColor: colorFill,
          contentPadding: padding,
          border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),
          hintText: hintText,
          hintStyle: textStyle!.apply(color: colorHint)),
      style: textStyle!,
      validator: validator,
    );
  }
}

class TextFormFieldUnderlinePrefixText extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final EdgeInsets? padding;
  final String? prefixText;
  final String? hintText;
  final Color? colorFill;
  final Color? colorBoder;
  final Color? colorText;
  final Color? colorHint;
  final TextStyle? textStyle;
  final double? radiusBorder;
  final int? maxLines;
  final String? Function(String?)? validator;

  TextFormFieldUnderlinePrefixText({
    Key? key,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.prefixText,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.colorFill = Colors.white,
    this.colorBoder = Colors.black,
    this.colorHint = Colors.grey,
    this.colorText = Colors.black,
    this.textStyle = const TextStyle(),
    this.radiusBorder = 8.0,
    this.maxLines = 1,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colorBoder!, width: 0.6))),
      child: Row(
        children: [
          Text(
            prefixText!,
            style: textStyle!,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: colorFill,
              contentPadding: padding,
              hintText: hintText,
              hintStyle: textStyle!.apply(color: colorHint),
            ),
            style: textStyle!,
            validator: validator,
          )),
        ],
      ),
    );
  }
}

class TextFormFieldOutline extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final EdgeInsets? padding;
  final String? hintText;
  final Color? colorFill;
  final Color? colorBoder;
  final Color? colorText;
  final Color? colorHint;
  final TextStyle? textStyle;
  final double? radiusBorder;
  final int? maxLines;
  final String? Function(String?)? validator;
  final bool? enabled;
  final bool? obscureText;
  final Function()? onTap;
  final bool? showCursor;
  final bool readOnly;
  final bool? showDateIcon;

  TextFormFieldOutline({
    Key? key,

    this.controller,
    this.padding = EdgeInsets.zero,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.colorFill = Colors.white,
    this.colorBoder = Colors.black,
    this.colorHint = Colors.grey,
    this.colorText = Colors.black,
    this.textStyle = const TextStyle(),
    this.radiusBorder = 8.0,
    this.maxLines = 1,
    this.validator,
    this.enabled = true,
    this.obscureText = false,
    this.onTap,
    this.showCursor = true,
    this.readOnly = false,
    this.showDateIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      enabled: enabled,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(

        // suffixIcon: Image.asset(ImageStyle.calendar),
        suffixIcon: showDateIcon! ?  Padding(
          padding: const EdgeInsets.only(right:15.0),
          child: Image.asset(ImageStyle.calendar, height: 5,),
        ) : SizedBox(width: 0,),
          suffixIconConstraints: BoxConstraints(maxHeight: 15, minHeight: 15),

          fillColor: colorFill,
          contentPadding: padding,
          errorMaxLines: 2,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),
          hintText: hintText,
          hintStyle: textStyle!.apply(color: colorHint)),
      style: textStyle!,
      validator: validator,
      onTap: onTap,
      showCursor:showCursor,
      readOnly:readOnly,
    );
  }
}

class TextFormFieldPWDOutline extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final String? hintText;
  final Color? colorFill;
  final Color? colorBoder;
  final Color? colorText;
  final Color? colorHint;
  final TextStyle? textStyle;
  final double? radiusBorder;
  final String? Function(String?)? validator;

  const TextFormFieldPWDOutline({
    Key? key,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.hintText,
    this.colorFill = Colors.white,
    this.colorBoder = Colors.black,
    this.colorHint = Colors.grey,
    this.colorText = Colors.black,
    this.textStyle = const TextStyle(),
    this.radiusBorder = 8.0,
    this.validator,
  }) : super(key: key);

  @override
  _TextFormFieldPWDOutlineState createState() =>
      _TextFormFieldPWDOutlineState();
}

class _TextFormFieldPWDOutlineState extends State<TextFormFieldPWDOutline> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText,
      controller: widget.controller,
      style: widget.textStyle!,
      decoration: InputDecoration(
        fillColor: widget.colorFill,
        contentPadding: widget.padding,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radiusBorder!),
            borderSide: BorderSide(color: widget.colorBoder!, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radiusBorder!),
            borderSide: BorderSide(color: widget.colorBoder!, width: 1)),
        hintText: widget.hintText,
        hintStyle: widget.textStyle!.apply(color: widget.colorHint),
      ),
      validator: widget.validator,
    );
  }
}

// ....................................text Field wit label..................................

class TextFormFieldWithLabel extends StatelessWidget {

  TextFormFieldWithLabel(
      {Key? key,
        this.controller,
      this.firstText = 'hint text',
      this.secondText = '*',
      this.hintText = 'hintText',
        this.keyboardType = TextInputType.text,
      this.validator,
        this.enabled = true,
        this.obscureText = false,
        this.onTap,
        this.showCursor = true,
        this.readOnly = false,
        this.showDateIcon = false,
      })
      : super(key: key);
  final TextEditingController? controller;
  final String? firstText;
  final String? secondText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? enabled;
  final bool? obscureText;
  String? Function(String?)? validator;
  final Function()? onTap;
  final bool? showCursor;
  final bool readOnly ;
  final bool? showDateIcon;

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
        TextFormFieldOutline(
          obscureText: obscureText,
          enabled: enabled,
            showCursor:showCursor,
            readOnly:readOnly,
          keyboardType: keyboardType,
          controller: controller,
          hintText: hintText!,
          radiusBorder: 4,
          showDateIcon: showDateIcon,
          colorBoder: ColorStyle.grey_DAE1E7,
          padding: const EdgeInsets.only(left: 14),
          colorHint: ColorStyle.grey_DAE1E7,
          textStyle: TextStylesCustom.textStyles_14
              .apply(color: ColorStyle.grey_5E6D77),
          validator: validator,
          onTap: onTap
        )
      ],
    );
  }
}
