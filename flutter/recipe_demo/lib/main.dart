import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_demo/ui/favorites_page.dart';

import './const.dart';
import './ui/categories_page.dart';
import 'models/filter.dart';
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filter _filter;
  @override
  void initState() {
    _filter ??= Filter();

    super.initState();
  }

  void _filterSetting(Filter newFilter) {
    // setState(
    //   () {
    //     // _filter.update(filterVal.keys.first, (value) => filterVal.values.first);
    //     _filter.forEach((key, value) {
    //       _filter[key] = filterVal[key];
    //     });
    //   },
    // );

    setState(() => _filter = newFilter);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      //home: Home(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => BottomTabs(),
        recipePagePath: (ctx) => RecipePage(filter: _filter),
        recipesDetailPath: (ctx) => RecipeDetail(),
        favoritePath: (ctx) => FavoritesPage(),
        filterPath: (ctx) =>
            FilterPage(current: _filter, filterSetting: _filterSetting),
      },
    );
  }
}
