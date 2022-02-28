import 'package:crypto_mobile_app/painters/common/person.dart';
import 'package:flutter/material.dart';

class PersonIcon extends StatelessWidget {
  final double width;
  const PersonIcon({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.8;
    return CustomPaint(
      painter: PersonPainter(),
      size: Size(width, width * aspectRatio),
    );
  }
}
