part of "detail_movie_bloc.dart";

abstract class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();
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
