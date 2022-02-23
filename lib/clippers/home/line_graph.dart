import 'dart:math';

import 'package:flutter/material.dart';

class LineGraphClipper extends CustomClipper<Path> {
  final Map<String, double> graphValues;
  late Size size;

  LineGraphClipper(this.graphValues);
  @override
  Path getClip(Size size) {
    this.size = size;
    var newX = standardizedX();
    var newY = standardizedY();
    Path clippingPath = Path();
    List<Offset> pathOffsets = [];
    pathOffsets.add(Offset(0, 0));
    for (int pointIndex = 0; pointIndex < newY.length; pointIndex++) {
      pathOffsets.add(Offset(newX[pointIndex], newY[pointIndex]));
    }
    pathOffsets.add(Offset(size.width, newY[newY.length - 1]));
    pathOffsets.add(Offset(size.width, 0));
    return clippingPath..addPolygon(pathOffsets, true);
  }

  List<double> standardizedY() {
    List<double> currentVvalues = List<double>.from(graphValues.values);
    double maxYValues = currentVvalues.reduce(max);
    return List<double>.generate(currentVvalues.length,
        (index) => (currentVvalues[index] / maxYValues) * size.height);
  }

  List<double> standardizedX() {
    int numofDays = graphValues.keys.length;
    return List<double>.generate(
        numofDays, (index) => (index / numofDays) * size.width);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => oldClipper != this;
}
