part of "watchlist_bloc.dart";

abstract class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object> get props => [];
}

class WatchlistInitial extends WatchlistState {}

class WatchlistUpdated extends WatchlistState {
  final bool isAddedToWatchlist;
  final String message;

  WatchlistUpdated(this.isAddedToWatchlist, this.message);

  @override
  List<Object> get props => [isAddedToWatchlist, message];
}

class WatchlistError extends WatchlistState {
  final String message;

  WatchlistError(this.message);

  @override
  List<Object> get props => [message];
}
