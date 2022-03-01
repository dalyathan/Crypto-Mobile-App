import 'package:crypto_mobile_app/painters/common/four_dots.dart';
import 'package:flutter/material.dart';

class FourDotsIcon extends StatelessWidget {
  final double height;
  final Color iconColor;
  const FourDotsIcon({Key? key, required this.height, required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.9;
    return CustomPaint(
      painter: FourDotsPainter(iconColor),
      size: Size(height * aspectRatio, height),
    );
  }
}
