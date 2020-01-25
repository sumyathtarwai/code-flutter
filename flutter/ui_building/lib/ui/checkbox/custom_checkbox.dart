import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:ui_building/constants.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class CustomCheckbox extends StatefulWidget {
  CustomCheckbox({Key key}) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  final List _options = ['Boat', 'Car', 'Train', 'Flight'];
  // check state for checkbox
  List _check;
  // check state for checkbox value
  List _checkVal = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // fill all checkbox uncheck
    _check = List.filled(4, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: BackdropScaffold(
          actions: <Widget>[],
          title: Text('Custom Checkbox ပါ'),
          iconPosition: BackdropIconPosition.action,
          headerHeight: 0.0,
          frontLayerBorderRadius: BorderRadius.only(),
          frontLayer: ListView.builder(
            itemBuilder: (_, i) {
              return Container(
                height: 80.0,
                child: Card(
                    child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(
                      value: _check[i],
                      onChanged: (val) => _change(val, i),
                    ),
                    Text(_options[i]),
                  ],
                )),
              );
            },
            itemCount: _options.length,
          ),
          backLayer: SourceCodeView(
            filePath: CHECKBOX_CUSTOM_PATH,
            codeLinkPrefix: GIT_PATH,
          ),
        ),
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
    print('object');
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          '$_checkVal',
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
