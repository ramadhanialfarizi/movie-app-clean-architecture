import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:ditonton/presentation/bloc/movie/popular_movie/popular_movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'popular_movie_bloc_test.mocks.dart';

@GenerateMocks([
  GetPopularMovies,
])
void main() {
  late PopularMovieBloc popularMovieBloc;
  late MockGetPopularMovies mockGetPopularMovies;

  setUp(
    () {
      mockGetPopularMovies = MockGetPopularMovies();
      popularMovieBloc = PopularMovieBloc(mockGetPopularMovies);
    },
  );

  test(
    "initial data shoul empty",
    () {
      expect(popularMovieBloc.state, PopularMovieEmpty());
    },
  );

  group(
    "load data for popular movie",
    () {
      blocTest<PopularMovieBloc, PopularMovieState>(
        "success load data",
        build: () {
          when(mockGetPopularMovies.execute())
              .thenAnswer((_) async => Right(testMovieList));

          return popularMovieBloc;
        },
        act: (bloc) => bloc.add(OnLoadPopularMovie()),
        expect: () => [
          PopularMovieLoading(),
          PopularMovieHasData(testMovieList),
        ],
        verify: (bloc) {
          verify(mockGetPopularMovies.execute());
        },
      );

      blocTest<PopularMovieBloc, PopularMovieState>(
        "Failed load Data server error",
        build: () {
          when(mockGetPopularMovies.execute())
              .thenAnswer((_) async => Left(ServerFailure('')));

          return popularMovieBloc;
        },
        act: (bloc) => bloc.add(OnLoadPopularMovie()),
        expect: () => [
          PopularMovieLoading(),
          PopularMovieError(''),
        ],
        verify: (bloc) {
          verify(mockGetPopularMovies.execute());
        },
      );

      blocTest<PopularMovieBloc, PopularMovieState>(
        "Failed load Data connection failed",
        build: () {
          when(mockGetPopularMovies.execute()).thenAnswer((_) async => Left(
                ConnectionFailure('Failed to connect to the network'),
              ));

          return popularMovieBloc;
        },
        act: (bloc) => bloc.add(OnLoadPopularMovie()),
        expect: () => [
          PopularMovieLoading(),
          PopularMovieError('Failed to connect to the network'),
        ],
        verify: (bloc) {
          verify(mockGetPopularMovies.execute());
        },
      );
    },
  );
}
