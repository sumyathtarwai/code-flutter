import 'package:book_moor/data/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  AppDatabase db;
  TextEditingController _controller;
  FocusNode _editFocus;
  bool _enable;
  int _index;
  @override
  Widget build(BuildContext context) {
    db = Provider.of<AppDatabase>(context);
    return Container(
      child: _categoryList(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _editFocus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // _db = DatabaseHelper().db;

    _editFocus = FocusNode();
    _controller = TextEditingController();
    super.initState();
  }

  void reset() {
    setState(() {
      _enable = false;
    });
  }

  Text _buildCount(int i) {
    return Text(
      '${i + 1} ',
      style: TextStyle(
        color: Colors.blueGrey,
        fontSize: 20.0,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Text _buildText(Category cat) {
    return Text(
      cat.categoryName,
      style: TextStyle(
        color: Colors.blueGrey,
        fontSize: 20.0,
      ),
    );
  }

  Widget _buildTypeInput(Category cat) {
    return TextFormField(
      enabled: _enable,
      controller: _controller,
      focusNode: _editFocus,
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
        suffixIcon: _confirmUpdate(cat),
      ),
      style: TextStyle(
        color: Colors.blueGrey,
        fontSize: 20.0,
      ),
    );
  }

  StreamBuilder<List<Category>> _categoryList() {
    final borderStyle = Expanded(
      flex: 0,
      child: Container(
        width: 20.0,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.redAccent.shade400,
              width: 5.0,
            ),
          ),
        ),
      ),
    );

    return StreamBuilder(
      // select
      stream: db.categoryDao.watchAllCategories(),
      builder: (context, AsyncSnapshot<List<Category>> snapshot) {
        final categories = snapshot.data ?? List();
        return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (_, i) {
            final cat = categories[i];
            return Container(
              height: MediaQuery.of(context).size.height * 0.06,
              padding: EdgeInsets.only(left: 6.0),
              color: _getColor(i),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  borderStyle,
                  Expanded(
                    flex: 0,
                    child: _buildCount(i),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 2,
                    child: _enable == true && i == _index
                        ? _buildTypeInput(cat)
                        : _buildText(cat),
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
                      onPressed: () => _editEnable(context, cat, i),
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
                      onPressed: () => db.categoryDao.deleteCategory(cat),
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

  IconButton _confirmUpdate(Category cat) {
    return IconButton(
      icon: Icon(Icons.check),
      onPressed: () {
        reset();
        // if nothing change do nothing
        if (_controller.text == cat.categoryName) return;

        db.categoryDao.updateCategory(
          cat.copyWith(
            categoryName: _controller.text,
            id: null,
          ),
        );
      },
    );
  }

  Color _getColor(int i) {
    return i % 2 == 0 ? Colors.red.shade50 : Colors.red.shade100;
  }

  void _editEnable(BuildContext context, Category cat, int i) {
    // focus to edit text
    FocusScope.of(context).requestFocus(_editFocus);
    setState(() {
      // repaint to textfield
      _enable = true;
      // mark which item need to repaint
      _index = i;
      _controller.text = cat.categoryName;
    });
  }
}
