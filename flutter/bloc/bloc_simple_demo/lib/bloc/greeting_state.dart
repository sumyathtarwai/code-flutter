part of 'greeting_bloc.dart';

@immutable
abstract class GreetingState {}

class GreetingInitial extends GreetingState {}

class HowdyState extends GreetingState {
  final String msg;
  HowdyState(this.msg);
}

class WhatUpState extends GreetingState {
  final String msg;
  WhatUpState(this.msg);
}

class RockState extends GreetingState {
  final String msg;
  RockState(this.msg);
}

class ErrorState extends GreetingState {
  final String msg;
  ErrorState(this.msg);
}
