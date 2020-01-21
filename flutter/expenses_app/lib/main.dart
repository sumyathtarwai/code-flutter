import 'package:flutter/material.dart';
import './view/expenses_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Color(0xff212121),
        primaryColor: Color(0xff212121),
        buttonColor: Color.fromRGBO(109, 114, 119, 0.8),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(255, 191, 0, 0.6),
          elevation: 6.0,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Expense(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => '',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
