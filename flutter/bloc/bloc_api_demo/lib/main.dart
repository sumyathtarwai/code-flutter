import 'package:bloc_api_demo/bloc/track_bloc.dart';
import 'package:bloc_api_demo/network/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (ctx) => ApiService.create(),
      child: Consumer<ApiService>(
        builder: (context, value, child) {
          return BlocProvider(
            create: (ctx) => TrackBloc(value),
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
        },
      ),
      lazy: true,
    );
  }
}
