import 'package:crypto_mobile_app/containers/home/spent.dart';

import '../../state/transaction_state.dart';
import 'package:flutter/material.dart';

import 'earned.dart';
import 'axes.dart';
import 'graph.dart';
import 'time_period.dart';
import 'transaction_types.dart';

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
    return Column(
      children: [
        TimePeriod(
            dropdownItems: dropdownItems,
            dropdownValue: selectedTimePeriod,
            rangeOfDays: rangeOfDays,
            updatePeriod: periodIsUpdated,
            width: widget.width),
        TransactionTypes(
          width: widget.width,
          graphEarning: graphEarning,
          graphSpending: graphSpending,
          periodEarning: periodEarning,
          periodSpending: periodSpending,
        ),
        Graph(
          height: size.height * 0.35,
          width: widget.width,
          graphValues: graphValues,
        )
      ],
    );
  }

  void periodIsUpdated(String? value) {
    setState(() {
      selectedTimePeriod = value!;
      rangeOfDays = timePeriods[selectedTimePeriod]!;
      periodSpending = TransactionState.getSpentAmount(selectedTimePeriod);
      periodEarning = TransactionState.getEarnedAmount(selectedTimePeriod);
      if (spentGraphed) {
        graphValues = TransactionState.getSpendingIn(selectedTimePeriod);
      } else {
        graphValues = TransactionState.getEarningIn(selectedTimePeriod);
      }
    });
  }

  void graphSpending() {
    setState(() {
      spentGraphed = true;
      graphValues = TransactionState.getSpendingIn(selectedTimePeriod);
    });
  }

  void graphEarning() {
    setState(() {
      spentGraphed = false;
      graphValues = TransactionState.getEarningIn(selectedTimePeriod);
    });
  }
}
