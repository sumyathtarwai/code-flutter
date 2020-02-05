import 'package:flutter/material.dart';
import 'package:pl_players/home.dart';
import 'package:pl_players/player_notifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => PlayerNotifier(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      darkTheme: ThemeData(fontFamily: 'Roboto'),
      home: Home(),
    );
  }
}
