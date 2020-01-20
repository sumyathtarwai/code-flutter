import 'package:flutter/material.dart';

class FormHome extends StatefulWidget {
  // MyApp({Key key}) : super(key: key);

  @override
  _FormHomeState createState() => _FormHomeState();
}

class _FormHomeState extends State<FormHome> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  var _nameTextController = TextEditingController(text: 'Mr.');
  var _color;
  @override
  void initState() {
    _color = Colors.blueGrey;
    _nameTextController.addListener(
      () => print(
        _nameTextController.text,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    // validate
                    validator: (value) {
                      if (value.length < 6) {
                        return "You need to add minimun 6 chars";
                      }
                      return null;
                    },
                    controller: _nameTextController,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: FlatButton(
                    child: Icon(
                      Icons.check,
                      color: _color,
                      size: 40.0,
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          _color = Colors.green;
                        });
                        print('OK');
                      } else {
                        setState(() {
                          _color = Colors.red;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
