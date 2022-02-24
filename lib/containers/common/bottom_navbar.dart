import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dart:math';

class CustomBottomNavBar extends StatefulWidget {
  final double height;
  final double width;
  const CustomBottomNavBar(
      {Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
  }

  @override
  Widget build(BuildContext context) {
    double biggerCircleSize = 2 * 0.21 * widget.width;
    double transformationRadius = widget.height - biggerCircleSize * 0.5;
    double smallerCircleSize = solveQuaratic(-2, widget.width,
            pow(transformationRadius, 2) - (pow(widget.width, 2) / 4)) *
        2;
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.amber,
      child: Stack(
        alignment: const Alignment(0, 1),
        children: [
          Positioned(
            //left: (widget.width - biggerCircleSize) * 0.5,
            bottom: widget.height - biggerCircleSize,
            child: Neumorphic(
                style: const NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.circle(),
                    depth: -18,
                    lightSource: LightSource.top,
                    color: Colors.green),
                child: SizedBox(
                  width: biggerCircleSize,
                  height: biggerCircleSize,
                )),
          ),
          Positioned(
              //top: widget.height - smallerCircleSize,
              right: widget.width - smallerCircleSize,
              child: Container(
                width: smallerCircleSize,
                height: smallerCircleSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              )),
          Positioned(
              //top: widget.height - smallerCircleSize,
              left: widget.width - smallerCircleSize,
              child: Container(
                width: smallerCircleSize,
                height: smallerCircleSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ))
        ],
      ),
    );
  }

  double solveQuaratic(double a, double b, double c) {
    //a=-2, b= widget.width, c=transformationRadius**2 - (widget.width**2)/4
    double plusOrMinus = sqrt((pow(b, 2) - 4 * a * c));
    double answer1 = (-b + plusOrMinus) / (2 * a);
    double answer2 = (-b - plusOrMinus) / (2 * a);
    if (answer1 > 0) {
      return answer1;
    } else if (answer2 > 0) {
      return answer2;
    } else {
      throw ArgumentError;
    }
  }
}
