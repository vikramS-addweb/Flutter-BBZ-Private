import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';

class ProgressBarCustom extends StatelessWidget {
  double paid;
  double totalPayment;
  ProgressBarCustom({Key? key, required this.paid, required this.totalPayment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 60,
      animation: true,
      animationDuration: 1000,
      padding: EdgeInsets.all(0),
      percent: (paid / totalPayment > 1.0) ? 1.0 : paid / totalPayment,
      center: Text("\$ ${paid} of \$ ${totalPayment}",
          style: TextStyle(
            color: ColorStyle.white,
          )),
      progressColor:
          (paid / totalPayment > 1.0) ? Colors.red : ColorStyle.secondryColor,
      barRadius: Radius.circular(10),
    );
  }
}
