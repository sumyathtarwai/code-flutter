part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object> get props => [];
}

class Empty extends SearchEvent {}

class FetchCity extends SearchEvent {
  final String keyword;
  const FetchCity(this.keyword) : assert(keyword != null);
}
