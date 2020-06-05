import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './const.dart';
import './ui/categories_page.dart';
import './widgets/gradient_appBar.dart';
import 'ui/categories_detail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(new MyApp());
  });
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(
        title: 'Recipe',
        textStyle: appTextStyle,
      ),
      body: Container(
        child: CategoriesPage(),
      ),
    );
  }
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
