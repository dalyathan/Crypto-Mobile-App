import 'package:crypto_mobile_app/containers/home/line_graph.dart';
import 'package:flutter/material.dart';

import 'axes.dart';

class Graph extends StatelessWidget {
  final Map<String, double> graphValues;
  final double height;
  final double width;
  const Graph(
      {Key? key,
      required this.graphValues,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int tiles = 5;
    double xAxisHeight = height * 0.125;
    double nthYTileHeight = ((height - xAxisHeight) / (tiles + 1)) * 0.5;
    double xAxisLeftOffset = width * 0.125;
    return Stack(
      children: [
        Axes(
          yValues: List<double>.from(graphValues.values),
          xValues: List<String>.from(graphValues.keys),
          xAxisLeftOffset: xAxisLeftOffset,
          nthYTileHeight: nthYTileHeight,
          xAxisHeight: xAxisHeight,
          height: height,
          width: width,
          tiles: tiles,
        ),
        Positioned(
            top: nthYTileHeight,
            left: xAxisLeftOffset,
            child: LineGraph(
              height: height - (xAxisHeight + nthYTileHeight),
              width: width - xAxisLeftOffset,
              values: graphValues,
            ))
      ],
    );
  }
}
