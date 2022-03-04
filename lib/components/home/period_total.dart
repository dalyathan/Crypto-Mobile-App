import 'package:flutter/material.dart';

import '../common/button3d.dart';
import 'price_column.dart';

class PeriodTotal extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final double amount;
  final Icon arrowIcon;
  final Color backgroundColor;
  const PeriodTotal(
      {Key? key,
      required this.title,
      required this.width,
      required this.height,
      required this.amount,
      required this.arrowIcon,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        children: [
          Button3D(
            icon: SizedBox(
                height: height * 0.6,
                child: FittedBox(fit: BoxFit.fitHeight, child: arrowIcon)),
            buttonColor: backgroundColor,
            size: height,
          ),
          const Spacer(),
          PriceColumn(
              title: title,
              amount: amount,
              height: height,
              width: width * 0.475)
        ],
      ),
    );
  }
}
