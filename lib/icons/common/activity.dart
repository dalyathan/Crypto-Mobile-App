import 'package:crypto_mobile_app/painters/common/activity.dart';
import 'package:flutter/material.dart';

class ActivityIcon extends StatelessWidget {
  final double width;
  const ActivityIcon({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ActivityPainter(),
      size: Size.square(width),
    );
  }
}
