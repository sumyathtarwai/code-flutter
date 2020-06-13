import 'package:bloc_simple_demo/bloc/greeting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/bloc_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const _title = 'My Bloc';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GreetingBloc>(
      create: (ctx) => GreetingBloc(),
      child: MaterialApp(
        title: _title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocHome(),
      ),
      lazy: true,
    );
  }
}
