import 'dart:math';

import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
    var fireIconSize = width * 0.3;
    var textHeight = height * 0.7;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height * 0.2),
        color: Colors.white,
      ),
      child: Center(
        child: Neumorphic(
          style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape:
                  NeumorphicBoxShape.roundRect(innerContainerBorderRadius),
              depth: 8,
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
                  Color.fromRGBO(177, 164, 252, 1),
                  Color.fromRGBO(75, 150, 175, 1)
                ],
                stops: [
                  0.05,
                  0.95,
                ],
              ),
            ),
            child: SizedBox(
              height: textHeight,
              child: Column(
                children: [
                  SizedBox(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(
                          flex: 5,
                        ),
                        SizedBox(
                            width: fireIconSize,
                            height: fireIconSize,
                            //color: Colors.amber,
                            child: Image.asset('assets/images/fire.png')),
                        const Spacer(
                          flex: 1,
                        ),
                        Transform.rotate(
                          angle: pi / 4,
                          child: Icon(
                            FontAwesomeIcons.arrowUp,
                            color: MyTheme.blueish,
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: textHeight * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "11,670,90",
                          style: GoogleFonts.sora(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "USD",
                          style: GoogleFonts.sora(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$9839.8",
                          style: GoogleFonts.sora(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "+8.31",
                          style: GoogleFonts.sora(
                              fontSize: 15,
                              color: MyTheme.blueish,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
