import 'package:bloc_page_demo/bloc/data/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Page'),
      ),
      body: Builder(
        builder: (context) {
          return BlocListener<DataBloc, DataState>(
            listener: (ctx, state) {
              if (state is SuccessDataState) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Success!'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            child: BlocBuilder<DataBloc, DataState>(
              builder: (ctx, state) {
                if (state is DataInitial) {
                  return Center(
                    child: Text('Press Play Button'),
                  );
                }
                if (state is LoadingDataState) {
                  return Center(
                    child: Container(
                        margin: EdgeInsets.all(15),
                        child: CircularProgressIndicator()),
                  );
                }
                if (state is SuccessDataState) {
                  return Center(
                    child: Text('Success!'),
                  );
                }
                return Container();
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<DataBloc>(context).add(FecthData()),
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
