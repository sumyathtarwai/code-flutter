import 'package:flutter/material.dart';
import 'package:recipe_demo/const.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor themeColor = const MaterialColor(0xFF9686FF, defaultTheme);
final ThemeData themeData = ThemeData(
  primarySwatch: themeColor,
  buttonColor: btnColor,
  textTheme: TextTheme(
    headline5: TextStyle(
      fontFamily: fontName,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: TextStyle(
      fontFamily: fontName,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontFamily: fontName,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    subtitle2: TextStyle(
      fontFamily: fontName,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText1: TextStyle(
      fontFamily: fontName,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontFamily: fontName,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    button: TextStyle(
      fontFamily: fontName,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Demo',
      theme: themeData,
      home: MyHomePage(title: 'Recipe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FlatButton(
          color: Theme.of(context).buttonColor,
          textColor: Theme.of(context).textTheme.button.color,
          onPressed: () => {},
          child: Text('data'),
        ),
      ),
    );
  }
}
