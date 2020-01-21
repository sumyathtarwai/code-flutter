import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction_model.dart';
import '../view/expenses_input.dart';
import '../view/expenses_list.dart';

class Expense extends StatefulWidget {
  Expense({Key key}) : super(key: key);

  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<Transaction> _transaction = [
    Transaction(
      id: '${DateFormat('dMyyyyHms').format(DateTime.now())}${DateTime.now().millisecond}',
      title: 'Breakfast',
      amount: 5.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: '${DateFormat('dMyyyyHms').format(DateTime.now())}${DateTime.now().millisecond}',
      title: 'Transportation',
      amount: 10.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: '${DateFormat('dMyyyyHms').format(DateTime.now())}${DateTime.now().millisecond}',
      title: 'Shopping',
      amount: 10.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: '${DateFormat('dMyyyyHms').format(DateTime.now())}${DateTime.now().millisecond}',
      title: 'CD',
      amount: 1.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: '${DateFormat('dMyyyyHms').format(DateTime.now())}${DateTime.now().millisecond}',
      title: 'Book',
      amount: 10.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: '${DateFormat('dMyyyyHms').format(DateTime.now())}${DateTime.now().millisecond}',
      title: 'Movie',
      amount: 10.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: '${DateFormat('dMyyyyHms').format(DateTime.now())}${DateTime.now().millisecond}',
      title: 'Donation',
      amount: 100.0,
      date: DateTime.now(),
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  void _add(Transaction tx) {
    setState(() => _transaction.add(tx));
  }

  @override
  Widget build(BuildContext context) {
    print('[redraw] Expense');
    return Column(
      children: <Widget>[
        // input data
        ExpensesInput(callBack: _add),
        // list of data
        ExpensesList(transactionList: _transaction),
      ],
    );
  }
}
