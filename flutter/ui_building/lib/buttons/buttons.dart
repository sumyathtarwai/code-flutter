import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buttons Widgets အမျိုးအမျိုး',
          style: TextStyle(
            fontFamily: "MyanmarNayone",
            fontSize: 20.0,
          ),
        ),
      ),
      backgroundColor: Colors.indigo.shade100,
      body: Container(
        margin: EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            OutlineButton(
              child: Text('OUTLINE [Rectangle Border]'),
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
                child: Text('CONTAINER + FLAT [Fill Gradient + Round Border]'),
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
            _myDropDown(),
          ],
        ),
      ),
    );
  }
}

class _myDropDown extends StatefulWidget {
  _myDropDown({Key key}) : super(key: key);

  @override
  _myDropDownState createState() => _myDropDownState();
}

class _myDropDownState extends State<_myDropDown> {
  String _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: _dropDownValue == null
          ? Text('Dropdown')
          : Text(
              _dropDownValue,
              style: TextStyle(color: Colors.blue),
            ),
      isExpanded: true,
      iconSize: 30.0,
      style: TextStyle(color: Colors.blue),
      items: ['One', 'Two', 'Three'].map(
        (val) {
          return DropdownMenuItem<String>(
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
    );
  }
}
