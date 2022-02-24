import 'package:crypto_mobile_app/painters/home/line_graph.dart';
import 'package:flutter/material.dart';

class LineGraph extends StatelessWidget {
  final Map<String, double> values;
  final double height;
  final double width;
  const LineGraph(
      {Key? key,
      required this.values,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LineGraphPainter(values),
      size: Size(width, height),
    );
  }
}
