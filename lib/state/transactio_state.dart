import 'package:intl/intl.dart';

class TransactionState {
  static const List<String> _periods = [
    '1 Month',
    '3 Months',
    '6 Months',
    '1 Year'
  ];
  static Map<String, String> getTimePeriods() {
    Map<String, String> timePeriods = {};
    DateTime today = DateTime.now();
    DateTime oneMonthAgo = today.subtract(const Duration(days: 30));
    DateTime threeMonthsAgo = today.subtract(const Duration(days: 90));
    DateTime sixMonthsAgo = today.subtract(const Duration(days: 180));
    DateTime oneYearAgo = today.subtract(const Duration(days: 365));
    var monthFormat = DateFormat("MMM");
    timePeriods[_periods[0]] =
        '${monthFormat.format(oneMonthAgo)} ${oneMonthAgo.day} - ${monthFormat.format(today)} ${today.day}';
    timePeriods[_periods[1]] =
        '${monthFormat.format(threeMonthsAgo)} ${threeMonthsAgo.day} - ${monthFormat.format(today)} ${today.day}';
    timePeriods[_periods[2]] =
        '${monthFormat.format(sixMonthsAgo)} ${sixMonthsAgo.day} - ${monthFormat.format(today)} ${today.day}';
    timePeriods[_periods[3]] =
        '${monthFormat.format(oneYearAgo)} ${oneYearAgo.day} - ${monthFormat.format(today)} ${today.day}';
    return timePeriods;
  }

  static double getSpentAmount(String timePeriod) {
    return {
      _periods[0]: 1460.00,
      _periods[1]: 1460098.00,
      _periods[2]: 146009774.00,
      _periods[3]: 14608657556.00
    }[timePeriod]!;
  }

  static double getEarnedAmount(String timePeriod) {
    return {
      _periods[0]: 2730.00,
      _periods[1]: 17890098.00,
      _periods[2]: 895609774.00,
      _periods[3]: 91233445569.00
    }[timePeriod]!;
  }
}