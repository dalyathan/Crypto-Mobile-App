import 'dart:math';

import 'package:intl/intl.dart';

class TransactionState {
  static const List<String> _periods = [
    '1 Month',
    '3 Months',
    '6 Months',
    '1 Year'
  ];
  static Map<String, int> daysAgo = {
    _periods[0]: 30,
    _periods[1]: 90,
    _periods[2]: 180,
    _periods[3]: 365
  };
  static final DateFormat _monthFormat = DateFormat("MMM");

  static double maxAllowedSpendingPerday = 500.00;
  static double minAllowedSpendingPerday = 0.00;

  static Map<String, String> getTimePeriods() {
    Map<String, String> timePeriods = {};
    DateTime today = DateTime.now();

    for (String period in _periods) {
      DateTime ago = today.subtract(Duration(days: daysAgo[period]!));
      timePeriods[period] =
          '${_monthFormat.format(ago)} ${ago.day} - ${_monthFormat.format(today)} ${today.day}';
    }
    return timePeriods;
  }

  static Map<String, double> _getTransactionIn(
      String timePeriod, double Function(String) amountGetter) {
    Map<String, double> spending = {};
    int numberOfDays = daysAgo[timePeriod]!;
    List<String> listOfDays = daysThisAgo(numberOfDays);
    List<double> listOfSpending =
        _randomsWhichSumto(amountGetter(timePeriod), numberOfDays);
    for (int dayIndex = 0; dayIndex < numberOfDays; dayIndex++) {
      spending[listOfDays[dayIndex]] = listOfSpending[dayIndex];
    }
    return spending;
  }

  static Map<String, double> getSpendingIn(String timePeriod) =>
      _getTransactionIn(timePeriod, getSpentAmount);

  static Map<String, double> getEarningIn(String timePeriod) =>
      _getTransactionIn(timePeriod, getSpentAmount);

  static List<String> daysThisAgo(int numberOfDays) {
    DateTime today = DateTime.now();
    return List<String>.generate(
        numberOfDays,
        (index) =>
            '${_monthFormat.format(today.subtract(Duration(days: numberOfDays - index - 1)))} ${today.subtract(Duration(days: numberOfDays - index - 1)).day}');
  }

  static List<double> _randomsWhichSumto(double sum, int amount) {
    double randomMin = 0.00;
    double randomMax = 100.00;
    Random random = Random();
    List<double> randomsWithoutCriteria = List<double>.generate(amount,
        (index) => random.nextDouble() * (randomMax - randomMin) + randomMin);
    double randomSum = randomsWithoutCriteria.reduce((a, b) => a + b);
    List<double> randomsWithCriteria = List<double>.generate(
        amount, (index) => (sum / randomSum) * randomsWithoutCriteria[index]);
    return randomsWithCriteria;
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
