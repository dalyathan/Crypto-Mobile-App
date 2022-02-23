import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../../clippers/home/line_graph.dart';

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
    return ClipPath(
      clipper: LineGraphClipper(values),
      child: Container(
        height: height,
        width: width,
        color: MyTheme.grapeColor,
      ),
    );
  }
}
