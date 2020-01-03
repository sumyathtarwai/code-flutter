import 'package:flutter/material.dart';
import '../constants.dart';
import '../process.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _KeyState createState() => _KeyState();
}

class _KeyState extends State<CalculatorPage> {
  String _input = '0';

  final fontColor = Colors.white;
  final btnColor = Colors.grey.shade700;
  final btnBorder = Colors.amber.shade900;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _displayWidget(),
            _keyFirstColumn(),
            _keySecondColumn(),
          ]),
    );
  }

  Widget _displayWidget() {
    return Container(
      //color: Colors.red,
      padding: EdgeInsets.only(right: 40),
      margin: EdgeInsets.only(
        top: 130.0,
      ),
      child: Text(
        _input,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontFamily: 'Source Sans Pro',
          fontSize: 60.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _keyFirstColumn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildButtonBulk(Keys.firstColumn),
        _buildButtonBulk(Keys.secondColumn),
        _buildButtonBulk(Keys.thirdColumn),
        _buildButtonBulk(
          Keys.fourthColumn,
          fontColor: fontColor,
          btnColor: btnColor,
          btnBorder: btnBorder,
        ),
      ],
    );
  }

  Widget _keySecondColumn() {
    return Row(
      children: <Widget>[
        _buildButton(Keys.keyZero),
        _buildButton(Keys.keyDecimal),
        _buildButton(
          Keys.keyEqual,
          fontColor: fontColor,
          btnColor: btnColor,
          btnBorder: btnBorder,
          width: 190.0,
        ),
      ],
    );
  }

  Widget _buildButton(String key,
      {Color fontColor = Colors.black,
      Color btnColor = Colors.white,
      Color btnBorder = Colors.black,
      double width = 80.0}) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: width,
      height: 85.0,
      child: FlatButton(
        textColor: fontColor,
        color: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: btnBorder,
            width: 1.2,
          ),
        ),
        child: Text(
          key,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          if (Process.isNum(key)) {
            setState(() {
              _input = key;
            });
          }
        },
      ),
    );
  }

  Widget _buildButtonBulk(List<String> keys,
      {Color fontColor = Colors.black,
      Color btnColor = Colors.white,
      Color btnBorder = Colors.black}) {
    List<Widget> buttons = [];
    for (var key in keys) {
      buttons.add(_buildButton(
        key,
        fontColor: fontColor,
        btnColor: btnColor,
        btnBorder: btnBorder,
      ));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: buttons,
    );
  }
}
