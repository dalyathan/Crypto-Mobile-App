import 'package:crypto_mobile_app/painters/common/folder.dart';
import 'package:flutter/material.dart';

class FolderIcon extends StatelessWidget {
  final double width;
  const FolderIcon({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: FolderPainter(),
      size: Size.square(width),
    );
  }
}
