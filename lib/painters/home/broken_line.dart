import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';

class BrokenLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashLength = size.width * 0.05;
    Paint brush = Paint()
      ..color = MyTheme.blackish
      ..strokeWidth = size.height;
    Offset drawPoint = Offset(0, size.height * 0.5);
    Path brokenLinePath = Path();
    while (drawPoint.dx < size.width) {
      brokenLinePath.moveTo(drawPoint.dx, drawPoint.dy);
      brokenLinePath.lineTo(drawPoint.dx + dashLength, drawPoint.dy);
      drawPoint = Offset(drawPoint.dx + 2 * dashLength, drawPoint.dy);
    }
    canvas.drawPath(brokenLinePath, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
