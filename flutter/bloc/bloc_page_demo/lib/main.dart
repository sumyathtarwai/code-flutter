import 'package:bloc_page_demo/bloc/page/page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/color/color_bloc.dart';
import 'bloc/data/data_bloc.dart';
import 'ui/first_page.dart';
import 'ui/home.dart';
import 'ui/next_data_page.dart';
import 'ui/next_page.dart';
import 'ui/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ColorBloc(),
        ),
        BlocProvider(
          create: (context) => PageBloc(),
        ),
        BlocProvider(
          create: (context) => DataBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
        routes: {
          '/next/1': (ctx) => NextPage(),
          '/page/1': (ctx) => FirstPage(),
          '/page/2': (ctx) => SecondPage(),
          '/next/2': (ctx) => DataPage(),
        },
      ),
    );
  }
}
