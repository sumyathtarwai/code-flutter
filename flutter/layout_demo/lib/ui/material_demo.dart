import 'package:flutter/material.dart';

class MyMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Layout'),
              Icon(
                Icons.star,
                color: Colors.amberAccent[400],
              )
            ],
          )),
    );
  }
}
