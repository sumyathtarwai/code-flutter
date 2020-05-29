import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class BarChart extends StatelessWidget {
  final List<Transaction> _transaction;

  BarChart(this._transaction);

  List<Map<String, Object>> get weeklySpendData {
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

  double get weeklySpendTotal {
    return weeklySpendData.fold(
      0.0,
      (prev, element) => prev + element['amount'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'THIS WEEK',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: weeklySpendData.map((e) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: Chart(
                    label: e['day'],
                    amount: e['amount'],
                    spendRange: weeklySpendTotal == 0.0
                        ? 0.0
                        : (e['amount'] as double) / weeklySpendTotal,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class Chart extends StatelessWidget {
  final String label;
  final double amount;
  final double spendRange;

  const Chart({this.label, this.amount, this.spendRange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FittedBox(
          child: Text('\$ ${amount.toStringAsFixed(0)}'),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 100,
          width: 20,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendRange,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, offset: Offset(1, 2)),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text('$label'),
      ],
    );
  }
}
