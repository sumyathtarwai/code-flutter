import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './const.dart';
import './ui/categories_page.dart';
import 'ui/categories_detail.dart';
import 'ui/recipe_detail.dart';
import 'widgets/top_tabs.dart';

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
      appBar: AppBar(
        title: Text(
          'Recipe',
          style: appTextStyle,
        ),
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
        '/': (ctx) => TopTabs(),
        categoriesDetailPath: (ctx) => CategoriesDetail(),
        recipesDetailPath: (ctx) => RecipeDetail(),
      },
    );
  }
}
