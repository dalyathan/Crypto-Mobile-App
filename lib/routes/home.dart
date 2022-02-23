import 'package:flutter/material.dart';

import '../containers/common/custom_app_bar.dart';
import '../containers/home/price_header.dart';
import '../containers/home/transaction.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horizonalPaddingRatio = 0.075;
    double topPaddingRatio = 0.05;
    Size size = MediaQuery.of(context).size;
    double appBarHeightRatio = 0.075;
    double maxAvailableWidth = size.width * (1 - 2 * horizonalPaddingRatio);
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
                      width: maxAvailableWidth,
                    ),
                    Center(
                      child: PriceHeader(
                        height: size.height * 0.15,
                        width: size.width * 0.8,
                      ),
                    ),
                    Center(
                      child: Transaction(
                        width: maxAvailableWidth,
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
