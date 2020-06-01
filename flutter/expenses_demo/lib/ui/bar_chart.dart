import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class BarChart extends StatelessWidget {
  final List<Transaction> _transaction;

  BarChart(this._transaction);

  List<Map<Object, Object>> get weeklySpendData {
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
        return {
          'day': currentDate,
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
    // get map data and order
    var weekly = weeklySpendData.reversed.toList();

    return Card(
      color: Colors.grey.shade300,
      elevation: 15,
      margin: EdgeInsets.all(10),
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          return Column(
            children: <Widget>[
              Container(
                height: constraints.maxHeight * 0.2,
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  child: Text(
                    'WEEKLY SPEND',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: weekly.map(
                    (e) {
                      return Flexible(
                        fit: FlexFit.tight,
                        child: Chart(
                          label: DateFormat.E().format(e['day']),
                          amount: e['amount'],
                          spendRange: weeklySpendTotal == 0.0
                              ? 0.0
                              : (e['amount'] as double) / weeklySpendTotal,
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          );
        },
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
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.10,
              child: FittedBox(
                child: Text('\$ ${amount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: constraints.maxWidth * 0.3,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(2, 1),
                        ),
                      ],
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Positioned(
                    child: FractionallySizedBox(
                      heightFactor: spendRange,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(1, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.10,
              child: FittedBox(
                child: Text('$label'),
              ),
            ),
          ],
        );
      },
    );
  }
}
