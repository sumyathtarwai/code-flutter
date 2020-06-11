import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_demo/ui/favorites_page.dart';

import './const.dart';
import './ui/categories_page.dart';
import 'models/dummy_data.dart';
import 'models/filter.dart';
import 'models/recipe.dart';
import 'ui/filter_page.dart';
import 'ui/recipe_detail.dart';
import 'ui/recipe_page.dart';
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filter _filter;
  List<Recipe> _favoriteList;
  get recipeList {
    if (_filter == null || _filter == Filter()) return dummyRecipe;

    return dummyRecipe.where(
      (e) {
        if (_filter.isGlutenFree && !e.isGlutenFree) return false;
        if (_filter.isVegan && !e.isVegan) return false;
        if (_filter.isVegetarian && !e.isVegetarian) return false;
        if (_filter.isLactoseFree && !e.isLactoseFree) return false;
        return true;
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      //home: Home(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => BottomTabs(
            currentFavorite: _favoriteList, favoriteSetting: _removeFavorite),
        recipePagePath: (ctx) => RecipePage(recipeList: recipeList),
        recipesDetailPath: (ctx) => RecipeDetail(
            favoriteList: _favoriteList, favoriteSetting: _toogleFavorite),
        favoritePath: (ctx) => FavoritesPage(
            current: _favoriteList, favoriteSetting: _removeFavorite),
        filterPath: (ctx) =>
            FilterPage(current: _filter, filterSetting: _filterSetting),
      },
    );
  }

  @override
  void initState() {
    _favoriteList = [];
    super.initState();
  }

  void _filterSetting(Filter newFilter) {
    setState(() => _filter = newFilter);
  }

  void _removeFavorite(String recipeId) {
    setState(() => _favoriteList.removeWhere((el) => el.id == recipeId));
  }

  void _toogleFavorite(String recipeId) {
    var index = _favoriteList?.indexWhere((el) => el.id == recipeId);
    if (index >= 0) {
      setState(() {
        _favoriteList.removeAt(index);
      });
    } else {
      setState(() {
        _favoriteList.add(dummyRecipe.firstWhere((el) => el.id == recipeId));
      });
    }
  }
}
