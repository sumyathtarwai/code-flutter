import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _tx;
  TransactionList(this._tx);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 500,
      child: _tx.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'Oops!',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Image.asset('assets/images/nodata.png', fit: BoxFit.cover),
              ],
            )
          : ListView.builder(
              itemCount: _tx.length,
              itemBuilder: (_, index) {
                return Card(
                  color: Theme.of(context).cardColor,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: EdgeInsets.all(
                          10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        child: Text(
                          '${_tx[index].amount.toStringAsFixed(2)}\$',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _tx[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMd().format(_tx[index].date),
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      fontSize: 14,
                                      color: Colors.black26,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
