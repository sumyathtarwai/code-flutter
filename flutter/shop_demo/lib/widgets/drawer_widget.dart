import 'package:flutter/material.dart';
import 'package:shop_demo/pages/pages.dart';
import '../route.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'KAIMONO',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            Divider(color: Theme.of(context).accentColor),
            _buildListTile(
              context,
              Icons.home,
              'Home',
              () => Navigator.pushReplacementNamed(context, '/'),
            ),
            _buildListTile(
              context,
              Icons.shopping_basket,
              'Cart',
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.cart,
                ModalRoute.withName(RouteName.home),
              ),
            ),
            _buildListTile(
              context,
              Icons.favorite,
              'Favorite',
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductHome(
                    showOnlyFavorite: true,
                  ),
                ),
              ),
            ),
            _buildListTile(
              context,
              Icons.history,
              'Order History',
              () => Navigator.pushReplacementNamed(context, '/'),
            ),
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
        style: theme.textTheme.subtitle1.copyWith(
          color: Colors.white,
        ),
      ),
      onTap: navigatePage,
    );
  }
}
