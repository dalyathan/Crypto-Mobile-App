import 'package:crypto_mobile_app/containers/home/spent.dart';

import '../../state/transaction_state.dart';
import 'package:flutter/material.dart';

import 'earned.dart';
import 'axes.dart';
import 'time_period.dart';

class Transaction extends StatefulWidget {
  final double width;
  const Transaction({Key? key, required this.width}) : super(key: key);

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  late Map<String, String> timePeriods;
  late String selectedTimePeriod;
  late List<String> dropdownItems;
  late String rangeOfDays;
  late double periodSpending;
  late double periodEarning;
  late Map<String, double> graphValues;
  bool spentGraphed = true;
  @override
  void initState() {
    super.initState();
    timePeriods = TransactionState.getTimePeriods();
    dropdownItems = List<String>.from(timePeriods.keys);
    selectedTimePeriod = dropdownItems[0];
    rangeOfDays = List<String>.from(timePeriods.values)[0];
    periodSpending = TransactionState.getSpentAmount(selectedTimePeriod);
    periodEarning = TransactionState.getEarnedAmount(selectedTimePeriod);
    graphValues = TransactionState.getSpendingIn(selectedTimePeriod);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double spentContainerWidth = widget.width * 0.45;
    double spentContainerheight = size.height * 0.075;
    return Column(
      children: [
        TimePeriod(
            dropdownItems: dropdownItems,
            dropdownValue: selectedTimePeriod,
            rangeOfDays: rangeOfDays,
            updatePeriod: (String? value) => setState(() {
                  selectedTimePeriod = value!;
                  rangeOfDays = timePeriods[selectedTimePeriod]!;
                  periodSpending =
                      TransactionState.getSpentAmount(selectedTimePeriod);
                  periodEarning =
                      TransactionState.getEarnedAmount(selectedTimePeriod);
                  if (spentGraphed) {
                    graphValues =
                        TransactionState.getSpendingIn(selectedTimePeriod);
                  } else {
                    graphValues =
                        TransactionState.getEarningIn(selectedTimePeriod);
                  }
                }),
            width: widget.width),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => setState(() {
                spentGraphed = true;
                graphValues =
                    TransactionState.getSpendingIn(selectedTimePeriod);
              }),
              child: Spent(
                  width: spentContainerWidth,
                  height: spentContainerheight,
                  amount: periodSpending),
            ),
            InkWell(
              onTap: () => setState(() {
                spentGraphed = false;
                graphValues = TransactionState.getEarningIn(selectedTimePeriod);
              }),
              child: Earned(
                  width: spentContainerWidth,
                  height: spentContainerheight,
                  amount: periodEarning),
            ),
          ],
        ),
        Axes(
          height: size.height * 0.35,
          yValues: List<double>.from(graphValues.values),
          width: widget.width,
          xValues: List<String>.from(graphValues.keys),
        )
      ],
    );
  }
}
