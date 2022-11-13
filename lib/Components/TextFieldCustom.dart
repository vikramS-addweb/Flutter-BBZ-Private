
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';

class TextFieldUnderline extends StatelessWidget {
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

  TextFieldUnderline({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    );
  }
}

class TextFieldUnderlinePrefixText extends StatelessWidget {
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

  TextFieldUnderlinePrefixText({
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
              child: TextField(
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
          )),
        ],
      ),
    );
  }
}

class TextFieldOutline extends StatelessWidget {
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

  TextFieldOutline({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
          fillColor: colorFill,
          contentPadding: padding,

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),
          hintText: hintText,
          hintStyle: textStyle!.apply(color: colorHint)),
      style: textStyle!,
    );
  }
}

class TextFieldPWDOutline extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final String? hintText;
  final Color? colorFill;
  final Color? colorBoder;
  final Color? colorText;
  final Color? colorHint;
  final TextStyle? textStyle;
  final double? radiusBorder;

  const TextFieldPWDOutline({
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
  }) : super(key: key);

  @override
  _TextFieldPWDOutlineState createState() => _TextFieldPWDOutlineState();
}

class _TextFieldPWDOutlineState extends State<TextFieldPWDOutline> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
          suffixIcon: IconButton(
            icon: Icon(
              isObscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: () {
              isObscureText = !isObscureText;
              setState(() {});
            },
          )),
    );
  }
}