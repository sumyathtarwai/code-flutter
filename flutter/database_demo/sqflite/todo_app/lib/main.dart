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
        body: Container(
          height: 500.0,
          child: ListView.builder(
            itemBuilder: (_, i) {
              return Container(
                margin: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5.0,
                  color: _getColor(i),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 0,
                        child: Container(
                          margin: EdgeInsets.only(right: 40.0),
                          width: 10.0,
                          height:
                              100.0, //FIXME calculate height flutter_staggered_grid_view 0.3.0
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.red.shade400,
                                Colors.redAccent.shade400,
                              ],
                              begin: Alignment.bottomRight,
                              end: Alignment.topRight,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(users[i].name),
                            Text(users[i].password),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: users.length,
          ),
        ),
      ),
    );
  }

  Color _getColor(int i) {
    return i % 2 == 0 ? Colors.amber.shade200 : Colors.amber.shade50;
  }
}
