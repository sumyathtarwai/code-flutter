import 'package:flutter/material.dart';
import 'package:ui_building/constants.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class ActionAppBar extends StatelessWidget {
  final String title;

  const ActionAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Bebas Neue',
                fontSize: 26.0,
              ),
            ),
            Text(
              'All Games',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
          ],
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
        ],

        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(20.0),
        //   child: Text(''),
        // ),
      ),
      body: Container(
        child: SourceCodeView(
          filePath: APPBAR_ACTION_PATH,
          codeLinkPrefix: GIT_PATH,
        ),
      ),
    );
  }
}
