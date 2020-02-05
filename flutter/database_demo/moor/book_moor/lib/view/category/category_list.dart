import 'package:book_moor/data/database.dart';
import 'package:book_moor/util/helper.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  AppDatabase _db;
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> _controller;
  List<FocusNode> _editFocus;
  List<bool> _enable;
  @override
  void initState() {
    _db = DatabaseHelper().db;
    _enable = [];
    _editFocus = [];
    _controller = [];
    super.initState();
  }

  StreamBuilder<List<Category>> _categoryList() {
    final borderStyle = Expanded(
      flex: 0,
      child: Container(
        width: 10.0,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.redAccent.shade400,
              width: 3.0,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 0),
            )
          ],
        ),
      ),
    );

    return StreamBuilder(
      // select
      stream: _db.categoryDao.watchAllCategories(),
      builder: (context, AsyncSnapshot<List<Category>> snapshot) {
        final categories = snapshot.data ?? List();
        // rest data
        _controller = [];
        _editFocus = [];

        return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (_, i) {
            final cat = categories[i];
            _controller.add(TextEditingController(text: cat.categoryName));
            _editFocus.add(FocusNode());
            _enable.add(false);
            // print('$i ${_controller[i].text}, ${_enable[i]}');
            return Container(
              height: 60.0,
              padding: EdgeInsets.only(left: 2.0),
              color: _getColor(i),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  borderStyle,
                  Expanded(
                    flex: 0,
                    child: Text(
                      '${i + 1} ',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      enabled: _enable[i],
                      controller: _controller[i],
                      focusNode: _editFocus[i],
                      autofocus: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Name cannot be empty!';
                        } else if (value.length < 2) {
                          return 'Please enter minimium 2 words!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: _enable[i] == true
                            ? editButton(i, cat)
                            : SizedBox(),
                      ),
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  // update
                  Expanded(
                    flex: 0,
                    child: IconButton(
                      iconSize: 20.0,
                      icon: Icon(
                        Icons.edit,
                        color: Colors.deepOrange,
                      ),
                      onPressed: () {
                        //  print('edit1 ${_controller[i].text}, ${_enable[i]}');
                        // focus to edit text
                        FocusScope.of(context).requestFocus(_editFocus[i]);
                        setState(() {
                          _enable[i] = true;
                        });
                        // print('edit2 ${_controller[i].text}, ${_enable[i]}');
                      },
                    ),
                  ),
                  //delete
                  Expanded(
                    flex: 0,
                    child: IconButton(
                      iconSize: 20.0,
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.deepOrange,
                      ),
                      onPressed: () {
                        _db.categoryDao.deleteCategory(cat);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  IconButton editButton(int i, Category cat) {
    return IconButton(
      icon: Icon(Icons.check),
      onPressed: () {
        editEnable(i, false);

        _db.categoryDao.updateCategory(
          cat.copyWith(
            categoryName: _controller[i].text,
            id: null,
          ),
        );
      },
    );
  }

  void editEnable(int i, bool enable) {
    setState(() {
      _enable[i] = enable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      child: _categoryList(),
    );
  }

  @override
  void dispose() {
    _controller.forEach((c) => c.dispose());
    //_controller = [];
    _editFocus.forEach((e) => e.dispose());
    // _editFocus = [];
    super.dispose();
  }

  Color _getColor(int i) {
    return i % 2 == 0 ? Colors.red.shade50 : Colors.red.shade100;
  }
}
