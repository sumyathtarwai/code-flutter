import 'package:book_moor/animation/scale_route.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepOrange.shade400,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: SizedBox(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/drawer.jpg',
                  ),
                ),
              ),
            ),
            _buildNavi(context,
                icon: Icons.library_books, title: 'Category', routeName: '/'),

            _buildNavi(context,
                icon: Icons.supervised_user_circle,
                title: 'Author',
                routeName: '/author'),
            _buildNavi(context,
                icon: Icons.person_pin_circle,
                title: 'User',
                routeName: '/user'),
            // TODO
            _buildNavi(context,
                icon: Icons.book, title: 'Book', routeName: '/'),
            SizedBox(),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavi(BuildContext context,
      {IconData icon, String title, String routeName, Widget page}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      onTap: () {
        routeName != null
            ? Navigator.pushReplacementNamed(context, routeName)
            : Navigator.push(context, ScaleRoute(page: page));
      },
    );
  }
}
