import 'dart:math';

import 'package:flutter/material.dart';

class ActivityPainter extends CustomPainter {
  late Paint brush;
  late Canvas myCanvas;
  @override
  void paint(Canvas canvas, Size size) {
    myCanvas = canvas;
    brush = Paint();
    brush.color = Colors.white;
    brush.strokeWidth = 3;
    brush.style = PaintingStyle.stroke;
    var gapAndRadiusRatio = 0.175;

    Offset A = Offset(size.width * gapAndRadiusRatio, 0);
    Offset B = Offset(A.dx, size.height * gapAndRadiusRatio);
    Offset C = Offset(A.dx, 2 * size.height * gapAndRadiusRatio);
    Offset D = Offset(size.width * (1 - gapAndRadiusRatio), C.dy);
    Offset E = Offset(D.dx, B.dy);
    Offset F = Offset(D.dx, A.dy);
    Offset G = Offset(0, size.height * (1 - gapAndRadiusRatio));
    Offset H = Offset(A.dx, size.height);
    Offset I = Offset(D.dx, size.height);
    Offset J = Offset(size.width, G.dy);
    Offset K = Offset(size.width, E.dy);
    Offset L = Offset(size.width, K.dy + size.height * 0.08);
    Offset M = Offset(L.dx, 3 * size.height * gapAndRadiusRatio);
    Offset O = Offset(0, size.height * gapAndRadiusRatio);
    Offset P = Offset(
        D.dx,
        size.height *
            (2 * gapAndRadiusRatio + (1 - 2 * gapAndRadiusRatio) / 2));
    Offset topRightCorner = Offset(size.width, size.height * 0.05);
    Offset middleRightCorner =
        Offset(size.width, 2 * size.height * gapAndRadiusRatio);
    Offset bottomRightCorner = Offset(size.width, size.height);
    Offset bottomLeftCorner = Offset(0, size.height);
    myCanvas.drawArc(
        Rect.fromCircle(center: B, radius: size.height * gapAndRadiusRatio),
        -pi / 2,
        -pi,
        false,
        brush);
    myCanvas.drawLine(B, E, brush);
    myCanvas.drawLine(A, F, brush);
    myCanvas.drawLine(C, D, brush);
    makeCurveBetweeenIntersections(F, topRightCorner, L);
    makeCurveBetweeenIntersections(D, middleRightCorner, M);
    myCanvas.drawLine(M, J, brush);
    makeCurveBetweeenIntersections(J, bottomRightCorner, I);
    myCanvas.drawLine(I, H, brush);
    makeCurveBetweeenIntersections(H, bottomLeftCorner, G);
    myCanvas.drawLine(G, O, brush);
    myCanvas.drawCircle(P, size.height * 0.025, brush);
  }

  makeCurveBetweeenIntersections(Offset from, Offset control, Offset to) {
    Path curvedCorner = Path();
    curvedCorner.moveTo(from.dx, from.dy);
    curvedCorner.quadraticBezierTo(control.dx, control.dy, to.dx, to.dy);
    myCanvas.drawPath(curvedCorner, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
