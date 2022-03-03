import 'package:crypto_mobile_app/containers/activity/activity_bar.dart';
import 'package:crypto_mobile_app/containers/activity/cards.dart';
import 'package:crypto_mobile_app/icons/activity/binance.dart';
import 'package:crypto_mobile_app/icons/activity/bitcoin.dart';
import 'package:crypto_mobile_app/icons/activity/etherum.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    double activityBarHeight = size.height * activityBarHeightRatio;
    double activityBarIconSize = activityBarHeight * 0.25;
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
                  ActivityBar(
                    height: activityBarHeight,
                    abbreviation: 'BTC',
                    currentValue: 25.30,
                    icon: Bitcoin(size: activityBarIconSize),
                    name: 'BitCoin',
                    percent: 1.68,
                  ),
                  ActivityBar(
                    height: activityBarHeight,
                    abbreviation: 'ETH',
                    currentValue: 13.41,
                    icon: Ethereum(size: activityBarIconSize),
                    name: 'Ethereum',
                    percent: 1.68,
                  ),
                  ActivityBar(
                    height: activityBarHeight,
                    abbreviation: 'BIN',
                    currentValue: 9.44,
                    name: 'Binance',
                    icon: BinanceCoinIcon(
                      size: activityBarIconSize,
                    ),
                    percent: -1.68,
                  ),
                  CustomBottomNavBar(
                      isHomePage: false,
                      width: bottomNavBarWidth,
                      height: bottomNavBarWidth / bottomNavBarAspectRatio),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
