import 'package:flutter/material.dart';

class HousePainter extends CustomPainter {
  late Paint brush;
  late double curveRadius;
  late Size size;
  late Canvas canvas;
  @override
  void paint(Canvas canvas, Size size) {
    curveRadius = 0.15;
    this.size = size;
    this.canvas = canvas;
    brush = Paint();

    brush.color = Colors.white;
    brush.strokeWidth = 3;
    brush.style = PaintingStyle.stroke;
    brush.strokeCap = StrokeCap.round;

    double rectRatio = 0.575;
    double chimneyHeight = 0.05;
    double chimneyWidth = 0.15;

    Offset A = Offset(size.width * 0.5, 0);
    Offset B =
        Offset(size.width * (0.5 - curveRadius), size.width * curveRadius);
    Offset C = Offset(curveRadius * size.width,
        size.height * (1 - rectRatio) - size.width * curveRadius);
    Offset D = Offset(0, size.height * (1 - rectRatio));

    Offset E =
        Offset(0, size.height * (1 - rectRatio) + size.width * curveRadius);
    Offset F = Offset(0, size.height - size.width * curveRadius);
    Offset G = Offset(0, size.height);
    Offset H = Offset(size.width * curveRadius, size.height);

    Offset I = Offset(size.width * (1 - curveRadius), H.dy);
    Offset J = Offset(size.width, G.dy);
    Offset K = Offset(size.width, F.dy);
    Offset L = Offset(size.width, E.dy);

    Offset R = Offset(size.width * (0.5 + curveRadius), B.dy);
    Offset M = Offset(size.width, D.dy);
    Offset N = Offset(size.width * (1 - curveRadius), C.dy);
    double gojoSlope = (R.dy - N.dy) / (R.dx - N.dx);
    Offset P = Offset(R.dx + size.height * chimneyHeight / gojoSlope,
        size.height * chimneyHeight + R.dy);
    Offset Q = Offset(P.dx, size.height * 0.065);
    Offset O = Offset(P.dx + size.width * chimneyWidth,
        P.dy + size.width * chimneyWidth * gojoSlope);

    canvas.drawLine(B, C, brush);
    makeCurveBetweeenIntersections(C, D, E);
    canvas.drawLine(E, F, brush);
    makeCurveBetweeenIntersections(F, G, H);
    canvas.drawLine(H, I, brush);
    makeCurveBetweeenIntersections(I, J, K);
    canvas.drawLine(K, L, brush);
    makeCurveBetweeenIntersections(L, M, N);
    canvas.drawLine(N, O, brush);
    canvas.drawLine(P, Q, brush);
    canvas.drawLine(R, P, brush);
    makeCurveBetweeenIntersections(B, A, R);
    paintTheDots();
  }

  makeCurveBetweeenIntersections(Offset from, Offset control, Offset to) {
    Path curvedCorner = Path();
    curvedCorner.moveTo(from.dx, from.dy);
    curvedCorner.quadraticBezierTo(control.dx, control.dy, to.dx, to.dy);
    canvas.drawPath(curvedCorner, brush);
  }

  paintTheDots() {
    var gapBetweenCircles = 0.1;
    var radius = 0.05;
    var horizontalOffset = 0.425;
    var verticalOffset = 0.525;
    brush.style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width * horizontalOffset, size.height * verticalOffset),
        size.width * radius,
        brush);
    canvas.drawCircle(
        Offset(size.width * (horizontalOffset + radius + gapBetweenCircles),
            size.height * verticalOffset),
        size.width * radius,
        brush);
    canvas.drawCircle(
        Offset(size.width * horizontalOffset,
            size.height * (verticalOffset + radius + gapBetweenCircles)),
        size.width * radius,
        brush);
    canvas.drawCircle(
        Offset(size.width * (horizontalOffset + radius + gapBetweenCircles),
            size.height * (verticalOffset + radius + gapBetweenCircles)),
        size.width * radius,
        brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
