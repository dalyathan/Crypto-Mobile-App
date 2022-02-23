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
    return Container(
      width: size,
      height: size,
      child: Center(
        child: SizedBox(
          height: size * 0.8,
          child: FittedBox(fit: BoxFit.fitHeight, child: arrow),
        ),
      ),
      decoration: BoxDecoration(color: buttonColor),
    );
  }
}
