import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlurryRRectPainter extends CustomPainter {
  final double borderRadiusRatio;

  BlurryRRectPainter(this.borderRadiusRatio);
  @override
  void paint(Canvas canvas, Size size) {
    var borderRadius = size.height * borderRadiusRatio;
    var thickness = size.width * 0.05;
    Paint brush = Paint()
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke
      // ..blendMode = BlendMode.hue;
      // ..color = Colors.transparent
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, thickness);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromPoints(
                const Offset(0, 0), Offset(size.width, size.height)),
            Radius.circular(borderRadius)),
        brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
