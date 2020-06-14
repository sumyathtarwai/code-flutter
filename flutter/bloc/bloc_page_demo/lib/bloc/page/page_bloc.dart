import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => PageInitial();

  @override
  Stream<PageState> mapEventToState(PageEvent event) async* {
    if (event is FirstPageEvent) yield FirstPageState();
    if (event is SecondPageEvent) yield SecondPageState();
  }
}
