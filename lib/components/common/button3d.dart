import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../painters/home/button_shadow.dart';

class Button3D extends StatelessWidget {
  final Widget icon;
  final Color buttonColor;
  final double size;
  const Button3D(
      {Key? key,
      required this.icon,
      required this.buttonColor,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gradientHeightRatio = 0.875;
    double gradientWidth = size;
    double gradientHeight = size * gradientHeightRatio;
    double borderRadiusRatio = 0.15;
    BorderRadius borderRadius = BorderRadius.circular(size * borderRadiusRatio);
    return Neumorphic(
      style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(borderRadius),
          depth: 8,
          lightSource: LightSource.topLeft,
          color: Colors.transparent),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size,
            height: size,
            child: Center(
              child: icon,
            ),
            decoration: BoxDecoration(
              color: Color.lerp(buttonColor, Colors.white, 0.1),
              borderRadius: borderRadius,
            ),
          ),
          Container(
            width: gradientWidth,
            height: gradientHeight,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: const LinearGradient(
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: <Color>[
                    Colors.black12,
                    Colors.white10,
                  ],
                  stops: [
                    0.025,
                    0.5,
                  ],
                  tileMode: TileMode.decal),
            ),
          ),
          CustomPaint(
            painter:
                ButtonShadowPainter(borderRadiusRatio, gradientHeightRatio),
            size: Size.square(size),
          )
        ],
      ),
    );
  }
}
