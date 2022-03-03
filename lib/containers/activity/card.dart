import 'dart:math';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../painters/activity/blurry_rrect.dart';

class Card extends StatelessWidget {
  final double width;
  final double height;
  const Card({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var innerContainerHeightRatio = 0.95;
    var innerContainerWidthRatio = 0.95;
    var borderRadiusRatio = 0.2;
    var contentHeight = height * innerContainerHeightRatio;
    var contentWidth = width * innerContainerWidthRatio;
    var innerContainerBorderRadius =
        BorderRadius.circular(contentHeight * borderRadiusRatio);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height * 0.2),
        color: Colors.white,
      ),
      child: Center(
        child: Stack(
          children: [
            Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(innerContainerBorderRadius),
                  depth: 0, //-height * (1 - innerContainerHeightRatio) * 0.25,
                  lightSource: LightSource.top,
                  color: Colors.transparent),
              child: Container(
                height: contentHeight,
                width: contentWidth,
                decoration: BoxDecoration(
                    borderRadius: innerContainerBorderRadius,
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        //MyTheme.mildYellowish,
                        //MyTheme.grapeColor,
                        Color.fromRGBO(177, 164, 252, 1),
                        Color.fromRGBO(75, 150, 175, 1)
                      ],
                      stops: [
                        0.05,
                        0.95,
                      ],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey, //.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(10, 10), // changes position of shadow
                      ),
                    ]),
              ),
            ),
            CustomPaint(
              painter: BlurryRRectPainter(borderRadiusRatio),
              size: Size(contentWidth, contentHeight),
            )
          ],
        ),
      ),
    );
  }
}
