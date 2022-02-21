import 'package:flutter/material.dart';

import '../../icons/common/four_dots.dart';

class CustomAppBar extends StatelessWidget {
  final double width;
  final double height;
  const CustomAppBar({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FourDotsIcon(
          width: width * 0.2,
        )
      ],
    );
  }
}
