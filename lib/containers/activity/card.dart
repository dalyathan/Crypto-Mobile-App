import 'dart:math';

import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Card extends StatelessWidget {
  final double width;
  final double height;
  const Card({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var borderRadius = BorderRadius.circular(height * 0.2);
    var innerContainerHeightRatio = 0.925;
    var innerContainerWidthRatio = 0.95;
    var innerContainerBorderRadius =
        BorderRadius.circular(height * innerContainerHeightRatio * 0.2);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        //color: Colors.white70,
        borderRadius: BorderRadius.circular(height * 0.2),
        border: Border.all(
            width: 1,
            color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0)),
      ),
      child: Center(
        child: Neumorphic(
          style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape:
                  NeumorphicBoxShape.roundRect(innerContainerBorderRadius),
              depth: 0, //-height * (1 - innerContainerHeightRatio) * 0.25,
              lightSource: LightSource.top,
              color: Colors.transparent),
          child: Container(
            height: height * innerContainerHeightRatio,
            width: width * innerContainerWidthRatio,
            decoration: BoxDecoration(
                borderRadius: innerContainerBorderRadius,
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [MyTheme.grapeColor, MyTheme.blueish],
                    stops: const [0.2, 0.9]),
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
      ),
    );
  }
}
