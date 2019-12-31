import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String _name;
  final String _title;
  final String _ph;
  final String _email;

  MyCard(this._name, this._title, this._ph, this._email);

  @override
  Widget build(BuildContext context) {
    var avatarName = Text(
      _name,
      style: TextStyle(
        fontFamily: 'Dancing',
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey.shade800,
      ),
    );
    var avatarTitle = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          _title.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Source Sans Pro',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            letterSpacing: 1.5,
          ),
        ),
        Icon(Icons.code),
      ],
    );
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent.shade100,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildCircleAvatar('assets/avatar.png'),
              avatarName,
              avatarTitle,
              SizedBox(
                height: 30.0,
                width: 200.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              _buildCard(
                Icons.call,
                _ph,
              ),
              _buildCard(
                Icons.email,
                _email,
              ),
            ],
          ),
        ),
      ),
    );
  }

  CircleAvatar _buildCircleAvatar(String path) {
    return CircleAvatar(
      radius: 40.0,
      backgroundImage: AssetImage(path),
      backgroundColor: Colors.amber.shade800,
    );
  }

  Container _buildInfo(IconData icon, String info, double marginTop) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        30.0,
        marginTop,
        30.0,
        40.0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 50,
      ),
      color: Colors.yellow.shade700,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blue,
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            info,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }

  Widget _buildCard(IconData icon, String info) {
    // change container to Card
    // deleted padding properties, becuase Card doesn't has that
    // instead of that use [Padding] class
    // instead of [Row] class, use [ListTitle]
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
      color: Colors.yellow.shade700,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.blue,
          ),
          title: Text(
            info,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
