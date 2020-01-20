import 'package:advanced_ui/ui/FirstStateWidget.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var firstColor;
  var secondColor;
  @override
  void initState() {
    print('initState');
    firstColor = Colors.amber;
    secondColor = Colors.deepOrange;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const _TitleWidget(),
              _SubTitleWidget(firstColor: firstColor),
              _buildContainer(color: secondColor),
              _buildContainer(color: firstColor),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            setState(() {
              if (firstColor != Colors.deepOrange &&
                  secondColor != Colors.amber) {
                firstColor = Colors.deepOrange;
                secondColor = Colors.amber;
              } else {
                firstColor = Colors.amber;
                secondColor = Colors.deepOrange;
              }
            });
          },
        ),
      ),
    );
  }

  Container _buildContainer({Color color}) {
    return Container(
      width: double.infinity,
      height: 200,
      color: color,
    );
  }
}

class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget({
    Key key,
    @required this.firstColor,
  }) : super(key: key);

  final firstColor;

  @override
  Widget build(BuildContext context) {
    print('_SubTitleWidget');
    return Container(
      width: double.infinity,
      height: 200,
      color: firstColor,
      child: Center(
        child: Text(
          'こにちは',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
          ),
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();
  @override
  Widget build(BuildContext context) {
    print('_TitleWidget');
    return FirstStateWidget();
  }
}
