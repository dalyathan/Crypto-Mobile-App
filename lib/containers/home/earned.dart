import 'package:flutter/material.dart';

import '../../theme.dart';
import 'button_3d.dart';
import 'price_column.dart';

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
    return Container(
      width: width,
      height: height,
      //color: Colors.amber,
      child: Row(
        children: [
          Button3D(
            arrow: const Icon(
              Icons.south,
              color: Colors.white,
            ),
            buttonColor: MyTheme.blueish,
            size: height,
          ),
          const Spacer(),
          PriceColumn(
              title: 'Earned',
              amount: amount,
              height: height,
              width: width * 0.4)
        ],
      ),
    );
    ;
  }
}
