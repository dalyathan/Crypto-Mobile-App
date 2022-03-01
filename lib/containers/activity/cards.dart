import 'dart:math';

import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final double height;
  const Cards({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(
            border: Border.all(
                width: 5,
                color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0))));
  }
}
