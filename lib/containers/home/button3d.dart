import 'package:flutter/material.dart';

class Button3D extends StatelessWidget {
  final Widget arrow;
  final Color buttonColor;
  final double size;
  const Button3D(
      {Key? key,
      required this.arrow,
      required this.buttonColor,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gradientWidth = size;
    double gradientHeight = size * 0.875;
    BorderRadius borderRadius = BorderRadius.circular(size * 0.15);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size,
          height: size,
          child: Center(
            child: SizedBox(
              height: size * 0.6,
              child: FittedBox(fit: BoxFit.fitHeight, child: arrow),
            ),
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
        Positioned(
          top: size - gradientHeight,
          child: Container(
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
                    0.8,
                    0.9,
                  ],
                  tileMode: TileMode.decal),
            ),
          ),
        )
      ],
    );
  }
}
