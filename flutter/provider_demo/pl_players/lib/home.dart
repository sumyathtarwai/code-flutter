import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            'assets/pl.png',
            color: Colors.white,
          ),
          titleSpacing: 30.0,
          title: Text('Premier League'),
        ),
        body: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Player Name',
                          hintText: 'Virgil van Dijk'),
                      validator: (val) =>
                          val.isEmpty ? 'Player Name is required' : null,
                      onSaved: (val) => '',
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Club', hintText: 'Liverpool'),
                      validator: (val) =>
                          val.isEmpty ? 'Club Name is required' : null,
                      onSaved: (val) => '',
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Position', hintText: 'Defender'),
                      validator: (val) =>
                          val.isEmpty ? 'Position is required' : null,
                      onSaved: (val) => '',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      onPressed: () => '',
                      child: Text('Save'),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return;
                },
              ),
            ),
          ],
        ));
  }
}
