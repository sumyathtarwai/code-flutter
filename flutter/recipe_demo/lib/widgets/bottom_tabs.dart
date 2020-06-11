import 'package:flutter/material.dart';
import 'package:recipe_demo/models/recipe.dart';
import '../widgets/drawer_widget.dart';
import '../const.dart';
import '../ui/categories_page.dart';
import '../ui/favorites_page.dart';

class BottomTabs extends StatefulWidget {
  final Function favoriteSetting;
  final List<Recipe> currentFavorite;
  const BottomTabs({Key key, this.currentFavorite, this.favoriteSetting})
      : super(key: key);

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  _BottomTabsState();

  int _current;
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    _current = 0;
    _pages = [
      {
        'title': 'Categories',
        'icon': Icons.group_work,
        'page': CategoriesPage(),
      },
      {
        'title': 'Favorites',
        'icon': Icons.favorite_border,
        'page': FavoritesPage(
            current: widget.currentFavorite,
            favoriteSetting: widget.favoriteSetting),
      },
    ];
    super.initState();
  }

  void _updateIndex(int currentPage) {
    setState(() => _current = currentPage);
  }

  @override
  void didChangeDependencies() {
    var arg = ModalRoute.of(context).settings.arguments as int;
    if (arg != null) _current = arg;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        elevation: 0,
        title: Text(
          _pages[_current]['title'],
          style: appTextStyle,
        ),
      ),
      drawer: DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        items: [
          BottomNavigationBarItem(
            title: Text(_pages[0]['title']),
            icon: Icon(_pages[0]['icon']),
            activeIcon: Icon(
              _pages[0]['icon'],
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(_pages[1]['title']),
            icon: Icon(
              _pages[1]['icon'],
            ),
            activeIcon: Icon(
              _pages[1]['icon'],
              size: 30,
            ),
          ),
        ],
        onTap: _updateIndex,
        currentIndex: _current,
        selectedItemColor: Theme.of(context).iconTheme.color,
      ),
      body: _pages[_current]['page'],
    );
  }
}
