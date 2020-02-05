import 'package:flutter/material.dart';
import 'package:todo_app/model/user_table.dart';
import 'package:todo_app/utils/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = DatabaseHelper();
  //var result = await db.insertUser(Users('Tom', 'thi\$i\$tom'));
  // debugPrint('[insert] $result');

  List<Map<String, dynamic>> users = await db.getAllUser();
  List<Users> userList = [];
  for (int i = 0; i < users.length; i++) {
    userList.add(Users.mapper(users[i]));
    print(users[i]);
  }

  runApp(AppHome(users: userList));
}

class AppHome extends StatelessWidget {
  final List<Users> users;
  const AppHome({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 50.0,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(15.0),
              color: Colors.blue.shade50,
              child: Text(users.length.toString()),
            ),
            Container(
              height: 500.0,
              child: ListView.builder(
                itemBuilder: (_, i) {
                  return Container(
                    color: _getColor(i),
                    child: ListTile(
                      title: Text(users[i].name),
                    ),
                  );
                },
                itemCount: users.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _getColor(int i) {
    return i % 2 == 0 ? Colors.amber.shade200 : Colors.amber.shade50;
  }
}
