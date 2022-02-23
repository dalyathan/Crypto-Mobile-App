import 'dart:math';

import 'package:flutter/material.dart';

import '../../theme.dart';

class PriceHeader extends StatelessWidget {
  final double width;
  final double height;
  const PriceHeader({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: width,
      //height: height,
      //color: Colors.blue,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(),
              Container(
                //color: Colors.amber,
                height: height * 0.5,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    "12,670.90",
                    style: MyTheme.textStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MyTheme.grapeColor,
                    ),
                  ),
                ),
              ),
              Container(
                width: height * 0.3,
                //color: Colors.red,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Transform.rotate(
                    angle: pi / 2,
                    child: Text(
                      "USD",
                      style: MyTheme.textStyle.copyWith(
                          color: MyTheme.blackish, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          Row(
            children: [
              const Spacer(
                flex: 10,
              ),
              SizedBox(
                height: height * 0.2,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    "\$9839.8",
                    style: MyTheme.textStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MyTheme.grapeColor,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                height: height * 0.2,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    "+8.1%",
                    style: MyTheme.textStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(57, 174, 103, 1),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
