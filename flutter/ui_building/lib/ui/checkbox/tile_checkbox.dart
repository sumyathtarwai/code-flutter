import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:ui_building/constants.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class TileCheckbox extends StatefulWidget {
  TileCheckbox({Key key}) : super(key: key);

  @override
  _TileCheckboxState createState() => _TileCheckboxState();
}

class _TileCheckboxState extends State<TileCheckbox> {
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
      title: Text('CheckboxListTile ပါ'),
      iconPosition: BackdropIconPosition.action,
      headerHeight: 0.0,
      frontLayerBorderRadius: BorderRadius.only(),
      frontLayer: ListView(
        children: <Widget>[
          CheckboxListTile(
            value: _check[0],
            title: Text(_options[0]),
            subtitle: Text(_options[0]),
            secondary: Icon(Icons.directions_boat),
            activeColor: Colors.green,
            onChanged: (val) => _change(val, 0),
          ),
          CheckboxListTile(
            value: _check[1],
            title: Text(_options[1]),
            subtitle: Text(_options[1]),
            secondary: Icon(Icons.directions_bus),
            activeColor: Colors.green,
            onChanged: (val) => _change(val, 1),
          ),
          CheckboxListTile(
            value: _check[2],
            title: Text(_options[2]),
            subtitle: Text(_options[2]),
            secondary: Icon(Icons.directions_railway),
            activeColor: Colors.green,
            onChanged: (val) => _change(val, 2),
          ),
          CheckboxListTile(
            value: _check[3],
            title: Text(_options[3]),
            subtitle: Text(_options[3]),
            secondary: Icon(Icons.local_airport),
            activeColor: Colors.green,
            onChanged: (val) => _change(val, 3),
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
        filePath: CHECKBOX_TILE_PATH,
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
