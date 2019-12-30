import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var _count = 0;
  void increment() => setState(() => _count++);

  void decrement() => setState(() => _count--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello Widget State')),
      body: Center(child: Text("Hello Flutter $_count")),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(onPressed: increment, child: Icon(Icons.add, color: Colors.green), backgroundColor: Colors.orangeAccent),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          FloatingActionButton(onPressed: decrement, child: Icon(Icons.remove, color: Colors.red), backgroundColor: Colors.orangeAccent),
        ],
      ),
    );
  }
}
