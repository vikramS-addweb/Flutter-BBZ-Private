

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';


class TextRichCustom extends StatelessWidget {
  final String? textFirst;
  final String? textSecond;
  final Function()? onTap;
  final int? fontWeightdelta;

  const TextRichCustom({Key? key, this.textFirst = 'Text First', this.textSecond = 'Text Second', this.onTap, this.fontWeightdelta=1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStylesCustom.textStyles_14.apply(
        ),

        children: [
          TextSpan(
            text: textFirst,
            // style: TextStylesCustom.textStyles_14
          ),

          TextSpan(
              text: textSecond,
              style: TextStylesCustom.textStyles_14.apply(
                  color: ColorStyle.primaryColor_1570A5,
                  fontWeightDelta: fontWeightdelta!
              ),
            recognizer:  TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
