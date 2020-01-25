import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:ui_building/constants.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class CustomRadio extends StatefulWidget {
  CustomRadio({Key key}) : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  var _selected;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: BackdropScaffold(
        title: Text('Radio + InkWell ပါ'),
        iconPosition: BackdropIconPosition.action,
        headerHeight: 0.0,
        frontLayerBorderRadius: BorderRadius.only(),
        frontLayer: ListView(
          children: <Widget>[
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(
                  () {
                    _selected = 1;
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.all(
                  20.0,
                ),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: _selected,
                      onChanged: (v) {
                        setState(
                          () {
                            _selected = v;
                          },
                        );
                      },
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.png'),
                      radius: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Alice'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(
                  () {
                    _selected = 2;
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.all(
                  20.0,
                ),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: _selected,
                      onChanged: (v) {
                        setState(
                          () {
                            _selected = v;
                          },
                        );
                      },
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/tom.jpg'),
                      radius: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('John'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(
                  () {
                    _selected = 3;
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.all(
                  20.0,
                ),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 3,
                      groupValue: _selected,
                      onChanged: (v) {
                        setState(
                          () {
                            _selected = v;
                          },
                        );
                      },
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/jerry.png'),
                      radius: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Jerry'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        backLayer: SourceCodeView(
          filePath: RADIO_CUSTOM_PATH,
          codeLinkPrefix: GIT_PATH,
        ),
      ),
    );
  }
}
