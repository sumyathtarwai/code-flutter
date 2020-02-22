import 'package:book_moor/data/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryForm extends StatefulWidget {
  CategoryForm({Key key}) : super(key: key);

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppDatabase db = Provider.of<AppDatabase>(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter category name',
              //  prefixIcon: Icon(Icons.label_outline),
              contentPadding: const EdgeInsets.all(15.0),
            ),
            // autofocus: true,
            controller: controller,
            validator: (value) {
              if (value.isEmpty) {
                return 'Name cannot be empty!';
              } else if (value.length < 2) {
                return 'Please enter minimium 2 words!';
              }

              return null;
            },
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: RaisedButton(
              color: Colors.deepOrangeAccent,
              onPressed: () async {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data

                  // AppDatabase db = DatabaseHelper().db;
                  db.categoryDao.insertCategory(
                    Category(categoryName: controller.text, id: null),
                  );

                  print(controller.text);
                  controller.clear();
                }
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
