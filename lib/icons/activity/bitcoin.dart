import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme.dart';

class Bitcoin extends StatelessWidget {
  final double size;
  const Bitcoin({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderRadius = size * 0.2;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: MyTheme.yellowish,
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Icon(
        FontAwesomeIcons.bitcoin,
        size: size * 0.8,
        color: Colors.white,
      ),
    );
  }
}
