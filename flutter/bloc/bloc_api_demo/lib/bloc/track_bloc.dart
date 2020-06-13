import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_api_demo/network/api_service.dart';
import 'package:bloc_api_demo/network/modal/track.dart';
import 'package:meta/meta.dart';

part 'track_event.dart';
part 'track_state.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  final ApiService api;

  TrackBloc(this.api);

  @override
  TrackState get initialState => TrackInitial();

  @override
  Stream<TrackState> mapEventToState(TrackEvent event) async* {
    if (event is GetTrack) {
      try {
        if (state is TrackInitial) {}
        yield TrackLoading();
        final photos = await api.getPhotos();
        yield TrackLoaded(photos);
      } catch (e) {
        yield TrackFail(e);
      }
    }
  }
}
