import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  @override
  DataState get initialState => DataInitial();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if (event is FecthData) {
      yield LoadingDataState();
      await Future.delayed(Duration(seconds: 1));
      yield SuccessDataState();
    }
  }
}
