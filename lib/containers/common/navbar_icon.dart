import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'button3d.dart';

class NavBarIcon extends StatelessWidget {
  final double radius;
  final Widget icon;
  final double shadowDepth;
  const NavBarIcon(
      {Key? key,
      required this.radius,
      required this.icon,
      required this.shadowDepth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double button3dSizeRatio = shadowDepth > 0 ? 1 : 0.8;
    Color backgroundColor = Theme.of(context).canvasColor;
    return Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: const NeumorphicBoxShape.circle(),
            depth: shadowDepth,
            lightSource: LightSource.top,
            color: Colors.transparent),
        child: SizedBox(
          width: 2 * radius,
          height: 2 * radius,
          child: Center(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(radius * button3dSizeRatio),
            child: Button3D(
                icon: icon,
                buttonColor: backgroundColor,
                size: 2 * radius * button3dSizeRatio),
          )),
        ));
  }
}
