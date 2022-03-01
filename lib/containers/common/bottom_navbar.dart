import 'package:crypto_mobile_app/containers/common/bigger_navbar_icon.dart';
import 'package:crypto_mobile_app/containers/common/smaller_navbar_icon.dart';
import 'package:crypto_mobile_app/icons/common/activity.dart';
import 'package:crypto_mobile_app/icons/common/house.dart';
import 'package:crypto_mobile_app/icons/common/person.dart';
import 'package:crypto_mobile_app/routes/activity.dart';
import 'package:crypto_mobile_app/routes/home.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dart:math';

class CustomBottomNavBar extends StatefulWidget {
  final double height;
  final double width;
  final bool isHomePage;
  const CustomBottomNavBar(
      {Key? key,
      required this.height,
      required this.width,
      this.isHomePage = true})
      : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with SingleTickerProviderStateMixin {
  late double biggerCircleRadius;
  late double transformationRadius;
  late double smallerCircleRadius;

  @override
  void initState() {
    super.initState();

    biggerCircleRadius = 0.21 * widget.width;
    transformationRadius = widget.height - biggerCircleRadius;
    smallerCircleRadius = solveQuaratic(-2, widget.width,
        pow(transformationRadius, 2) - (pow(widget.width, 2) / 4));
  }

  @override
  Widget build(BuildContext context) {
    double iconWidth = smallerCircleRadius * 0.85;
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        alignment: const Alignment(0, 1),
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: widget.height - 2 * biggerCircleRadius,
            child: BiggerNavBarIcon(
              radius: biggerCircleRadius,
              icon: widget.isHomePage
                  ? HouseIcon(width: iconWidth)
                  : ActivityIcon(
                      width: iconWidth,
                    ),
            ),
          ),
          Positioned(
            left: 0,
            child: InkResponse(
              onTap: () {
                if (widget.isHomePage) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ActivityRoute()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeRoute()),
                  );
                }
              },
              child: SmallerNavBarIcon(
                  radius: smallerCircleRadius,
                  icon: widget.isHomePage
                      ? ActivityIcon(
                          width: iconWidth,
                        )
                      : HouseIcon(width: iconWidth)),
            ),
          ),
          Positioned(
            right: 0,
            child: SmallerNavBarIcon(
                radius: smallerCircleRadius,
                icon: PersonIcon(
                  width: iconWidth,
                )),
          )
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
