part of "detail_movie_bloc.dart";

abstract class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();

  @override
  List<Object> get props => [];
}

class OnLoadDetailMovie extends DetailMovieEvent {
  final int id;

  OnLoadDetailMovie(this.id);

  @override
  List<Object> get props => [id];
}

class OnLoadRecommendedMovie extends DetailMovieEvent {
  final int id;

  OnLoadRecommendedMovie(this.id);

  @override
  List<Object> get props => [id];
}

class AddToWatchlist extends DetailMovieEvent {
  final MovieDetail movie;
  AddToWatchlist(this.movie);

  @override
  List<Object> get props => [movie];
}

class RemoveFromWatchlist extends DetailMovieEvent {
  final MovieDetail movie;
  RemoveFromWatchlist(this.movie);

  @override
  List<Object> get props => [movie];
}

class LoadWatchlistStatus extends DetailMovieEvent {
  final int id;

  LoadWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}
