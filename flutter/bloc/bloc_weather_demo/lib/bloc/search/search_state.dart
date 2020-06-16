part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<City> cities;
  SearchSuccess(this.cities) : assert(cities != null);

  @override
  List<Object> get props => [cities];
}

class SearchFail extends SearchState {
  final Object e;
  SearchFail(this.e);
}
