import 'package:flutter/material.dart';

import 'modal/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Product(id: '23').size);
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                child: AppBar(
                  title: Text(
                    'Kaimono',
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.transparent,
                  iconTheme: Theme.of(context).iconTheme,
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.blueGrey,
        ),
      ),
      darkTheme: ThemeData(
          iconTheme: IconThemeData(
            color: Colors.redAccent,
          ),
          brightness: Brightness.dark),
    );
  }
}
