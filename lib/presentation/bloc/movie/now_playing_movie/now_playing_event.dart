part of "now_playing_bloc.dart";

abstract class NowPlayingEvent extends Equatable {
  const NowPlayingEvent();

  @override
  List<Object> get props => [];
}

class OnLoadNowPlaying extends NowPlayingEvent {
  const OnLoadNowPlaying();

  @override
  List<Object> get props => [];
}
