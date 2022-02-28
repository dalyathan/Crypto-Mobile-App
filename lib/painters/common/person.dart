import 'dart:math';

import 'package:flutter/material.dart';

class PersonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    brush.color = Colors.white;
    brush.strokeWidth = 3;
    brush.style = PaintingStyle.stroke;
    var fullCircleRadii = 0.225;
    var gapBetweenCircles = 0.2;

    canvas.drawCircle(Offset(size.width / 2, size.height * fullCircleRadii),
        size.height * fullCircleRadii, brush);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height),
            radius:
                size.height * (1 - 2 * fullCircleRadii - gapBetweenCircles)),
        0,
        -pi,
        false,
        brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
