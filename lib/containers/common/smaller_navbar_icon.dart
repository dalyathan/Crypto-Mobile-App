import 'package:flutter/material.dart';

import '../../theme.dart';
import 'navbar_icon.dart';

class SmallerNavBarIcon extends StatelessWidget {
  final double radius;
  final Widget icon;
  const SmallerNavBarIcon({Key? key, required this.radius, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: MyTheme.blueish),
      child: NavBarIcon(
        radius: radius,
        icon: icon,
        shadowDepth: 18,
      ),
    );
  }
}
