part of 'add_watchlist_tv_bloc.dart';

abstract class AddWatchlistTvEvent extends Equatable {
  const AddWatchlistTvEvent();

  @override
  List<Object> get props => [];
}

class LoadWatchlistTvStatus extends AddWatchlistTvEvent {
  final int id;

  LoadWatchlistTvStatus(this.id);

  @override
  List<Object> get props => [id];
}

class AddWatchlistTv extends AddWatchlistTvEvent {
  final TvDetailModel tvData;
  AddWatchlistTv(this.tvData);

  @override
  List<Object> get props => [tvData];
}

class RemoveFromWatchlistTv extends AddWatchlistTvEvent {
  final TvDetailModel tvData;
  RemoveFromWatchlistTv(this.tvData);

  @override
  List<Object> get props => [tvData];
}
