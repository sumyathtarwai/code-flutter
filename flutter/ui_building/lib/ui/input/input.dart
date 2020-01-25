import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:ui_building/constants.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class InputHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: BackdropScaffold(
        title: Text(
          'Input Widgets အမျိုးအမျိုး',
          style: TextStyle(
            fontFamily: "MyanmarNayone",
            fontSize: 20.0,
          ),
        ),
        iconPosition: BackdropIconPosition.action,
        headerHeight: 0.0,
        frontLayerBorderRadius: BorderRadius.only(),
        frontLayer: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(50.0, 8, 15, 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Simple TextField',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(50.0, 8, 15, 8),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'This is hint',
                  labelText: 'This is label',
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(50.0, 8, 15, 18),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Simple TextField + OutlineInputBorder',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(50.0, 8, 15, 18),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Simple TextField + label',
                  hintText: 'Simple TextField + OutlineInputBorder',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.accessibility),
                  labelText: 'Simple TextField + label + icon',
                  hintText: 'Simple TextField + OutlineInputBorder',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(45.0, 18, 15, 18),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'label + BorderRadius.circular',
                  hintText: 'Simple TextField + OutlineInputBorder',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                    20.0,
                  )),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(45.0, 10, 15, 18),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'label + prefixIcon + suffixIcon',
                  hintText: 'fillColor + OutlineInputBorder',
                  prefixIcon: Icon(Icons.accessibility),
                  suffixIcon: Icon(Icons.info_outline),
                  fillColor: Colors.amber.shade100,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                    20.0,
                  )),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(50.0, 8, 15, 18),
              child: TextField(
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Feel like TextArea',
                  hintText: 'use maxLines',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        backLayer: SourceCodeView(
          filePath: INPUT_PATH,
          codeLinkPrefix: GIT_PATH,
        ),
      ),
    );
  }
}
