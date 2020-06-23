import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/modal.dart';
import 'package:shop_demo/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductNotifer(),
        ),
        ChangeNotifierProvider.value(
          value: CartNotifier(),
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
            button: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.brown),
        ),
        darkTheme: ThemeData(
            fontFamily: 'Roboto',
            iconTheme: IconThemeData(
              color: Colors.redAccent,
            ),
            brightness: Brightness.dark),
        routes: RouteName.route,
      ),
    );
  }
}
