import 'package:crypto_mobile_app/containers/home/price_column.dart';
import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';

import 'button3d.dart';

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
    return Container(
      width: width,
      height: height,
      //color: Colors.amber,
      child: Row(
        children: [
          Button3D(
            arrow: Icon(
              Icons.north,
              color: MyTheme.yellowish,
            ),
            buttonColor: MyTheme.grapeColor,
            size: height,
          ),
          const Spacer(),
          PriceColumn(
              title: 'Spent',
              amount: amount,
              height: height,
              width: width * 0.4)
        ],
      ),
    );
  }
}
