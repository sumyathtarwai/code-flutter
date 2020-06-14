part of 'data_bloc.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}

class LoadingDataState extends DataState {}

class SuccessDataState extends DataState {}
