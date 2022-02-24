import 'package:flutter/material.dart';

import '../../theme.dart';
import 'period_total.dart';

class Earned extends StatelessWidget {
  final double width;
  final double height;
  final double amount;
  const Earned(
      {Key? key,
      required this.width,
      required this.height,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PeriodTotal(
      amount: amount,
      width: width,
      height: height,
      arrowIcon: const Icon(
        Icons.south,
        color: Colors.white,
      ),
      backgroundColor: MyTheme.blueish,
      title: 'Earned',
    );
  }
}
