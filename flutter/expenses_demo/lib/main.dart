import 'dart:io';

import 'package:flutter/cupertino.dart';
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
    var themeData = ThemeData(
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
    );

    //TODO CupertinoApp replacement
    return MaterialApp(
      theme: themeData,
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

  bool _showChart = false;

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
    final ObstructingPreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'Expenses Demo',
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(
                CupertinoIcons.add,
                color: CupertinoColors.darkBackgroundGray,
              ),
              onPressed: () => _showInput(context),
            ),
          )
        : AppBar(
            elevation: 0,
            title: Text('Expenses Demo'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add_box),
                onPressed: () => _showInput(context),
              ),
            ],
          );
    MediaQueryData media = MediaQuery.of(context);
    // check orientation
    bool isLandscape = media.orientation == Orientation.landscape;

    Widget switchContainer = Container(
      height: (media.size.height -
              appBar.preferredSize.height -
              media.padding.top) *
          0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Show Chart',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Switch.adaptive(
            value: _showChart,
            onChanged: (val) {
              setState(() => _showChart = val);
            },
          ),
        ],
      ),
    );
    Widget transactionList = Container(
      height: (media.size.height -
              appBar.preferredSize.height -
              media.padding.top) *
          0.6,
      child: TransactionList(_transaction, _deleteTransaction),
    );
    var body = SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //FIXME provider
          // landscape mode either chart or list
          if (isLandscape && _transaction.isNotEmpty)
            switchContainer,
          if (isLandscape && _showChart)
            Container(
              height: (media.size.height -
                      appBar.preferredSize.height -
                      media.padding.top) *
                  0.6,
              child: BarChart(_recentTransaction),
            ),
          if (isLandscape && !_showChart)
            transactionList,
          // portrait mode both chart and list
          if (!isLandscape)
            Container(
              height: (media.size.height -
                      appBar.preferredSize.height -
                      media.padding.top) *
                  0.35,
              child: BarChart(_recentTransaction),
            ),
          if (!isLandscape)
            transactionList,
        ],
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: body,
          )
        : Scaffold(
            appBar: appBar,
            body: body,
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

    setState(() => _transaction.add(newTx));
  }

  void _deleteTransaction(String id) {
    setState(() => _transaction.removeWhere((el) => el.id == id));
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
