import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _tx;
  final Function _deleteTransaction;

  TransactionList(this._tx, this._deleteTransaction);

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
                  child: ListTile(
                    contentPadding: EdgeInsets.all(8),
                    leading: Container(
                      width: 100,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColorDark,
                          width: 1.5,
                        ),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${_tx[index].amount.toStringAsFixed(2)}\$',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                    title: Text(
                      _tx[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(_tx[index].date),
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 14,
                            color: Colors.black26,
                          ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red.shade400,
                      ),
                      onPressed: () => _deleteTransaction(_tx[index].id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
