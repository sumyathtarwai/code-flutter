import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_demo/ui/favorites_page.dart';

import './const.dart';
import './ui/categories_page.dart';
import 'ui/recipe_page.dart';
import 'ui/filter_page.dart';
import 'ui/recipe_detail.dart';
import 'widgets/bottom_tabs.dart';

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
          'Categories',
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
        '/': (ctx) => BottomTabs(),
        recipePagePath: (ctx) => RecipePage(),
        recipesDetailPath: (ctx) => RecipeDetail(),
        favoritePath: (ctx) => FavoritesPage(),
        filterPath: (ctx) => FilterPage(),
      },
    );
  }
}
