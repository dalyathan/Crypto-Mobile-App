import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme.dart';

class PriceColumn extends StatelessWidget {
  final String title;
  final double amount;
  final double height;
  final double width;
  final NumberFormat oCcy = NumberFormat("#,##0.00", "en_US");

  PriceColumn(
      {Key? key,
      required this.title,
      required this.amount,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        SizedBox(
          height: height * 0.2,
          child: FittedBox(
            child: Text(
              title,
              style: MyTheme.textStyle.copyWith(
                color: MyTheme.grapeColor,
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 3,
        ),
        SizedBox(
          width: width,
          child: FittedBox(
            child: Text(
              "\$${oCcy.format(amount)}",
              style: MyTheme.textStyle.copyWith(
                color: MyTheme.grapeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
