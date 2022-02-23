import 'package:crypto_mobile_app/painters/home/broken_line.dart';
import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';

class YAxisValue extends StatelessWidget {
  final double value;
  final double width;
  final double height;
  const YAxisValue(
      {Key? key,
      required this.value,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.6,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "\$$value",
                style: MyTheme.textStyle.copyWith(color: MyTheme.blackish),
              ),
            ),
          ),
          CustomPaint(
            painter: BrokenLine(),
            size: Size(width, height * 0.1),
          )
        ],
      ),
    );
  }
}
