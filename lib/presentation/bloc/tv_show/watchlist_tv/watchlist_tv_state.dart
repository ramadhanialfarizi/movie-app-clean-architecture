part of 'watchlist_tv_bloc.dart';

abstract class WatchlistTvState extends Equatable {
  const WatchlistTvState();

  @override
  List<Object?> get props => [];
}

class WatchlistTvEmpty extends WatchlistTvState {}

class WatchlistTvLoading extends WatchlistTvState {}

class WatchlistTvHasData extends WatchlistTvState {
  final List<TvWatchlistModel> result;

  WatchlistTvHasData(this.result);

  @override
  List<Object> get props => [result];
}
