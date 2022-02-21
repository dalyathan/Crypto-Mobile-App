import 'package:flutter/material.dart';

class FourDotsPainter extends CustomPainter {
  final Color foregroundColor;

  FourDotsPainter(this.foregroundColor);
  @override
  void paint(Canvas canvas, Size size) {
    double dotsRadius = size.width * 0.05;
    Paint brush = Paint()
      ..color = foregroundColor
      ..strokeWidth = 2;
    canvas.drawCircle(Offset(dotsRadius, dotsRadius), dotsRadius, brush);
    canvas.drawCircle(
        Offset(size.width - dotsRadius, dotsRadius), dotsRadius, brush);
    canvas.drawCircle(Offset(size.width - dotsRadius, size.height - dotsRadius),
        dotsRadius, brush);
    canvas.drawCircle(
        Offset(dotsRadius, size.height - dotsRadius), dotsRadius, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
