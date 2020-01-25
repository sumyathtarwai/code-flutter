import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:ui_building/constants.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class TileRadio extends StatefulWidget {
  TileRadio({Key key}) : super(key: key);

  @override
  _TileRadioState createState() => _TileRadioState();
}

class _TileRadioState extends State<TileRadio> {
  var _selected;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: BackdropScaffold(
        title: Text('RadioListTile ပါ'),
        iconPosition: BackdropIconPosition.action,
        headerHeight: 0.0,
        frontLayerBorderRadius: BorderRadius.only(),
        frontLayer: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RadioListTile(
              title: Text('Radio'),
              subtitle: Text('Radio widgets wrapped in ListTile'),
              value: 1,
              groupValue: _selected,
              onChanged: (value) {
                setState(
                  () {
                    _selected = value;
                  },
                );
              },
            ),
            RadioListTile(
              title: Text('RadioListTile'),
              subtitle: Text(
                  'RadioListTile, which combines this widget with a ListTile'),
              value: 2,
              groupValue: _selected,
              onChanged: (value) {
                setState(
                  () {
                    _selected = value;
                  },
                );
              },
            ),
          ],
        ),
        backLayer: SourceCodeView(
          filePath: RADIO_TILE_PATH,
          codeLinkPrefix: GIT_PATH,
        ),
      ),
    );
  }
}
