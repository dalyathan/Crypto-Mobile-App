import 'dart:math';

import 'package:crypto_mobile_app/containers/activity/card.dart' as activity;
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final double height;
  const Cards({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double secondCardRotationAngle = pi / 10;
    double cardTopOffset = height * 0.025;
    double cardLeftOffset = size.width * 0.15;
    return Container(
      height: height,
      width: size.width,
      decoration: BoxDecoration(
          border: Border.all(
              width: 5,
              color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0))),
      child: Stack(
        children: [
          Positioned(
            top: cardTopOffset,
            left: cardLeftOffset,
            child: Transform.rotate(
              alignment: Alignment.bottomLeft,
              angle: 2 * secondCardRotationAngle,
              child:
                  activity.Card(width: size.width * 0.4, height: height * 0.75),
            ),
          ),
          Positioned(
            top: cardTopOffset,
            left: cardLeftOffset,
            child: Transform.rotate(
              alignment: Alignment.bottomLeft,
              angle: secondCardRotationAngle,
              child:
                  activity.Card(width: size.width * 0.4, height: height * 0.75),
            ),
          ),
          Positioned(
              top: cardTopOffset,
              left: cardLeftOffset,
              child: activity.Card(
                  width: size.width * 0.4, height: height * 0.75)),
        ],
      ),
    );
  }
}
