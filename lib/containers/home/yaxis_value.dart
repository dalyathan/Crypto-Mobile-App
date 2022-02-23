import 'package:crypto_mobile_app/painters/home/broken_line.dart';
import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YAxisValue extends StatelessWidget {
  final int value;
  final double width;
  final double height;
  final double xAxisLeftOffset;
  final NumberFormat oCcy = NumberFormat("#,##0.00", "en_US");
  YAxisValue({
    Key? key,
    required this.value,
    required this.width,
    required this.height,
    required this.xAxisLeftOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dashHeight = height * 0.005;
    double gapHeight = height * 0.1;
    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: height - (dashHeight + gapHeight),
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "\$${oCcy.format(value)}",
                style: MyTheme.textStyle.copyWith(
                    color: MyTheme.blackish, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: gapHeight,
          ),
          value == 0
              ? Container(
                  height: dashHeight, width: width, color: MyTheme.grapeColor)
              : CustomPaint(
                  painter: BrokenLine(),
                  size: Size(width, dashHeight),
                ),
        ],
      ),
    );
  }
}
