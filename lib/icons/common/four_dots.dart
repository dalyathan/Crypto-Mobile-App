import 'package:crypto_mobile_app/painters/common/four_dots.dart';
import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';

class FourDotsIcon extends StatelessWidget {
  final double height;
  const FourDotsIcon({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.9;
    Color? foregroundColor = IconTheme.of(context).color;
    return CustomPaint(
      painter: FourDotsPainter(MyTheme.grapeColor),
      size: Size(height * aspectRatio, height),
    );
  }
}
