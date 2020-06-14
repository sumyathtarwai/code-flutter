import 'package:bloc_page_demo/bloc/page/page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/color/color_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoc'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: buildButtonRow(context),
            ),
            BlocBuilder<ColorBloc, ColorState>(
              builder: (context, state) {
                var color = Colors.grey.shade300;
                if (state is ColorPaint) color = state.color;
                return Expanded(
                  flex: 6,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    color: color,
                  ),
                );
              },
            ),
            Expanded(
              child: FloatingActionButton(
                onPressed: () => Navigator.of(context).pushNamed('/next/1'),
                child: Text('Next'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        buildFlatButton(context, Colors.red, 'Red'),
        buildFlatButton(context, Colors.green, 'Green'),
        buildFlatButton(context, Colors.blue, 'Blue'),
        buildFlatButton(context, Colors.orange, 'Orange'),
      ],
    );
  }

  FlatButton buildFlatButton(BuildContext context, Color color, String title) {
    return FlatButton(
      onPressed: () =>
          BlocProvider.of<ColorBloc>(context).add(ChangeColor(color)),
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      color: color,
    );
  }
}
