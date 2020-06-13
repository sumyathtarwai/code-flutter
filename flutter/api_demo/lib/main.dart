import 'package:api_demo/network/service/rest_client.dart';
import 'package:api_demo/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var platformBrightnessMediaQuery = MediaQuery.platformBrightnessOf(context);
    // bool darkModeOn = platformBrightnessMediaQuery == Brightness.dark;

    return MultiProvider(
      providers: [
        Provider<RestClient>(
          create: (_) => RestClient.create(),
        ),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,
          canvasColor: Colors.blueGrey,
        ),
        home: Home(),
      ),
    );
  }
}
