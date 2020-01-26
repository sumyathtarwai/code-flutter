import 'package:flutter/material.dart';
import 'package:ui_building/constants.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class SearchAppBar extends StatefulWidget {
  final String title;
  const SearchAppBar({Key key, this.title}) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState(this.title);
}

class _SearchAppBarState extends State<SearchAppBar> {
  final title;

  Function _build;

  _SearchAppBarState(this.title);
  @override
  void initState() {
    _build = _buildEmpty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 26.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.live_tv),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(
                () {
                  _build = _buildSearchBar;
                },
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Builder(
            builder: (context) {
              return _build();
            },
          ),
        ),
      ),
      body: Container(
        child: SourceCodeView(
          filePath: APPBAR_SEARCH_PATH,
          codeLinkPrefix: GIT_PATH,
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return SizedBox();
  }

  Widget _buildSearchBar() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 300.0,
          height: 50.0,
          margin: EdgeInsets.only(left: 20.0),
          padding: EdgeInsets.only(bottom: 10.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              hintText: 'PL',
              fillColor: Colors.amber.shade200,
              filled: true,
              prefixIcon: Icon(
                Icons.search,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10.0),
          child: FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              setState(
                () {
                  _build = _buildEmpty;
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
