import 'package:crypto_mobile_app/containers/activity/activity_bar.dart';
import 'package:crypto_mobile_app/containers/activity/cards.dart';
import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';

import '../containers/common/bottom_navbar.dart';
import '../containers/common/custom_app_bar.dart';

class ActivityRoute extends StatelessWidget {
  const ActivityRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horizonalPaddingRatio = 0.075;
    double topPaddingRatio = 0.025;
    Size size = MediaQuery.of(context).size;
    double appBarHeightRatio = 0.075;
    double cardsHeightRatio = 0.35;
    double activityBarHeightRatio = 0.1;
    double maxAvailableWidth = size.width * (1 - 2 * horizonalPaddingRatio);
    double bottomNavBarWidth = maxAvailableWidth * 0.7;
    double bottomNavBarAspectRatio = 1.66;
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
            body: Container(
          color: const Color.fromRGBO(76, 86, 179, 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * topPaddingRatio,
                left: size.width * horizonalPaddingRatio,
                right: size.width * horizonalPaddingRatio),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Theme(
                  data: ThemeData(
                      canvasColor: Colors.white,
                      cardColor: MyTheme.mildYellowish),
                  child: CustomAppBar(
                    height: size.height * appBarHeightRatio,
                    width: size.width * (1 - 2 * horizonalPaddingRatio),
                  ),
                ),
                Cards(height: size.height * cardsHeightRatio),
                ActivityBar(height: size.height * activityBarHeightRatio),
                ActivityBar(height: size.height * activityBarHeightRatio),
                ActivityBar(height: size.height * activityBarHeightRatio),
                CustomBottomNavBar(
                    isHomePage: false,
                    width: bottomNavBarWidth,
                    height: bottomNavBarWidth / bottomNavBarAspectRatio),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
