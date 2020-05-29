import 'package:complex_api_demo/data/local/database.dart';
import 'package:complex_api_demo/network/service/rest_client.dart';
import 'package:complex_api_demo/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

void main() {
   Stetho.initialize();
  runApp(MyApp());
}

//https://thiha.tech/bp7y5yx5gamxdqttgyc/wp/v2/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => RestClient.create(),
        ),
        Provider(
          create: (_) => AppDatabase(),
          dispose: (_, db) => db.close(),
        ),
      ],
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
