import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'navbar_icon.dart';

class BiggerNavBarIcon extends StatelessWidget {
  final double radius;
  final Widget icon;
  const BiggerNavBarIcon({Key? key, required this.radius, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: MyTheme.grapeColor),
      child: NavBarIcon(
        radius: radius,
        icon: icon,
        shadowDepth: -18,
      ),
    );
  }
}
