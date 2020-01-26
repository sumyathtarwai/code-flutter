import 'package:flutter/material.dart';
import 'package:ui_building/constants.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class SimpleAppbar extends StatelessWidget {
  final String title;

  const SimpleAppbar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 26.0,
          ),
        ),
      ),
      body: Container(
        child: SourceCodeView(
          filePath: APPBAR_SIMPLE_PATH,
          codeLinkPrefix: GIT_PATH,
        ),
      ),
    );
  }
}
