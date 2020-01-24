import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:ui_building/constants.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class SimpleRadio extends StatefulWidget {
  SimpleRadio({Key key}) : super(key: key);

  @override
  _SimpleRadioState createState() => _SimpleRadioState();
}

class _SimpleRadioState extends State<SimpleRadio> {
  var _selected;
  final List options = ['Summer', 'Rainy', 'Winter'];
  @override
  void initState() {
    _selected = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      title: Text('Radio ပါ'),
      iconPosition: BackdropIconPosition.action,
      headerHeight: 0.0,
      frontLayerBorderRadius: BorderRadius.only(),
      frontLayer: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Summer'),
            leading: Radio(
              value: 1,
              groupValue: _selected,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(
                  () {
                    _selected = value;
                  },
                );
              },
            ),
          ),
          ListTile(
            title: const Text('Rainy'),
            leading: Radio(
              value: 2,
              groupValue: _selected,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(
                  () {
                    _selected = value;
                  },
                );
              },
            ),
          ),
          ListTile(
            title: const Text('Winter'),
            leading: Radio(
              value: 3,
              groupValue: _selected,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(
                  () {
                    _selected = value;
                  },
                );
              },
            ),
          ),
        ],
      ),
      backLayer: SourceCodeView(
        filePath: RADIO_SIMPLE_PATH,
        codeLinkPrefix: GIT_PATH,
      ),
    );
  }
}
