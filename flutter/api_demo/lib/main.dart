import 'package:api_demo/network/service/rest_client.dart';
import 'package:api_demo/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RestClient>(
          create: (_) => RestClient.create(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Home(),
        
      ),
    );
  }
}
