import 'package:crypto_mobile_app/painters/home/broken_line.dart';
import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';

class YAxisValue extends StatelessWidget {
  final int value;
  final double width;
  final double height;
  const YAxisValue({
    Key? key,
    required this.value,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dashHeight = height * 0.005;
    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: height * 0.4,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "\$$value",
                style: MyTheme.textStyle.copyWith(
                    color: MyTheme.blackish, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Spacer(),
          value == 0
              ? Container(
                  height: dashHeight, width: width, color: MyTheme.grapeColor)
              : CustomPaint(
                  painter: BrokenLine(),
                  size: Size(width, dashHeight),
                ),
          const Spacer(
            flex: 10,
          ),
        ],
      ),
    );
  }
}
