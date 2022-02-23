import 'package:flutter/material.dart';

import 'yaxis_value.dart';

class Axes extends StatelessWidget {
  final List<double> yValues;
  final List<String> xValues;
  final double height;
  final double width;
  const Axes(
      {Key? key,
      required this.yValues,
      required this.height,
      required this.width,
      required this.xValues})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int maxTile = 5;
    List<double> sortedYaxis = yValues..sort();
    print('max of list ${sortedYaxis[sortedYaxis.length - 1]}');
    int numofPoints = yValues.length;
    List<int> nthTiles = List<int>.generate(
        maxTile, (index) => (index + 1) * (numofPoints / maxTile).floor() - 1);
    double xAxisHeightRatio = 0.075;
    double yAxisValueRowHeight =
        height * (1 - xAxisHeightRatio) / (maxTile + 1);
    double xAxisOffsetRatio = 0.125;
    double xAxisWidth = width * (1 - xAxisOffsetRatio);
    return Container(
      width: width,
      height: height,
      // color: Colors.amber,
      child: Column(children: [
        ...nthTiles.reversed.map((tile) => YAxisValue(
              height: yAxisValueRowHeight,
              value: yValues[tile].ceil(),
              width: width,
            )),
        YAxisValue(
          height: yAxisValueRowHeight,
          value: 0,
          width: width,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: xAxisWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: nthTiles
                  .map((tile) => SizedBox(
                      width: (xAxisWidth / maxTile) * 0.8,
                      height: height * xAxisHeightRatio,
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
