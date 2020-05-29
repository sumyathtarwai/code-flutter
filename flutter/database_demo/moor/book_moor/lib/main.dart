import 'package:book_moor/data/database.dart';
import 'package:book_moor/view/author/author_home.dart';
import 'package:book_moor/view/category/category_home.dart';
import 'package:book_moor/view/user/user_form.dart';
import 'package:book_moor/view/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:provider/provider.dart';

void main() {
  Stetho.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppDatabase(),
      dispose: (_, db) => db.close(),
      child: MaterialApp(
        // title: 'Moor Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            color: Colors.deepOrange,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30.0,
          ),
          primaryIconTheme: IconThemeData(
            color: Colors.white,
            size: 30.0,
          ),
          fontFamily: 'Roboto',
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => CategoryHome(),
          '/user': (_) => UserHome(),
          '/user/form': (_) => UserForm(),
          '/author': (_) => AuthorHome(),
        },
      ),
    );
  }
}
