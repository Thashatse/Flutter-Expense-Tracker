import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  String getForamtedDate() {
    var dateFormated = DateFormat.yMMMd().format(
        date); //"${date.hour}:${date.minute} ${date.day}/${date.month}/${date.year}";

    return dateFormated;
  }

  Transaction(
      {required this.id,
      required this.amount,
      required this.date,
      required this.title});
}
