import 'package:flutter/material.dart';

import '../containers/common/custom_app_bar.dart';

class ActivityRoute extends StatelessWidget {
  const ActivityRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horizonalPaddingRatio = 0.1;
    double topPaddingRatio = 0.075;
    Size size = MediaQuery.of(context).size;
    double appBarHeightRatio = 0.1;
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
            body: Padding(
                padding: EdgeInsets.only(
                    top: size.height * topPaddingRatio,
                    left: size.width * horizonalPaddingRatio,
                    right: size.width * horizonalPaddingRatio),
                child: Column(
                  children: [
                    CustomAppBar(
                      height: size.height * appBarHeightRatio,
                      width: size.width * (1 - 2 * horizonalPaddingRatio),
                    ),
                  ],
                ))),
      ),
    );
  }
}
