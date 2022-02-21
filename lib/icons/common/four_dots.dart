import 'package:crypto_mobile_app/painters/common/four_dots.dart';
import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';

class FourDotsIcon extends StatelessWidget {
  final double width;
  const FourDotsIcon({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.9;
    Color? foregroundColor = IconTheme.of(context).color;
    return CustomPaint(
      painter: FourDotsPainter(foregroundColor ?? MyTheme.grapeColor),
      size: Size(width, width / aspectRatio),
    );
  }
}
