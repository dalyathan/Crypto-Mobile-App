import 'package:flutter/material.dart';

class ButtonShadowPainter extends CustomPainter {
  final double borderRadiusRatio;
  final double smallerRRectHeightRatio;

  ButtonShadowPainter(this.borderRadiusRatio, this.smallerRRectHeightRatio);
  @override
  void paint(Canvas canvas, Size size) {
    Path biggerRRect = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)),
          Radius.circular(size.height * borderRadiusRatio)));
    Path smallerRRect = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromPoints(
              const Offset(0, 0),
              Offset(size.width,
                  size.height * (1 - (1 - smallerRRectHeightRatio) * 0.5))),
          Radius.circular(size.height * borderRadiusRatio)));
    canvas.drawPath(
        Path.combine(PathOperation.difference, biggerRRect, smallerRRect),
        Paint()
          ..color = Colors.black26
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
