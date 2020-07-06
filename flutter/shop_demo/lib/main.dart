import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './provider/modal.dart';
import 'package:shop_demo/route.dart';

import 'service_locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider(
        //   create: (_) => RestClient(Dio()),
        // ),
        ChangeNotifierProvider.value(
          value: ProductList(),
        ),
        ChangeNotifierProvider.value(
          value: CartList(),
        ),
        ChangeNotifierProvider.value(
          value: OrderList(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: Colors.indigo,
          accentColor: Colors.redAccent,
          brightness: Brightness.light,
          buttonColor: Colors.redAccent.shade400,
          textTheme: TextTheme(
            button: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.brown),
        ),
        darkTheme: ThemeData(
            fontFamily: 'Roboto',
            iconTheme: IconThemeData(color: Colors.white),
            buttonColor: Colors.redAccent.shade400,
            brightness: Brightness.dark),
        routes: RouteName.route,
      ),
    );
  }
}
