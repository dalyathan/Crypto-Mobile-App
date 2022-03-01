import 'package:flutter/material.dart';

import '../../icons/common/four_dots.dart';

class CustomAppBar extends StatelessWidget {
  final double width;
  final double height;
  const CustomAppBar({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData appBarTheme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FourDotsIcon(
          height: height * 0.6,
          iconColor: appBarTheme.canvasColor,
        ),
        Container(
          width: height,
          height: height,
          child: Center(
              child: SizedBox(
                  height: height * 0.7,
                  width: height * 0.7,
                  child: Image.asset('assets/images/me.png'))),
          decoration: BoxDecoration(
              border: Border.all(color: appBarTheme.cardColor, width: 0.5),
              borderRadius: BorderRadius.circular(height * 0.2)),
        )
      ],
    );
  }
}
