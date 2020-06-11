import 'package:flutter/material.dart';
import 'package:recipe_demo/ui/favorites_page.dart';
import '../const.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Theme(
      data: ThemeData(
        canvasColor: Color.fromARGB(60, 90, 83, 255),
      ),
      child: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(height: media.size.height * 0.1),
            _buildListTile(context, Icons.home, 'Home',
                () => Navigator.pushReplacementNamed(context, '/')),
            //   Divider(color: Theme.of(context).primaryColorDark, ),
            _buildListTile(
              context,
              Icons.group_work,
              'Categories',
              () => Navigator.pushReplacementNamed(context, '/', arguments: 0),
            ),
            // _buildListTile(
            //   context,
            //   Icons.favorite,
            //   'Favorite',
            //   () => FavoritesPage(),
            // ),
            _buildListTile(
              context,
              Icons.filter_list,
              'Filter',
              () => Navigator.pushReplacementNamed(context, filterPath),
            ),
            //   Switch.adaptive(value: false, onChanged: (val) => {} , ),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(
      BuildContext ctx, IconData icon, String title, Function navigatePage) {
    final theme = Theme.of(ctx);
    return ListTile(
      leading: Icon(
        icon,
        color: theme.buttonColor,
      ),
      title: Text(
        title,
        style: theme.textTheme.subtitle1,
      ),
      onTap: navigatePage,
    );
  }
}
