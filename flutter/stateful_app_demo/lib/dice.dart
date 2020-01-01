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
                  onPressed: () {
                    setState(
                      () => _dice(),
                    );
                  },
                  child: Image.asset('assets/$_leftDice.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Image.asset('assets/$_rightDice.png'),
                  onPressed: () {
                    setState(
                      () => _dice(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _dice() {
    _leftDice = Random().nextInt(6) + 1;
    _rightDice = Random().nextInt(6) + 1;
  }
}
