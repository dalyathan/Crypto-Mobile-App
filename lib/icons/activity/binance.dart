import 'package:crypto_mobile_app/theme.dart';

import '../../painters/activity/binance_coin.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class BinanceCoinIcon extends StatelessWidget {
  final double size;
  const BinanceCoinIcon({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 1;
    double borderRadius = size * 0.2;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: MyTheme.mildYellowish),
      child: CustomPaint(
        size: Size(size * aspectRatio, size),
        child: Transform.rotate(
          angle: -atan(aspectRatio),
          child: CustomPaint(
              size: Size(size * aspectRatio, size),
              painter: BinanceCoinPainter()),
        ),
      ),
    );
  }
}
