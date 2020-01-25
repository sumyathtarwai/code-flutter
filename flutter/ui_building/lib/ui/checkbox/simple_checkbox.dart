import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:ui_building/constants.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class SimpleCheckbox extends StatefulWidget {
  SimpleCheckbox({Key key}) : super(key: key);

  @override
  _SimpleCheckboxState createState() => _SimpleCheckboxState();
}

class _SimpleCheckboxState extends State<SimpleCheckbox> {
  final List _options = ['Boat', 'Car', 'Train', 'Flight'];
  // check state for checkbox
  List _check;
  // check state for checkbox value
  List _checkVal = [];

  @override
  void initState() {
    // fill all checkbox uncheck
    _check = List.filled(4, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      title: Text('Checkbox ပါ'),
      iconPosition: BackdropIconPosition.action,
      headerHeight: 0.0,
      frontLayerBorderRadius: BorderRadius.only(),
      frontLayer: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                  value: _check[0],
                  activeColor: Colors.green,
                  onChanged: (val) => _change(val, 0)),
              Text(
                _options[0],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                  value: _check[1],
                  activeColor: Colors.green,
                  onChanged: (val) => _change(val, 1)),
              Text(
                _options[1],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                  value: _check[2],
                  activeColor: Colors.green,
                  onChanged: (val) => _change(val, 2)),
              Text(
                _options[2],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                  value: _check[3],
                  activeColor: Colors.green,
                  onChanged: (val) => _change(val, 3)),
              Text(
                _options[3],
              ),
            ],
          ),
          Center(
            child: Text(
              'Your selected data is $_checkVal',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      backLayer: SourceCodeView(
        filePath: CHECKBOX_SIMPLE_PATH,
        codeLinkPrefix: GIT_PATH,
      ),
    );
  }

  void _change(bool val, int index) {
    // when uncheck, remove checked value from list
    val == false && _checkVal.indexOf(_options[index]) != -1
        ? _checkVal.remove(_options[index])
        : _checkVal.add(_options[index]);
    setState(
      // change on/off
      () => _check[index] = val,
    );
  }
}
