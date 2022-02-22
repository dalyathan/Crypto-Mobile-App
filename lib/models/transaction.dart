import 'package:crypto_mobile_app/util/data/transaction_period.dart';
import 'package:crypto_mobile_app/util/data/transaction_type.dart';

class Transaction {
  final double amount;
  final TransactionType type;
  final TransactionPeriod period;

  Transaction(this.amount, this.type, this.period);
}
