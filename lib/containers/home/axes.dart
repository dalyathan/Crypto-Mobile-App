import 'package:flutter/material.dart';

import 'yaxis_value.dart';

class Axes extends StatelessWidget {
  final List<double> yValues;
  final List<String> xValues;
  final double height;
  final double width;
  final double nthYTileHeight;
  final double xAxisLeftOffset;
  final double xAxisHeight;
  final int tiles;
  const Axes(
      {Key? key,
      required this.yValues,
      required this.height,
      required this.width,
      required this.xValues,
      required this.nthYTileHeight,
      required this.xAxisLeftOffset,
      required this.xAxisHeight,
      required this.tiles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numofPoints = yValues.length;
    List<double> sortedYValues = yValues..sort();
    sortedYValues.insert(0, 0);
    List<int> nthTiles = List<int>.generate(
        tiles, (index) => (index + 1) * (numofPoints / tiles).floor() - 1);
    nthTiles.insert(0, 0);
    double yAxisHeight = height - xAxisHeight;
    double xAxisWidth = width - xAxisLeftOffset;
    return SizedBox(
      width: width,
      height: height,
      child: Column(children: [
        SizedBox(
          height: yAxisHeight,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: nthTiles.reversed
                  .map((tileValue) => YAxisTile(
                        height: nthYTileHeight,
                        value: sortedYValues[tileValue].ceil(),
                        width: width,
                        xAxisLeftOffset: xAxisLeftOffset,
                      ))
                  .toList()),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: xAxisWidth,
            height: xAxisHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: nthTiles
                  .map((tile) => SizedBox(
                      width: (xAxisWidth / tiles) * 0.6,
                      height: xAxisHeight * 0.5,
                      child: FittedBox(
                          fit: BoxFit.fill, child: Text(xValues[tile]))))
                  .toList(),
            ),
          ),
        )
      ]),
    );
  }
}
