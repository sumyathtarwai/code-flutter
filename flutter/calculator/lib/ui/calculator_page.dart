import 'package:flutter/material.dart';
import '../constants.dart';
import '../process.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _KeyState createState() => _KeyState();
}

class _KeyState extends State<CalculatorPage> {
  String _displayText = '';
  String _num1 = '';
  String _num2 = '';

  final fontColor = Colors.white;
  final btnColor = Colors.grey.shade700;
  final btnBorder = Colors.amber.shade900;

  String _operator = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: _firstColumnWidget(),
            ),
            Expanded(
              flex: 0,
              child: _secondColumnKey(),
            ),
            Expanded(
              flex: 0,
              child: _thirdColumnKey(),
            ),
          ]),
    );
  }

  Widget _firstColumnWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Text(
            //FIXME
            (_num1.isNotEmpty && _displayText.isEmpty)
                ? _num1
                : _displayText.isEmpty ? '0' : _displayText,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              fontSize: 60.0,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _secondColumnKey() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: _buildButtonBulk(Keys.firstColumn),
        ),
        Expanded(
          child: _buildButtonBulk(Keys.secondColumn),
        ),
        Expanded(
          child: _buildButtonBulk(Keys.thirdColumn),
        ),
        Expanded(
          child: _buildButtonBulk2(
            Keys.fourthColumn,
            fontColor: fontColor,
            btnColor: btnColor,
            btnBorder: btnBorder,
          ),
        ),
      ],
    );
  }

  Widget _thirdColumnKey() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: _buildButton(Keys.keyZero),
        ),
        Expanded(
          child: _buildButton(Keys.keyDecimal),
        ),
        Expanded(
          flex: 2,
          //FIXME
          child: _buildButton3(
            Keys.keyEqual,
            fontColor: fontColor,
            btnColor: btnColor,
            btnBorder: btnBorder,
            // width: 180.0,
          ),
        ),
      ],
    );
  }

  Widget _buildButton(
    String key, {
    Color fontColor = Colors.black,
    Color btnColor = Colors.white,
    Color btnBorder = Colors.black,
  }) {
    // keypad text
    var keyText = Text(
      key,
      style: TextStyle(
        fontFamily: 'Source Sans Pro',
        fontSize: 26.0,
        color: fontColor,
      ),
    );
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 85.0,
      height: 85.0,
      child: FloatingActionButton(
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: btnBorder,
          ),
        ),
        child: keyText,
        onPressed: () {
          setState(() {
            //FIXME

            //TODO handle key
            if (key == Keys.keyClear) {
              _displayText = '';
            } else if (key == Keys.keyDel) {
              if (_displayText != '0' && _displayText.isNotEmpty) {
                _displayText =
                    _displayText.substring(0, _displayText.length - 1);
              }
            } else if (Process.isNum(key) &&
                _displayText.length < Constants.max) {
              _displayText += Process.display(_displayText, key);
            } else {
              //TODO calculate num1 and num2

            }
          });
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

//FIXME Need to fix to share state
  Widget _buildButtonBulk2(List<String> keys,
      {Color fontColor = Colors.black,
      Color btnColor = Colors.white,
      Color btnBorder = Colors.black}) {
    List<Widget> buttons = [];
    for (var key in keys) {
      buttons.add(_buildButton2(
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

  Widget _buildButton2(
    String key, {
    Color fontColor = Colors.black,
    Color btnColor = Colors.white,
    Color btnBorder = Colors.black,
  }) {
    // keypad text
    var keyText = Text(
      key,
      style: TextStyle(
        fontFamily: 'Source Sans Pro',
        fontSize: 26.0,
        color: fontColor,
      ),
    );
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 85.0,
      height: 85.0,
      child: FloatingActionButton(
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: btnBorder,
          ),
        ),
        child: keyText,
        onPressed: () {
          print(key);
          setState(() {
            if (_num1.isEmpty) {
              _num1 = _displayText;
              // reset
              _displayText = '';
            }
            _operator = key;
            print('op $_num1 $_operator');
          });
        },
      ),
    );
  }

//FIXME
  Widget _buildButton3(
    String key, {
    Color fontColor = Colors.black,
    Color btnColor = Colors.white,
    Color btnBorder = Colors.black,
  }) {
    // keypad text
    var keyText = Text(
      key,
      style: TextStyle(
        fontFamily: 'Source Sans Pro',
        fontSize: 26.0,
        color: fontColor,
      ),
    );
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 85.0,
      height: 85.0,
      child: FloatingActionButton(
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: btnBorder,
          ),
        ),
        child: keyText,
        onPressed: () {
          print(key);
          setState(() {
            _num2 = _displayText;
            print('op $_num1 $_operator $_num2');
            // reset
            _displayText = Process.calculate(_num1, _num2, _operator);
            _num1 = '';
            _num2 = '';
            _operator = '';
          });
        },
      ),
    );
  }
}
