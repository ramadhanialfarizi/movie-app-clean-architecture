part of 'detail_movie_bloc.dart';

abstract class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

/// DETAIL MOVIE STATE
class DetailMovieEmpty extends DetailMovieState {}

class DetailMovieLoading extends DetailMovieState {}

class DetailMovieError extends DetailMovieState {
  final String message;

  DetailMovieError(this.message);

  @override
  List<Object> get props => [message];
}

class DetailMovieHasData extends DetailMovieState {
  final MovieDetail result;
  final List<Movie> movieRecommendations;

  DetailMovieHasData(
    this.result,
    this.movieRecommendations,
  );

  @override
  List<Object> get props => [result];
}

/// WATCHLIST STATE
class WatchlistUpdated extends DetailMovieState {
  final bool isAddedToWatchlist;
  final String? message;

  WatchlistUpdated(this.isAddedToWatchlist, this.message);
}

class WatchlistError extends DetailMovieState {
  final String message;

  WatchlistError(this.message);

  @override
  List<Object> get props => [message];
}
