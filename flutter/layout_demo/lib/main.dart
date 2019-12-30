import 'package:flutter/material.dart';
import 'package:layout_startup/ui/lake_demo.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Demo'),
        ),
        body: Lake(),
      ),
    );
  }
}
