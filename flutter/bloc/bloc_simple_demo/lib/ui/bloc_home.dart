import 'package:bloc_simple_demo/bloc/greeting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BlocHome extends StatelessWidget {
  const BlocHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bloc'),
      ),
      body: Column(
        children: <Widget>[
          Display(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                onPressed: () =>
                    BlocProvider.of<GreetingBloc>(context).add(HowdyEvent()),
                color: Colors.blueAccent,
                child: Text(
                  'Howdy',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FlatButton(
                onPressed: () =>
                    BlocProvider.of<GreetingBloc>(context).add(WhatUpEvent()),
                color: Colors.greenAccent,
                child: Text(
                  'What\'s Up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FlatButton(
                onPressed: () =>
                    BlocProvider.of<GreetingBloc>(context).add(RockEvent()),
                color: Colors.redAccent,
                child: Text(
                  'You\'re Rock',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Display extends StatelessWidget {
  const Display({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GreetingBloc, GreetingState>(
      builder: (context, state) {
        if (state is GreetingInitial)
          return Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(10),
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColorDark,
            ),
          );
        var greet;
        if (state is HowdyState) greet = state.msg;
        if (state is WhatUpState) greet = state.msg;
        if (state is RockState) greet = state.msg;
        if (state is ErrorState) greet = state.msg;
        return Container(
          height: 100,
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              '$greet',
              style: (state is ErrorState)
                  ? GoogleFonts.raleway(
                      fontSize: 40.0,
                      color: Colors.red,
                    )
                  : TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 40.0,
                    ),
            ),
          ),
        );
      },
    );
  }
}
