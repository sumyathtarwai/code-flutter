import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:ui_building/constants.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class ButtonHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: BackdropScaffold(
        title: Text(
          'Buttons Widgets အမျိုးအမျိုး',
          style: TextStyle(
            fontFamily: "MyanmarNayone",
            fontSize: 20.0,
          ),
        ),
        iconPosition: BackdropIconPosition.none,
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.ellipsis_search,
          ),
        ],
        headerHeight: 0.0,
        frontLayerBorderRadius: BorderRadius.only(),
        frontLayer: Container(
          margin: EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              OutlineButton(
                child: Text(
                  'OUTLINE [Rectangle Border]',
                  style: TextStyle(
                    fontFamily: "MyanmarNayone",
                    fontSize: 20.0,
                  ),
                ),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 1.5,
                ),
                onPressed: () => '',
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              OutlineButton(
                child: Text('OUTLINE [Round Border]'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                ),
                onPressed: () => '',
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              FlatButton(
                child: Text('FLAT [Fill Color]'),
                color: Colors.red.shade200,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.redAccent,
                    width: 1.5,
                  ),
                ),
                onPressed: () => '',
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              FlatButton(
                child: Text('FLAT [Fill Color + Round Border]'),
                color: Colors.blue.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                    color: Colors.redAccent,
                    width: 1.5,
                  ),
                ),
                onPressed: () => '',
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green[800],
                      Colors.green[100],
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 1.5,
                  ),
                ),
                child: FlatButton(
                  child:
                      Text('CONTAINER + FLAT [Fill Gradient + Round Border]'),
                  onPressed: () => '',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              RaisedButton(
                child: Text('RAISED [Fill Color + Round Border]'),
                color: Colors.yellowAccent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                    color: Colors.redAccent,
                    width: 1.5,
                  ),
                ),
                onPressed: () => '',
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              MyDropDown(item: ['Java', 'Dart', 'Python']),
            ],
          ),
        ),
        backLayer: SourceCodeView(
          filePath: BUTTON_PATH,
          codeLinkPrefix: GIT_PATH,
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
    );
  }
}

class MyDropDown extends StatefulWidget {
  final List<String> item;

  MyDropDown({this.item});
  @override
  _MyDropDownState createState() => _MyDropDownState(item);
}

class _MyDropDownState extends State<MyDropDown> {
  String _dropDownValue;
  final List<String> item;
  _MyDropDownState(this.item);

  @override
  Widget build(BuildContext context) {
    return Theme(
      // override default color
      data: Theme.of(context).copyWith(
        canvasColor: Colors.deepPurple.shade300,
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20.0),
        color: Colors.deepPurple.shade200,
        child: DropdownButton(
          // trick non underline
          underline: SizedBox(),
          hint: _dropDownValue == null
              ? Text('Dropdown')
              : Text(_dropDownValue, style: TextStyle(color: Colors.white)),
          isExpanded: true,
          iconSize: 30.0,
          style: TextStyle(color: Colors.white),
          items: item.map(
            (val) {
              return DropdownMenuItem(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
              () {
                _dropDownValue = val;
              },
            );
          },
        ),
      ),
    );
  }
}
