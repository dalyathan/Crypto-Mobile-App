import 'package:crypto_mobile_app/painters/common/house.dart';
import 'package:flutter/material.dart';

class HouseIcon extends StatelessWidget {
  final double width;
  const HouseIcon({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.9;
    return CustomPaint(
      painter: HousePainter(),
      size: Size(width, width / aspectRatio),
    );
  }
}
