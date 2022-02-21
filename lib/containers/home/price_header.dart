import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme.dart';

class PriceHeader extends StatelessWidget {
  final double width;
  final double height;
  const PriceHeader({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Row(
              children: [
                SizedBox(
                    height: height * 0.4,
                    child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text("12,670.90",
                            style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.bold,
                              color: MyTheme.grapeColor,
                            )))),
                Transform.rotate(
                  angle: pi / 2,
                  child: Container(
                    width: height * 0.3,
                    color: Colors.red,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "USD",
                        style: GoogleFonts.nunitoSans(
                          color: MyTheme.blackish,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
