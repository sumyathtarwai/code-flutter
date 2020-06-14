import 'package:bloc_page_demo/bloc/page/page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoc'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: buildButtonRow(context),
            ),
            BlocListener<PageBloc, PageState>(
              listener: (ctx, state) {
                if (state is FirstPageState) {
                  Navigator.pushNamed(context, '/page/1');
                }
                if (state is SecondPageState) {
                  Navigator.pushNamed(context, '/page/2');
                }
              },
              //   bloc: PageBloc(),
              child: Expanded(
                flex: 6,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () => Navigator.of(context).pushNamed('/next/2'),
              child: Text('Next'),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(
          onPressed: () =>
              BlocProvider.of<PageBloc>(context).add(FirstPageEvent()),
          child: Text(
            'Page One',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
        ),
        FlatButton(
          onPressed: () => BlocProvider.of<PageBloc>(context).add(
            SecondPageEvent(),
          ),
          child: Text(
            'Page Two',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.green,
        ),
      ],
    );
  }
}
