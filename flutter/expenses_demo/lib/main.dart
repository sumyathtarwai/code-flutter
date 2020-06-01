import 'package:flutter/material.dart';
import './ui/input_transaction.dart';
import './models/transaction.dart';
import './ui/transaction_list.dart';
import 'ui/bar_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.amber.shade600,
        primaryColorLight: Colors.lightGreenAccent,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.amber.shade700,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<Transaction> _transaction = [..._dummyData()];

  List<Transaction> get _recentTransaction {
    return _transaction.where(
      (el) {
        return el.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('Expenses Demo'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add_box),
          onPressed: () {
            _showInput(context);
          },
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //FIXME provider
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.35,
            child: BarChart(_recentTransaction),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.6,
            child: TransactionList(_transaction, _deleteTransaction),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.add),
        onPressed: () => _showInput(context),
      ),
    );
  }

  void _showInput(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // wrap with guesture to hide number keyboard when tap
      builder: (modalCtx) => GestureDetector(
        onTap: () => FocusScope.of(modalCtx).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: InputTransaction(_addTransaction),
      ),
    );
  }

  //FIXME use provider
  void _addTransaction(String title, double amount, DateTime date) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );

    setState(
      () {
        _transaction.add(newTx);
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transaction.removeWhere((el) => el.id == id);
    });
  }

  static List<Transaction> _dummyData() {
    return [
      Transaction(
        id: 'tx1',
        title: 'Book',
        amount: 1,
        date: DateTime.now().subtract(Duration(days: 30)),
      ),
      Transaction(
        id: 'tx2',
        title: 'Electricity Bill',
        amount: 3.0,
        date: DateTime.now().subtract(Duration(days: 1)),
      ),
      Transaction(
        id: 'tx3',
        title: 'Snack',
        amount: 3.0,
        date: DateTime.now().subtract(Duration(days: 1)),
      ),
      Transaction(
        id: 'tx4',
        title: 'Night out',
        amount: 40.0,
        date: DateTime.now().subtract(Duration(days: 2)),
      ),
      Transaction(
        id: 'tx5',
        title: 'edu',
        amount: 50.30,
        date: DateTime.now().subtract(Duration(days: 4)),
      )
    ];
  }
}
