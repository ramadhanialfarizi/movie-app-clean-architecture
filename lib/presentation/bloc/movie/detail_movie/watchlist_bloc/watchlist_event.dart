part of "watchlist_bloc.dart";

abstract class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List<Object> get props => [];
}

class AddToWatchlist extends WatchlistEvent {
  final MovieDetail movie;
  AddToWatchlist(this.movie);

  @override
  List<Object> get props => [movie];
}

class RemoveFromWatchlist extends WatchlistEvent {
  final MovieDetail movie;
  RemoveFromWatchlist(this.movie);

  @override
  List<Object> get props => [movie];
}

class LoadWatchlistStatus extends WatchlistEvent {
  final int id;

  LoadWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}
