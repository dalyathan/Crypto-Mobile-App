import 'package:crypto_mobile_app/containers/home/line_graph.dart';
import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../state/transaction_state.dart';

class ActivityBar extends StatelessWidget {
  final double height;
  final Widget icon;
  final String name;
  final String abbreviation;
  final Map<String, double> graphValues;
  final double currentValue;
  final double percent;
  const ActivityBar(
      {Key? key,
      required this.height,
      required this.icon,
      required this.name,
      required this.abbreviation,
      required this.graphValues,
      required this.currentValue,
      required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textColumnWidth = size.width * 0.275;
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: textColumnWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icon,
                SizedBox(
                  height: height * 0.3,
                  child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        name,
                        style: GoogleFonts.sora(color: Colors.white),
                      )),
                ),
                SizedBox(
                    height: height * 0.15,
                    child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          abbreviation,
                          style: GoogleFonts.sora(color: Colors.white),
                        )))
              ],
            ),
          ),
          LineGraph(
              values:
                  TransactionState.getSpendingIn(TransactionState.periods[0]),
              height: height,
              width: size.width * 0.3,
              lineColor: MyTheme.greenish),
          SizedBox(
            height: height,
            width: textColumnWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(
                  flex: 3,
                ),
                SizedBox(
                  width: size.width * 0.2,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      '\$${currentValue.toStringAsFixed(2)}',
                      style: GoogleFonts.sora(color: Colors.white),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 4,
                ),
                SizedBox(
                    width: size.width * 0.15,
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          '\$$percent (137)',
                          style: GoogleFonts.sora(
                              color:
                                  percent > 0 ? MyTheme.greenish : Colors.red),
                        ))),
                const Spacer(
                  flex: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
