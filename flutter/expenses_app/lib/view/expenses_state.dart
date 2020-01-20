import 'package:expenses_app/model/transaction_model.dart';
import 'package:expenses_app/view/expenses_input.dart';
import 'package:expenses_app/view/expenses_list.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  Expense({Key key}) : super(key: key);

  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  List _transaction;
  @override
  void initState() {
    _transaction = [
      Transaction(
        id: 1,
        title: 'Breakfast',
        amount: 5.9,
        date: DateTime.now(),
      ),
      Transaction(
        id: 2,
        title: 'Transportation',
        amount: 10.9,
        date: DateTime.now(),
      ),
    ];
    super.initState();
  }

  Function addFun(Transaction tx) {
    setState(() {
      _transaction.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            color: Colors.blue,
            child: Text('Chart'),
            elevation: 5.0,
          ),
        ),
        // input data
        ExpensesInput(callBack: addFun),
        // list of data
        ExpensesList(
          transactionList: _transaction,
        ),
      ],
    );
  }
}
