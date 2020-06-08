import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';
import '../const.dart';
import '../ui/categories_page.dart';
import '../ui/favorites_page.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({Key key}) : super(key: key);

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  _BottomTabsState();

  int _current = 0;
  final List<Map<String, Object>> _pages = [
    {
      'title': 'Categories',
      'icon': Icons.group_work,
      'page': CategoriesPage(),
    },
    {
      'title': 'Favorites',
      'icon': Icons.favorite_border,
      'page': FavoritesPage(),
    },
  ];

  void _updateIndex(int currentPage) {
    setState(() => _current = currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        selectedFontSize: 16.0,
        selectedItemColor: Theme.of(context).iconTheme.color,
      ),
      body: _pages[_current]['page'],
    );
  }
}
