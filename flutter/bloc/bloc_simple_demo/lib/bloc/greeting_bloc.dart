import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'greeting_event.dart';
part 'greeting_state.dart';

class GreetingBloc extends Bloc<GreetingEvent, GreetingState> {
  static const greetingList = ['Howdy', 'What\'s up', 'You\'re rock', 'Error'];
  @override
  GreetingState get initialState => GreetingInitial();

  Future<String> getData(int index) async {
    return Future.delayed(Duration(seconds: 1), () => greetingList[index]);
  }

  @override
  Stream<GreetingState> mapEventToState(GreetingEvent event) async* {
    if (event is HowdyEvent) {
      yield GreetingInitial();
      yield HowdyState(await getData(0));
    }
    if (event is WhatUpEvent) {
      yield GreetingInitial();
      yield WhatUpState(await getData(1));
    }
    if (event is RockEvent) {
      yield GreetingInitial();
      yield RockState(await getData(2));
    }

    if (event is ErrorEvent) {
      yield GreetingInitial();
      yield ErrorState(await getData(3));
    }
  }
}
