import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final GetPopularMovies getPopularMovies;

  PopularMovieBloc(this.getPopularMovies) : super(PopularMovieEmpty()) {
    on<OnLoadPopularMovie>(
      (event, emit) async {
        emit(PopularMovieLoading());

        final result = await getPopularMovies.execute();

        result.fold(
          (failure) {
            emit(PopularMovieError(failure.message));
          },
          (data) {
            emit(PopularMovieHasData(data));
          },
        );
      },
    );
  }
}
