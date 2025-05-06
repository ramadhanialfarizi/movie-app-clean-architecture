import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist_movie/watchlist_movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'watchlist_movie_bloc_test.mocks.dart';

@GenerateMocks([
  GetWatchlistMovies,
])
void main() {
  late WatchlistMovieBloc watchlistMovieBloc;
  late MockGetWatchlistMovies mockGetWatchlistMovies;

  setUp(
    () {
      mockGetWatchlistMovies = MockGetWatchlistMovies();
      watchlistMovieBloc = WatchlistMovieBloc(mockGetWatchlistMovies);
    },
  );

  test(
    "initial data shoul empty",
    () {
      expect(watchlistMovieBloc.state, WatchlistMovieEmpty());
    },
  );

  group(
    "loaded data from local db for watchlist",
    () {
      blocTest<WatchlistMovieBloc, WatchlistMovieState>(
        "success load data",
        build: () {
          when(mockGetWatchlistMovies.execute())
              .thenAnswer((_) async => Right(testMovieList));

          return watchlistMovieBloc;
        },
        act: (bloc) => bloc.add(OnLoadWatchlistMovie()),
        expect: () => [
          WatchlistMovieLoading(),
          WatchlistMovieHasData(testMovieList),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistMovies.execute());
        },
      );

      blocTest<WatchlistMovieBloc, WatchlistMovieState>(
        'emits [Loading, Error] when getWatchlistMovies fails',
        build: () {
          when(mockGetWatchlistMovies.execute()).thenAnswer(
              (_) async => Left(DatabaseFailure('Failed to get data')));
          return watchlistMovieBloc;
        },
        act: (bloc) => bloc.add(OnLoadWatchlistMovie()),
        expect: () => [
          WatchlistMovieLoading(),
          WatchlistMovieError('Failed to get data'),
        ],
      );
    },
  );
}
