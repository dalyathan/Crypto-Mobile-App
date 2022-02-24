import 'package:crypto_mobile_app/containers/home/period_total.dart';
import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';

class Spent extends StatelessWidget {
  final double width;
  final double height;
  final double amount;
  const Spent(
      {Key? key,
      required this.width,
      required this.height,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PeriodTotal(
        title: 'Spent',
        width: width,
        height: height,
        amount: amount,
        arrowIcon: Icon(
          Icons.north,
          color: MyTheme.yellowish,
        ),
        backgroundColor: MyTheme.grapeColor);
  }
}
