import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction_model.dart';

class ExpensesList extends StatelessWidget {
  final List<Transaction> transactionList;

  ExpensesList({this.transactionList});
  @override
  Widget build(BuildContext context) {
    print('[redraw] ExpensesList');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: transactionList.map(
        (t) {
          return Card(
            color: Color.fromRGBO(109, 114, 119, 0.5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20.0,
                    ),
                    padding: EdgeInsets.all(
                      8.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.amber.shade700,
                          Colors.amberAccent,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '\$${t.amount}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xff212121),
                          shadows: [
                            Shadow(
                              color: Colors.amberAccent,
                              offset: Offset(0, 1.6),
                            )
                          ],
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6.0,
                          ),
                          child: Text(
                            t.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            //'${t.date}',
                            // intl package
                            DateFormat('E dd, MMM yyyy')
                                .add_jm()
                                .format(t.date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
