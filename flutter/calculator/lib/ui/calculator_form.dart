import 'package:calculator/main.dart';
import 'package:flutter/material.dart';

class CalculatorForm extends StatefulWidget {
  @override
  _Calculator createState() => _Calculator();
}

class _Calculator extends State<CalculatorForm> {
  var _firstController = TextEditingController();
  var _secondController = TextEditingController();
  var _result = 0;

  void add(var _num1, var _num2) => setState(() => _result = _num1 + _num2);

  void minus(var _num1, var _num2) => setState(() => _result = _num1 - _num2);

  void multiply(var _num1, var _num2) =>
      setState(() => _result = _num1 * _num2);

  void divide(var _num1, var _num2) => setState(() => _result = _num1 ~/ _num2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Calculator'),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Num 1'),
              controller: _firstController,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Num 2'),
              controller: _secondController,
            ),
            Text(
              'Here your result $_result!',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            FloatingActionButton(
                onPressed: () => add(int.parse(_firstController.text),
                    int.parse(_secondController.text)),
                child: Icon(Icons.add, color: Colors.green),
                backgroundColor: Colors.orangeAccent),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            FloatingActionButton(
                onPressed: () => minus(int.parse(_firstController.text),
                    int.parse(_secondController.text)),
                child: Icon(Icons.remove, color: Colors.red),
                backgroundColor: Colors.orangeAccent),
          ],
        ));
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    super.dispose();
  }
}
