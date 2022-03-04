import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dart:math';

class RotatingBottomNavBar extends StatefulWidget {
  final double height;
  final double width;
  const RotatingBottomNavBar(
      {Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<RotatingBottomNavBar> createState() => _RotatingBottomNavBarState();
}

class _RotatingBottomNavBarState extends State<RotatingBottomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double biggerCircleRadius;
  late double transformationRadius;
  late double smallerCircleRadius;
  late double previousPageIconAngle;
  late double currentPageIconAngle;
  late double nextPageIconAngle;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    biggerCircleRadius = 0.21 * widget.width;
    transformationRadius = widget.height - biggerCircleRadius;
    smallerCircleRadius = solveQuaratic(-2, widget.width,
        pow(transformationRadius, 2) - (pow(widget.width, 2) / 4));

    double nextPageIconStartAngle =
        asin((smallerCircleRadius) / (transformationRadius));
    double currentPageIconStartAngle = pi / 2 + nextPageIconStartAngle * 0.5;
    double previousPageIconStartAngle = pi - nextPageIconStartAngle;

    previousPageIconAngle = previousPageIconStartAngle;
    currentPageIconAngle = currentPageIconStartAngle;
    nextPageIconAngle = nextPageIconStartAngle;

    _controller.addListener(() {
      setState(() {
        if (previousPageIconAngle >= currentPageIconStartAngle &&
            previousPageIconAngle <= previousPageIconStartAngle) {
          previousPageIconAngle -=
              (previousPageIconStartAngle - currentPageIconStartAngle) *
                  _controller.value;
        }
        if (nextPageIconAngle / pi > previousPageIconStartAngle / pi) {
          //&&
          // nextPageIconAngle >= nextPageIconStartAngle) {
          nextPageIconAngle +=
              (nextPageIconAngle - previousPageIconStartAngle) *
                  _controller.value;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.amber,
      child: Stack(
        alignment: const Alignment(0, 1),
        children: [
          Positioned(
            bottom: widget.height - 2 * biggerCircleRadius,
            child: Neumorphic(
                style: const NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.circle(),
                    depth: -18,
                    lightSource: LightSource.top,
                    color: Colors.green),
                child: SizedBox(
                  width: 2 * biggerCircleRadius,
                  height: 2 * biggerCircleRadius,
                )),
          ),
          Transform.translate(
            offset: Offset(
                (transformationRadius) * cos(previousPageIconAngle),
                (-transformationRadius) * sin(previousPageIconAngle) +
                    smallerCircleRadius),
            child: InkWell(
              onTap: () {
                //_controller.clearListeners();
                _controller.forward();
              },
              child: Container(
                width: 2 * smallerCircleRadius,
                height: 2 * smallerCircleRadius,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(
                  (transformationRadius) * cos(nextPageIconAngle),
                  (-transformationRadius) * sin(nextPageIconAngle) +
                      smallerCircleRadius),
              child: Container(
                width: 2 * smallerCircleRadius,
                height: 2 * smallerCircleRadius,
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
