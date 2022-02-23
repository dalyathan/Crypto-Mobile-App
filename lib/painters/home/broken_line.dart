import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';

class BrokenLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashLength = size.width * 0.005;
    double gap = size.width * 0.01;
    Paint brush = Paint()
      ..color = MyTheme.grapeColor
      ..strokeWidth = size.height;
    Offset drawPoint = Offset(0, size.height * 0.5);
    while (drawPoint.dx < size.width) {
      canvas.drawLine(drawPoint, drawPoint.translate(dashLength, 0), brush);
      drawPoint = drawPoint.translate(gap, 0);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
