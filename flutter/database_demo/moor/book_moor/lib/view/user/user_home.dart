import 'package:book_moor/animation/scale_route.dart';
import 'package:book_moor/data/database.dart';
import 'package:book_moor/view/drawer_widget.dart';
import 'package:book_moor/view/user/user_form.dart';
import 'package:book_moor/view/user/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepOrange.shade50,
      appBar: AppBar(),
      drawer: DrawerWidget(),
      body: UserList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(context, ScaleRoute(page: UserForm()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
