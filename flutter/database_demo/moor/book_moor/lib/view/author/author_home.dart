import 'package:book_moor/view/author/author_form.dart';
import 'package:book_moor/view/author/author_list.dart';
import 'package:book_moor/view/drawer_widget.dart';
import 'package:flutter/material.dart';

class AuthorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      drawer: DrawerWidget(),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: AuthorForm(),
            ),
          ),
          Expanded(child: AuthorList()),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
