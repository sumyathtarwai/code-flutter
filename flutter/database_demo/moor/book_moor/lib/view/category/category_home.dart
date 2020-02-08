import 'package:book_moor/view/category/category_form.dart';
import 'package:book_moor/view/category/category_list.dart';
import 'package:book_moor/view/drawer_widget.dart';
import 'package:flutter/material.dart';

class CategoryHome extends StatelessWidget {
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
              child: CategoryForm(),
            ),
          ),
          Expanded(child: CategoryList()),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
