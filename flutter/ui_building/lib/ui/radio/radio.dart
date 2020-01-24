import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:widget_with_codeview/source_code_view.dart';

import '../../constants.dart';

class RadioButtonHome extends StatelessWidget {
  const RadioButtonHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        title: Text(
          'Radio Buttons Widgets အမျိုးအမျိုး',
          style: TextStyle(
            fontFamily: "MyanmarNayone",
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            OutlineButton(
              child: Text(
                'Simple Radio',
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => _SimpleRadio(),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            OutlineButton(
              child: Text(
                'RadioListTile',
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => _TileRadio(),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            OutlineButton(
              child: Text(
                'Custom Radio [With Image]',
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => _ImageRadio(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SimpleRadio extends StatefulWidget {
  _SimpleRadio({Key key}) : super(key: key);

  @override
  __SimpleRadioState createState() => __SimpleRadioState();
}

class __SimpleRadioState extends State<_SimpleRadio> {
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
        filePath: Radio_PATH,
        codeLinkPrefix: GIT_PATH,
      ),
    );
  }
}

class _TileRadio extends StatefulWidget {
  _TileRadio({Key key}) : super(key: key);

  @override
  __TileRadioState createState() => __TileRadioState();
}

class __TileRadioState extends State<_TileRadio> {
  var _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioListTile ပါ'),
      ),
      body: Column(
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
    );
  }
}

class _ImageRadio extends StatefulWidget {
  _ImageRadio({Key key}) : super(key: key);

  @override
  _ImageRadioState createState() => _ImageRadioState();
}

class _ImageRadioState extends State<_ImageRadio> {
  var _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio + InkWell ပါ'),
      ),
      body: ListView(
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
    );
  }
}
