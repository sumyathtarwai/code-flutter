import 'package:book_moor/animation/scale_route.dart';
import 'package:book_moor/data/database.dart';
import 'package:book_moor/view/user/user_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final AppDatabase db = Provider.of(context);
    return StreamProvider<List<User>>(
      initialData: [],
      create: (_) => db.userDao.watchAllUsers(),
      child: Consumer<List<User>>(
        builder: (_, users, child) => _buildList(_, users),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<User> users) {
    final AppDatabase db = Provider.of<AppDatabase>(context);
    return ListView.builder(
      itemBuilder: (_, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepOrangeAccent,
              child: Text(users[index].userName[0].toUpperCase()),
            ),
            title: Text(users[index].userName),
            subtitle: Text(users[index].role),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.push(
                      context, ScaleRoute(page: UserForm(user: users[index]))),
                  icon: Icon(
                    Icons.mode_edit,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () => db.userDao.deleteUser(users[index]),
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) => _buildAlert(context, users[index]),
                    );
                  },
                  icon: Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: users.length,
    );
  }

  Widget _buildAlert(BuildContext context, User user) {
    return AlertDialog(
      title: const Text(
        'User Detail Information',
        textAlign: TextAlign.center,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('User: ${user.userName}'),
          Text('Birthday: ${DateFormat('dd/MM/yyyy').format(user.dob)}'),
          Text('Role: ${user.role}'),
          Text('Address: ${user.address}'),
          Text('Phone: ${user.phone}'),
        ],
      ),
      backgroundColor: Colors.deepOrange.shade100,
      actions: <Widget>[
        FlatButton(
          child: Icon(Icons.keyboard_backspace),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
