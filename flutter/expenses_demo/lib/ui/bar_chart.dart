import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class BarChart extends StatelessWidget {
  final List<Transaction> _transaction;

  BarChart(this._transaction);

  List<Map<String, Object>> get weeklySpend {
    return List.generate(
      7,
      (index) {
        final currentDate = DateTime.now().subtract(Duration(days: index));
        var total = 0.0;

        for (var i = 0; i < _transaction.length; i++) {
          var txDate = _transaction[i].date;
          if (currentDate.day == txDate.day &&
              currentDate.month == txDate.month &&
              currentDate.year == txDate.year) {
            total += _transaction[i].amount;
          }
        }
        //  print(DateFormat.E().format(currentDate));
        //  print(total);
        return {
          'day': DateFormat.E().format(currentDate),
          'amount': total,
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(10),
      child: Row(
        children: weeklySpend.map((e) {
          return Text('${e['day']}: ${e['amount']}');
        }).toList(),
      ),
    );
  }
}
