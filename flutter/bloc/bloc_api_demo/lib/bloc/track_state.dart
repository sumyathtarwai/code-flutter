part of 'track_bloc.dart';

@immutable
abstract class TrackState {
  const TrackState();
}

class TrackInitial extends TrackState {}

class TrackLoading extends TrackState {}

class TrackLoaded extends TrackState {
  final List<Track> photos;
  TrackLoaded(this.photos);
}

class TrackFail extends TrackState {
  final Exception error;
  TrackFail(this.error);
}
