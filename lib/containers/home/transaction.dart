import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction extends StatefulWidget {
  final double width;
  const Transaction({Key? key, required this.width}) : super(key: key);

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  late Map<String, String> timePeriods;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime today = DateTime.now();
    DateTime oneMonthAgo = today.subtract(const Duration(days: 30));
    DateTime threeMonthsAgo = today.subtract(const Duration(days: 90));
    DateTime sixMonthsAgo = today.subtract(const Duration(days: 180));
    DateTime oneYearAgo = today.subtract(const Duration(days: 365));
    timePeriods[
            '${DateFormat("MMMM").format(oneMonthAgo)} ${oneMonthAgo.day} - ${DateFormat("MMMM").format(today)} ${today.day}}'] =
        '1 Month';
    timePeriods[
            '${DateFormat("MMMM").format(threeMonthsAgo)} ${threeMonthsAgo.day} - ${DateFormat("MMMM").format(today)} ${today.day}}'] =
        '3 Months';
    timePeriods[
            '${DateFormat("MMMM").format(sixMonthsAgo)} ${sixMonthsAgo.day} - ${DateFormat("MMMM").format(today)} ${today.day}}'] =
        '6 Months';
    timePeriods[
            '${DateFormat("MMMM").format(oneYearAgo)} ${oneYearAgo.day} - ${DateFormat("MMMM").format(today)} ${today.day}}'] =
        '1 Year';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
