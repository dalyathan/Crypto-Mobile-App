import 'package:flutter/material.dart';

import 'earned.dart';
import 'spent.dart';

class TransactionTypes extends StatelessWidget {
  final VoidCallback graphSpending;
  final VoidCallback graphEarning;
  final double periodSpending;
  final double periodEarning;
  final double width;
  const TransactionTypes(
      {Key? key,
      required this.graphSpending,
      required this.graphEarning,
      required this.periodSpending,
      required this.periodEarning,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double eachHeight = size.height * 0.075;
    double eachWidth = width * 0.45;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: graphSpending,
          child: Spent(
              width: eachWidth, height: eachHeight, amount: periodSpending),
        ),
        InkWell(
          onTap: graphEarning,
          child: Earned(
              width: eachWidth, height: eachHeight, amount: periodEarning),
        ),
      ],
    );
  }
}
