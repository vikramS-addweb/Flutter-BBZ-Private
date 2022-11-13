import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
      padding: const EdgeInsets.all(0),
      percent: (paid / totalPayment > 1.0) ? 1.0 : paid / totalPayment,
      center: Text("\$ ${paid} of \$ ${totalPayment}",
          style: TextStyle(
            color: ColorStyle.white,
          )),
      progressColor:
          (paid / totalPayment > 1.0) ? Colors.red : ColorStyle.secondryColor,
      barRadius: const Radius.circular(10),
    );
  }
}



class ProgressBarCircularCustom extends StatelessWidget {
  String text;
  double progress;
  double total;

  ProgressBarCircularCustom({Key? key, required this.text, required this.progress, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 30,
      lineWidth: 7.0,
      animation: true,
      animationDuration: 1000,
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: ColorStyle.grey_DAE1E7,
      progressColor: ColorStyle.brown_C16D00,
      percent: (progress / total > 1.0) ? 1.0 : progress / total,
      center: Text(
          text,
          style: TextStylesCustom.textStyles_13.apply(
              fontWeightDelta: 2,
              color: ColorStyle.brown_C16D00
          )
      ),
    );
  }
}

// A value of type 'MaterialAccentColor' can't be assigned to a parameter of type 'Animation<Color?>?' in a const constructor. (Documentation)