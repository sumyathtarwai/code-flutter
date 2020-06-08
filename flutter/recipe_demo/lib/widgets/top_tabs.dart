import 'package:flutter/material.dart';

import '../const.dart';
import '../ui/categories_page.dart';
import '../ui/favorites_page.dart';

class TopTabs extends StatelessWidget {
  const TopTabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Recipe',
            style: appTextStyle,
          ),
          bottom: TabBar(
            labelColor: Theme.of(context).iconTheme.color,
            unselectedLabelColor: Theme.of(context).primaryColorDark,
            tabs: <Tab>[
              Tab(
                icon: Icon(Icons.group_work),
                child: Text('Categories'),
              ),
              Tab(
                icon: Icon(Icons.grade),
                child: Text('Favorites'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesPage(),
            FavoritesPage(),
          ],
        ),
      ),
    );
  }
}
