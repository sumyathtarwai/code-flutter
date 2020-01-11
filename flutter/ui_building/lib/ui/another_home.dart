import 'package:flutter/material.dart';

class AnotherHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var home = IconButton(
      icon: Icon(
        Icons.home,
        color: Colors.pink,
      ),
      onPressed: () => print('home click'),
    );
    var phone = IconButton(
      icon: Icon(
        Icons.phone,
        color: Colors.blueAccent,
      ),
      onPressed: () => print('Phone click'),
    );
    var move = IconButton(
      icon: Icon(
        Icons.more_vert,
        color: Colors.blueAccent,
      ),
      onPressed: () => print('Move click'),
    );

    return Scaffold(
      appBar: AppBar(
        leading: home,
        actions: <Widget>[
          phone,
          move,
        ],
        flexibleSpace: SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 80.0,
            color: Colors.blue.shade50,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            100.0,
          ),
          child: Container(
            color: Colors.blue.shade50,
            width: double.infinity,
            height: 100.0,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
