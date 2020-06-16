import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_weather_demo/network/modal/city.dart';
import '../../network/api_service.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiService api;

  SearchBloc({this.api}) : assert(api != null);
  @override
  SearchState get initialState => SearchInitial();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is FetchCity) {
      try {
        yield SearchLoading();
        final cities = await api.getLocation(event.keyword);
        yield SearchSuccess(cities);
      } catch (e) {
        yield SearchFail(e);
      }
    } else {
      yield SearchInitial();
    }
  }
}
