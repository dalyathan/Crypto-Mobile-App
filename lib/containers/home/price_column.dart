import 'package:flutter/material.dart';

import '../../theme.dart';

class PriceColumn extends StatelessWidget {
  final String title;
  final double amount;
  final double height;
  final double width;
  const PriceColumn(
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
              "\$$amount",
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
