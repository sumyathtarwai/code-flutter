import 'package:flutter/material.dart';
import 'package:recipe_demo/const.dart';
import 'package:recipe_demo/ui/categories_page.dart';

import 'ui/categories_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,

      //home: Home(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => Home(),
        categoriesDetailPath: (ctx) => CategoriesDetail(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTextStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          child: Center(
            child: const Text(
              'Recipe',
              style: appTextStyle,
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColorLight,
                  Theme.of(context).primaryColorDark,
                ],
                begin: const FractionalOffset(1.0, 0.0),
                end: const FractionalOffset(0.5, 0.0),
                stops: [0.2, 3.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      body: Container(
        child: CategoriesPage(),
      ),
    );
  }
}
