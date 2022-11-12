import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Password',
            // textAlign: TextAlign.center,
            // maxLines: 3,
            style: TextStyle(
              color: ColorStyle.black,
            )),
        SizedBox(
          height: 6,
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(fontSize: 14)),
                ),
              ),
              Icon(Icons.remove_red_eye_outlined)
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: ColorStyle.grey)),
        ),
        SizedBox(
          height: 16,
        ),
        Text('Confirm Password',
            // textAlign: TextAlign.center,
            // maxLines: 3,
            style: TextStyle(
              color: ColorStyle.black,
            )),
        SizedBox(
          height: 6,
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter confirm password',
                      hintStyle: TextStyle(fontSize: 14)),
                ),
              ),
              Icon(Icons.remove_red_eye_outlined)
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: ColorStyle.grey)),
        ),
      ],
    );
  }
}

class TextFieldEmailCustom extends StatelessWidget {
  const TextFieldEmailCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Please enter your email so we can send you acode to verify it.',
            // textAlign: TextAlign.center,
            // maxLines: 3,
            style: TextStyle(
              color: ColorStyle.black,
            )),
        SizedBox(
          height: 20,
        ),
        Text('Email',
            textAlign: TextAlign.center,
            // maxLines: 3,
            style: TextStyle(
              color: ColorStyle.black,
            )),
        SizedBox(
          height: 12,
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Your email',
                hintStyle: TextStyle(fontSize: 14)),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: ColorStyle.grey)),
        ),
      ],
    );
  }
}

class TextFieldEmailLoginCustom extends StatelessWidget {
  const TextFieldEmailLoginCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email',
            textAlign: TextAlign.center,
            // maxLines: 3,
            style: TextStyle(
              color: ColorStyle.black,
            )),
        SizedBox(
          height: 12,
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Your email',
                hintStyle: TextStyle(fontSize: 14)),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: ColorStyle.grey)),
        ),
        SizedBox(
          height: 20,
        ),
        Text('Password',
            // textAlign: TextAlign.center,
            // maxLines: 3,
            style: TextStyle(
              color: ColorStyle.black,
            )),
        SizedBox(
          height: 6,
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(fontSize: 14)),
                ),
              ),
              InkWell(
                child: Icon(Icons.remove_red_eye_outlined),
                onTap: () {},
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: ColorStyle.grey)),
        ),
      ],
    );
  }
}

class TextFieldEditClient extends StatelessWidget {
  const TextFieldEditClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 8,),
        TextField(
          decoration: InputDecoration(hintText: 'Client name'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'Email address'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'Mobile number'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'Home phone'),
        ),
        SizedBox(
          height: 22,
        ),
      ],
    );
  }
}

class TextFieldEditClients extends StatelessWidget {
  const TextFieldEditClients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'Address #1'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'Address #2'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'City'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'State/Provicine'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'Zip/Postal Code'),
        ),
      ],
    );
  }
}

class TextFieldEditAccount extends StatelessWidget {
  const TextFieldEditAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('First Name', style: TextStyle(color: ColorStyle.black)),
            Expanded(
              child: TextField(
                textAlign: TextAlign.right,
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: 'John'),
              ),
            ),
          ],
        ),
        Container(
          color: ColorStyle.grey,

          height: 1,
          // width: 120
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Last Name', style: TextStyle(color: ColorStyle.black)),
            Expanded(
              child: TextField(
                textAlign: TextAlign.right,
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: 'Deo'),
              ),
            ),
          ],
        ),
        Container(
          color: ColorStyle.grey,

          height: 1,
          // width: 120
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Email', style: TextStyle(color: ColorStyle.black)),
            Expanded(
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'johndeo@gmail.com'),
              ),
            ),
          ],
        ),
        Container(
          color: ColorStyle.grey,

          height: 1,
          // width: 120
        ),
      ],
    );
  }
}

class TextFieldEditCompny extends StatelessWidget {
  const TextFieldEditCompny({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 8,),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'Company name'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'Phone'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'Company address #1'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'Company address #2'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'City'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'State/Province'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'Zip/Postal Code'),
        ),
        SizedBox(
          height: 22,
        ),
        TextField(
          decoration: InputDecoration(
              // border: InputBorder.none,

              hintText: 'Business #'),
        ),
      ],
    );
  }
}

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
          border: OutlineInputBorder(
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
          border: OutlineInputBorder(
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
