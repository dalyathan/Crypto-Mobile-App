import 'package:flutter/material.dart';

class GraphAxes extends StatelessWidget {
  final List<String> yAxis;
  final List<String> xAxis;
  final double height;
  final double width;
  const GraphAxes(
      {Key? key,
      required this.yAxis,
      required this.xAxis,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
