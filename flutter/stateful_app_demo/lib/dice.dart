import 'dart:math';

import 'package:flutter/material.dart';

class DiceWidget extends StatefulWidget {
  DiceWidget({Key key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<DiceWidget> {
  int _leftDice = 3;
  int _rightDice = 6;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.tealAccent,
        appBar: AppBar(
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  child: Image.asset('assets/$_leftDice.png'),
                  onPressed: () => _diceState(),
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Image.asset('assets/$_rightDice.png'),
                  onPressed: () => _diceState(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _diceState() {
    setState(() {
      _leftDice = Random().nextInt(6) + 1;
      _rightDice = Random().nextInt(6) + 1;
    });
  }
}
