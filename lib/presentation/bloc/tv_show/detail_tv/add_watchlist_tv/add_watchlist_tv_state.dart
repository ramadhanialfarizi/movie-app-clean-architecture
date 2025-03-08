part of 'add_watchlist_tv_bloc.dart';

abstract class AddWatchlistTvState extends Equatable {
  const AddWatchlistTvState();

  @override
  List<Object> get props => [];
}

class AddWatchlistTvInitial extends AddWatchlistTvState {}

class AddWatchlistTvLoaded extends AddWatchlistTvState {
  final bool isAddedToWatchlist;

  AddWatchlistTvLoaded(this.isAddedToWatchlist);

  @override
  List<Object> get props => [isAddedToWatchlist];
}

class AddWatchlistTvUpdated extends AddWatchlistTvState {
  final bool isAddedToWatchlist;
  final String message;

  AddWatchlistTvUpdated(this.isAddedToWatchlist, this.message);

  @override
  List<Object> get props => [isAddedToWatchlist, message];
}

class AddWatchlistTvError extends AddWatchlistTvState {
  final String message;

  AddWatchlistTvError(this.message);

  @override
  List<Object> get props => [message];
}
