import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';

import '../containers/common/bottom_navbar.dart';
import '../containers/common/custom_app_bar.dart';
import '../containers/home/price_header.dart';
import '../containers/home/transaction.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horizonalPaddingRatio = 0.075;
    Size size = MediaQuery.of(context).size;
    double appBarHeightRatio = 0.075;
    double maxAvailableWidth = size.width * (1 - 2 * horizonalPaddingRatio);
    double bottomNavBarWidth = maxAvailableWidth * 0.7;
    double bottomNavBarAspectRatio = 1.66;
    double transactionHeight = 0.525 * size.height;
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
                left: size.width * horizonalPaddingRatio,
                right: size.width * horizonalPaddingRatio),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Theme(
                  data: ThemeData(
                      canvasColor: MyTheme.grapeColor,
                      cardColor: MyTheme.mildYellowish),
                  child: CustomAppBar(
                    height: size.height * appBarHeightRatio,
                    width: maxAvailableWidth,
                  ),
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
                    height: transactionHeight,
                  ),
                ),
                CustomBottomNavBar(
                    width: bottomNavBarWidth,
                    height: bottomNavBarWidth / bottomNavBarAspectRatio),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
