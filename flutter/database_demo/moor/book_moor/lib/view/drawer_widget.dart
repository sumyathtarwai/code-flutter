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
            buildListTile(context,
                icon: Icons.library_books, title: 'Category', routeName: '/'),
            buildListTile(context,
                icon: Icons.supervised_user_circle,
                title: 'Author',
                routeName: '/'),
            buildListTile(context,
                icon: Icons.person_pin_circle, title: 'User', routeName: '/'),
            buildListTile(context,
                icon: Icons.book, title: 'Book', routeName: '/'),
            SizedBox(),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(BuildContext context,
      {IconData icon, String title, String routeName}) {
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
        Navigator.pushReplacementNamed(context, routeName);
        //Navigator.of(context).pushNamed('/');
      },
    );
  }
}
